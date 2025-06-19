//
//  ViewController.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/11/25.
//

import UIKit

class MainViewController: UIViewController {
    
    private let dataService = DataService()
    private var mainView = MainView()
    var books: [Book] = []
    
    var series: Int = 2
    var isExpanded: Bool = true
    
    override func loadView() {
        self.view = mainView
        mainView.summeryExpandButton.addTarget(self, action: #selector(handleExpandSummery), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooks()
        updateUI()
    }
    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                // UI 변경은 반드시 메인 스레드에서 이루어져야 하므로,
                // 혹시 모를 백그라운드 스레드 실행에 대비해 메인 스레드로 작업을 넘기는 코드
                DispatchQueue.main.async {
                    self.books = books
                    self.updateUI()
                }
                
            case .failure(let error):
                print("❌ 에러 발생: \(error)")
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "데이터를 불러오지 못했습니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }

    func formatDate(_ raw: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // 영문 월 표기 위해 추가
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: raw) {
            formatter.dateFormat = "MMM d, yyyy"
            return formatter.string(from: date)
        }
        return raw
    }
    
    @objc func handleExpandSummery() {
        isExpanded.toggle()
        updateUI()
    }
    
    
    
    func updateUI() {
        guard books.indices.contains(series) else { return }
        let books = books[series]
        let formattedDate = self.formatDate(books.release_date)
        self.mainView.configure(
            with: books,
            series: series,
            isExpanded: isExpanded,
            formattedDate: formattedDate
        )
    }
}
