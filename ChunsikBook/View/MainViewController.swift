//
//  ViewController.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/11/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let dataService = DataService()
    
    var series: Int = 0
    var booktitleView = UILabel()
    var seriesStackView = UIStackView()
    var seriesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        addViewUI()
        seriesAddButton()
        setConstaints()
        
    }
    
    func configureUI() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                booktitleView.text = books[series].title
                booktitleView.textAlignment = .center
                booktitleView.font = .boldSystemFont(ofSize: 24)
                booktitleView.numberOfLines = 0 // 무제한 줄 설정
                booktitleView.lineBreakMode = .byWordWrapping // 단위 단위 줄바꿈
                
                seriesStackView.axis = .horizontal
                seriesStackView.spacing = 10
                seriesStackView.alignment = .center
                seriesStackView.distribution = .fillProportionally
                
                seriesButton.setTitle("\(series + 1)", for: .normal)
                seriesButton.setTitleColor(.white, for: .normal)
                seriesButton.titleLabel?.textAlignment = .center
                seriesButton.backgroundColor = .systemBlue
                seriesButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
                seriesButton.layer.cornerRadius = 25
                seriesButton.clipsToBounds = true
                
            case .failure(let error):
                print("❌ 에러 발생: \(error)")
                
            }
        }
    }
    
    func addViewUI() {
        [booktitleView, seriesStackView].forEach {
            view.addSubview($0)
        }
    }
    
    func seriesAddButton() {
        [seriesButton].forEach{
            seriesStackView.addArrangedSubview($0)
        }
    }
    
    func setConstaints() {
        booktitleView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        seriesStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(booktitleView.snp.bottom).offset(16)
        }
        
        seriesButton.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }
        
    }
    
}
