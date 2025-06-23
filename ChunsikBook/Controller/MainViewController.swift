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
    private var books: [Book] = []
    
    private var selectSeries: Int = 0
    private var isExpanded: [Bool] = []
    
    override func loadView() {
        view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectSeries = UserDefaults.standard.integer(forKey: "selectSeries")
        if let saved = UserDefaults.standard.array(forKey: "isExpandedSummary") as? [Bool] {
            isExpanded = saved
        }
        loadBooks()
        
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
                    self.isExpanded = Array(repeating: false, count: books.count)
                    self.mainView.createSeriesButton(seriesCount: books.count)
                    self.mainView.setChapterConfigure(with: books)
                    
                    UserDefaults.standard.set(self.isExpanded, forKey: "isExpandedSummary")
                    self.mainView.summaryExpandButton.addTarget(self, action: #selector(self.handleExpandSummary), for: .touchUpInside)
                    
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
    
    @objc func handleExpandSummary() {
        isExpanded[selectSeries].toggle()
        UserDefaults.standard.set(isExpanded, forKey: "isExpandedSummary")
        mainView.summaryconfigure(with: books[selectSeries], isExpanded: isExpanded[selectSeries])
    }
    
    @objc func handleSeries(_ sender: UIButton) {
        selectSeries = sender.tag
        UserDefaults.standard.set(selectSeries, forKey: "selectSeries")
        mainView.scrollView.setContentOffset(.zero, animated: true)
        
        updateUI()
    }
    
    func seriesButtonActions() {
        mainView.seriesStackView.arrangedSubviews.forEach { view in
            guard let button = view as? UIButton else { return }
            button.addTarget(self, action: #selector(handleSeries(_:)), for: .touchUpInside)
            
            let isSelected = (button.tag == selectSeries)
            UIView.animate(withDuration: 0.2) {
                button.backgroundColor = isSelected ? UIColor.systemBlue.withAlphaComponent(0.4) : .systemBlue
            }
        }
    }
    
    
    func updateUI() {
        guard books.indices.contains(selectSeries) else { return }
        let book = books[selectSeries]
        let seriesCount = books.count
        let formattedDate = self.formatDate(book.release_date)
        mainView.configure(
            with: book,
            selectSeries: selectSeries,
            isExpanded: isExpanded[selectSeries],
            formattedDate: formattedDate,
            seriesCount: seriesCount
        )
        seriesButtonActions()
    }
}
