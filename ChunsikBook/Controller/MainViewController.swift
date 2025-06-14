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
    
    var series: Int = 0
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                    self.mainView.booktitleLabel.text = books[self.series].title
                    self.mainView.seriesButton.setTitle("\(self.series + 1)", for: .normal)
                    let imageName = "harrypotter\(self.series + 1)"
                    if let image = UIImage(named: imageName) {
                        self.mainView.bookimageView.image = image
                    } else {
                        print("🚫 이미지 로딩 실패: \(imageName)")
                    }
                    self.mainView.titleLabel.text = books[self.series].title
                    self.mainView.authorLabel.text = books[self.series].author
                    self.mainView.releasedLabel.text = books[self.series].release_date
                    self.mainView.pageLabel.text = String(books[self.series].pages)
                    
                }
                
            case .failure(let error):
                print("❌ 에러 발생: \(error)")
                
            }
        }
    }
    
    
    
    
    
    
    
}
