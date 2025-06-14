//
//  MainView.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/15/25.
//
import UIKit
import SnapKit

class MainView: UIView {
    
    var booktitleLabel = UILabel()
    var seriesStackView = UIStackView()
    var seriesButton = UIButton()
    var bookinfoStackView = UIStackView()
    var bookimageView = UIImageView()
    var infoStackView = UIStackView()
    var titleLabel = UILabel()
    var authorStackView = UIStackView()
    var authortitleLabel = UILabel()
    var authorLabel = UILabel()
    var releasedStackView = UIStackView()
    var releasedtitleLabel = UILabel()
    var releasedLabel = UILabel()
    var pageStackView = UIStackView()
    var pagetitleLabel = UILabel()
    var pageLabel = UILabel()
    
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addViewUI()
        setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backgroundColor = .white
        
        booktitleLabel.textAlignment = .center
        booktitleLabel.font = .boldSystemFont(ofSize: 24)
        booktitleLabel.numberOfLines = 0 // 무제한 줄 설정
        booktitleLabel.lineBreakMode = .byWordWrapping // 단위 단위 줄바꿈
        
        seriesStackView.axis = .horizontal
        seriesStackView.spacing = 10
        seriesStackView.alignment = .center
        seriesStackView.distribution = .equalSpacing
        
        seriesButton.setTitleColor(.white, for: .normal)
        seriesButton.titleLabel?.textAlignment = .center
        seriesButton.backgroundColor = .systemBlue
        seriesButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        seriesButton.layer.cornerRadius = 25
        seriesButton.clipsToBounds = true
        
        bookinfoStackView.axis = .horizontal
        bookinfoStackView.spacing = 10
        bookinfoStackView.alignment = .top
        bookinfoStackView.distribution = .fill

        bookimageView.contentMode = .scaleAspectFit
        bookimageView.clipsToBounds = true
        
        infoStackView.axis = .vertical
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0 // 무제한 줄 설정
        titleLabel.lineBreakMode = .byWordWrapping // 단위 단위 줄바꿈
        
        authorStackView.axis = .horizontal
        authorStackView.spacing = 8
        
        authortitleLabel.text = "Author"
        authortitleLabel.font = .boldSystemFont(ofSize: 14)
        authortitleLabel.textColor = .black
        authortitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        authortitleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        authorLabel.font = .systemFont(ofSize: 18)
        authorLabel.textColor = .darkGray
        
        releasedStackView.axis = .horizontal
        releasedStackView.spacing = 8
        
        releasedtitleLabel.text = "Released"
        releasedtitleLabel.font = .boldSystemFont(ofSize: 14)
        releasedtitleLabel.textColor = .black
        releasedtitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        releasedtitleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        releasedLabel.font = .systemFont(ofSize: 14)
        releasedLabel.textColor = .gray
        
        pageStackView.axis = .horizontal
        pageStackView.spacing = 8
        
        pagetitleLabel.text = "Pages"
        pagetitleLabel.font = .boldSystemFont(ofSize: 14)
        pagetitleLabel.textColor = .black
        pagetitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        pagetitleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        pageLabel.font = .systemFont(ofSize: 14)
        pageLabel.textColor = .gray
        
        
        
        
    }
    
    func addViewUI() {
        addSubview(booktitleLabel)
        addSubview(seriesStackView)
        seriesStackView.addArrangedSubview(seriesButton)
        
        addSubview(bookinfoStackView)
        bookinfoStackView.addArrangedSubview(bookimageView)
        bookinfoStackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(authorStackView)
        infoStackView.addArrangedSubview(releasedStackView)
        infoStackView.addArrangedSubview(pageStackView)
        
        authorStackView.addArrangedSubview(authortitleLabel)
        authorStackView.addArrangedSubview(authorLabel)
        
        releasedStackView.addArrangedSubview(releasedtitleLabel)
        releasedStackView.addArrangedSubview(releasedLabel)
        
        pageStackView.addArrangedSubview(pagetitleLabel)
        pageStackView.addArrangedSubview(pageLabel)
    }
    
    
    func setConstaints() {
        booktitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        seriesStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(booktitleLabel.snp.bottom).offset(16)
        }
        
        seriesButton.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }
        
        bookinfoStackView.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide.snp.leading).inset(5)
            $0.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(5)
            $0.top.equalTo(seriesStackView.snp.bottom).offset(10)
        }
        
        bookimageView.snp.makeConstraints {
            $0.width.equalTo(100)
                .multipliedBy(1.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(bookimageView.snp.trailing).offset(5)
        }
        
        authorStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        releasedStackView.snp.makeConstraints {
            $0.top.equalTo(authorStackView.snp.bottom).offset(5)
        }
        
        pageStackView.snp.makeConstraints{
            $0.top.equalTo(releasedStackView.snp.bottom).offset(5)
        }
        
        
    }
}
