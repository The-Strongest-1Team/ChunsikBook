//
//  MainView.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/15/25.
//
import UIKit
import SnapKit

class MainView: UIView {
    // MARK: 타이틀
    var titleView = UIView()
    var booktitleLabel = UILabel()
    var seriesStackView = UIStackView()
    var seriesButton = UIButton()
    
    // MARK: 책 정보
    var infoView = UIView()
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
    
    // MARK: Dedication
    var dedicationView = UIView()
    var dedicationStackView = UIStackView()
    var dedicationtitleLabel = UILabel()
    var dedicationLabel = UILabel()
    
    // MARK: Summary
    var summeryView = UIView()
    var summeryStackView = UIStackView()
    var summerytitleLabel = UILabel()
    var summeryLabel = UILabel()
    
    
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
        
        // MARK: 타이틀
        booktitleLabel.textAlignment = .center
        booktitleLabel.font = .boldSystemFont(ofSize: 24)
        booktitleLabel.numberOfLines = 0
        
        seriesStackView.axis = .horizontal
        seriesStackView.spacing = 10
        seriesStackView.alignment = .center
        seriesStackView.distribution = .equalSpacing
        
        seriesButton.setTitleColor(.white, for: .normal)
        seriesButton.titleLabel?.textAlignment = .center
        seriesButton.backgroundColor = .systemBlue
        seriesButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        seriesButton.layer.cornerRadius = 20
        seriesButton.clipsToBounds = true
        
        // MARK: 책 정보
        bookinfoStackView.axis = .horizontal
        bookinfoStackView.alignment = .top
        bookinfoStackView.distribution = .equalCentering
        
        bookimageView.contentMode = .scaleAspectFill
        bookimageView.clipsToBounds = true
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 10
        infoStackView.alignment = .leading
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        
        authorStackView.axis = .horizontal
        authorStackView.spacing = 8
        
        authortitleLabel.text = "Author"
        authortitleLabel.font = .boldSystemFont(ofSize: 16)
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
        
        // MARK: Dedication
        
        dedicationStackView.axis = .vertical
        dedicationStackView.spacing = 8
        dedicationStackView.alignment = .leading
        
        dedicationtitleLabel.text = "Dedication"
        dedicationtitleLabel.font = .boldSystemFont(ofSize: 18)
        dedicationLabel.textColor = .black
        
        dedicationLabel.font = .systemFont(ofSize: 14)
        dedicationLabel.textColor = .darkGray
        dedicationLabel.numberOfLines = 0
        
        
        // MARK: Summary
        summeryStackView.axis = .vertical
        summeryStackView.spacing = 8
        summeryStackView.alignment = .leading
        
        summerytitleLabel.text = "Summary"
        summerytitleLabel.font = .boldSystemFont(ofSize: 18)
        summerytitleLabel.textColor = .black
        // TODO: Summery 글자 라인 수정 필요
        summeryLabel.font = .systemFont(ofSize: 14)
        summeryLabel.textColor = .darkGray
        summeryLabel.numberOfLines = 0
        

        
    }
    
    func addViewUI() {
        // MARK: 타이틀
        addSubview(titleView)
        titleView.addSubview(booktitleLabel)
        titleView.addSubview(seriesStackView)
        seriesStackView.addArrangedSubview(seriesButton)
        
        // MARK: 책 정보
        addSubview(infoView)
        infoView.addSubview(bookinfoStackView)
        
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
        
        // MARK: Dedication
        addSubview(dedicationView)
        dedicationView.addSubview(dedicationStackView)
        
        dedicationStackView.addArrangedSubview(dedicationtitleLabel)
        dedicationStackView.addArrangedSubview(dedicationLabel)
        
        // MARK: Summary
        addSubview(summeryView)
        summeryView.addSubview(summeryStackView)
        
        summeryStackView.addArrangedSubview(summerytitleLabel)
        summeryStackView.addArrangedSubview(summeryLabel)
        
    }
    
    
    func setConstaints() {
        // MARK: 타이틀
        titleView.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
        }
        
        booktitleLabel.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
            
        }
        
        seriesStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(booktitleLabel.snp.bottom).offset(16)
        }
        
        seriesButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
        }
        
        // MARK: 책 정보
        infoView.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(5)
            $0.top.equalTo(seriesStackView.snp.bottom).offset(20)
        }
        
        bookinfoStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.bottom.equalToSuperview()
        }
        
        bookimageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(bookimageView.snp.width).multipliedBy(1.5)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(bookimageView.snp.trailing).offset(20)
        }
        
        authorStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        releasedStackView.snp.makeConstraints {
            $0.top.equalTo(authorStackView.snp.bottom).offset(10)
        }
        
        pageStackView.snp.makeConstraints{
            $0.top.equalTo(releasedStackView.snp.bottom).offset(10)
        }
        
        // MARK: Dedication
        dedicationView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        dedicationStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        
        
        // MARK: Summary
        summeryView.snp.makeConstraints {
            $0.top.equalTo(dedicationView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        summeryStackView.snp.makeConstraints {
            $0.directionalEdges.equalToSuperview()
        }
        
    }
    
}
