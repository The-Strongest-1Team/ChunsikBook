//
//  MainView.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/15/25.
//
import UIKit
import SnapKit

class MainView: UIView {
    // MARK: Title
    var titleView = UIView()
    var booktitleLabel = UILabel()
    var seriesStackView = UIStackView()
    
    // MARK: ScrollView
    var scrollView = UIScrollView()
    var scrollContentView = UIView()
    
    // MARK: BookInfo
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
    var summeryExpandButton = UIButton()
    
    // MARK: Chapters
    var chaptersView = UIView()
    var chaptersStackView = UIStackView()
    var chaptertitleLabel = UILabel()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        titleUI()
        scrollUI()
        bookinfoUI()
        dedicationUI()
        summaryUI()
        chaptertUI()
        addViewUI()
        titleConstaint()
        scrollConstaint()
        bookinfoConstaint()
        dedicatonConstaint()
        summaryConstaint()
        chapterConstaint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Title
    func titleUI() {
        booktitleLabel.textAlignment = .center
        booktitleLabel.font = .boldSystemFont(ofSize: 24)
        booktitleLabel.numberOfLines = 0
        booktitleLabel.lineBreakMode = .byWordWrapping
        
        seriesStackView.axis = .horizontal
        seriesStackView.spacing = 10
        seriesStackView.alignment = .center
        seriesStackView.distribution = .equalSpacing
    }
    
    // MARK: ScrollView
    func scrollUI() {
        scrollView.showsVerticalScrollIndicator = false // 수직 스크롤바 설정.
        scrollView.isScrollEnabled = true // 스크롤 활성화 설정 (false로 설정하면 스크롤이 비활성화됨 기본값은 true이므로 생략 가능)
    }
    
    // MARK: BookInfo
    func bookinfoUI() {
        bookinfoStackView.axis = .horizontal
        bookinfoStackView.alignment = .top
        bookinfoStackView.spacing = 10
        
        bookimageView.contentMode = .scaleAspectFill
        bookimageView.clipsToBounds = true
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 10
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        booktitleLabel.lineBreakMode = .byWordWrapping
        
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
    }
    
    // MARK: Dedication
    func dedicationUI() {
        dedicationStackView.axis = .vertical
        dedicationStackView.spacing = 8
        
        dedicationtitleLabel.text = "Dedication"
        dedicationtitleLabel.font = .boldSystemFont(ofSize: 18)
        dedicationLabel.textColor = .black
        
        dedicationLabel.font = .systemFont(ofSize: 14)
        dedicationLabel.textColor = .darkGray
        dedicationLabel.numberOfLines = 0
        dedicationLabel.lineBreakMode = .byWordWrapping
    }
    
    // MARK: Summary
    func summaryUI() {
        summeryStackView.axis = .vertical
        summeryStackView.spacing = 8
        
        summerytitleLabel.text = "Summary"
        summerytitleLabel.font = .boldSystemFont(ofSize: 18)
        summerytitleLabel.textColor = .black

        summeryLabel.font = .systemFont(ofSize: 14)
        summeryLabel.textColor = .darkGray
        summeryLabel.numberOfLines = 0
        summeryLabel.lineBreakMode = .byTruncatingTail
        
        summeryExpandButton.backgroundColor = .clear
        summeryExpandButton.setTitleColor(.systemBlue, for: .normal)
        summeryExpandButton.titleLabel?.font = .systemFont(ofSize: 14)
        summeryExpandButton.setContentHuggingPriority(.required, for: .vertical)
        summeryExpandButton.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: Chapters
    func chaptertUI() {
        chaptersStackView.axis = .vertical
        chaptersStackView.spacing = 8
        
        chaptertitleLabel.text = "Chapters"
        chaptertitleLabel.font = .boldSystemFont(ofSize: 18)
        chaptertitleLabel.textColor = .black
    }
    
    // MARK: addView
    func addViewUI() {
        // MARK: Title
        addSubview(titleView)
        titleView.addSubview(booktitleLabel)
        titleView.addSubview(seriesStackView)
        
        // MARK: ScrollView
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        
        // MARK: BookInfo
        scrollContentView.addSubview(infoView)
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
        scrollContentView.addSubview(dedicationView)
        dedicationView.addSubview(dedicationStackView)
        
        dedicationStackView.addArrangedSubview(dedicationtitleLabel)
        dedicationStackView.addArrangedSubview(dedicationLabel)
        
        // MARK: Summary
        scrollContentView.addSubview(summeryView)
        summeryView.addSubview(summeryStackView)
        
        summeryStackView.addArrangedSubview(summerytitleLabel)
        summeryStackView.addArrangedSubview(summeryLabel)
        summeryView.addSubview(summeryExpandButton)
        
        // MARK: Chapter
        scrollContentView.addSubview(chaptersView)
        chaptersView.addSubview(chaptersStackView)
        
        chaptersStackView.addArrangedSubview(chaptertitleLabel)
    }
    
    // MARK: Title
    func titleConstaint() {
        titleView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        booktitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        seriesStackView.snp.makeConstraints {
            $0.top.equalTo(booktitleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: ScrollView
    func scrollConstaint() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.width.equalTo(scrollView.contentLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        scrollContentView.snp.makeConstraints {
            $0.directionalEdges.equalTo(scrollView.contentLayoutGuide)
        }
    }
    
    // MARK: BookInfo
    func bookinfoConstaint() {
        infoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        bookinfoStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        bookimageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(bookimageView.snp.width).multipliedBy(1.5)
        }
    }
    
    // MARK: Dedication
    func dedicatonConstaint() {
        dedicationView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        dedicationStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: Summary
    func summaryConstaint() {
        summeryView.snp.makeConstraints {
            $0.top.equalTo(dedicationView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        summeryStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview()
        }
        
        summeryExpandButton.snp.makeConstraints {
            $0.top.equalTo(summeryStackView.snp.bottom)
            $0.trailing.bottom.equalToSuperview()
            $0.width.height.equalTo(40)
        }
    }
    
    // MARK: Chapters
    func chapterConstaint() {
        chaptersView.snp.makeConstraints {
            $0.top.equalTo(summeryView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        chaptersStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: Configure
    func configure(with books: Book, series: Int, isExpanded: Bool, formattedDate: String, seriesCount: Int) {
        booktitleLabel.text = books.title
        
        seriesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        chaptersStackView.arrangedSubviews
            .filter { $0 != chaptertitleLabel }
            .forEach { $0.removeFromSuperview() }
        
        for i in 0..<seriesCount {
            let seriesButton = UIButton()
            seriesButton .setTitle("\(i + 1)", for: .normal)
            seriesButton.setTitleColor(.white, for: .normal)
            seriesButton.titleLabel?.textAlignment = .center
            seriesButton.backgroundColor = .systemBlue
            seriesButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            seriesButton.layer.cornerRadius = 20
            seriesButton.clipsToBounds = true
            seriesButton.tag = i
             
            seriesButton.snp.makeConstraints {
                $0.width.height.equalTo(40)
            }
            seriesStackView.addArrangedSubview(seriesButton)
        }
        
        bookimageView.image = UIImage(named: "harrypotter\(series + 1)")
        titleLabel.text = books.title
        authorLabel.text = books.author
        releasedLabel.text = formattedDate
        pageLabel.text = String(books.pages)
        dedicationLabel.text = books.dedication
        
        self.summeryconfigure(with: books, isExpanded: isExpanded)
        
        for chapter in books.chapters {
            let chapterLabel = UILabel()
            chapterLabel.text = "\(chapter.title)"
            chapterLabel.font = .systemFont(ofSize: 14)
            chapterLabel.textColor = .darkGray
            chapterLabel.numberOfLines = 0
            chaptersStackView.addArrangedSubview(chapterLabel)
        }
    }
    
    // MARK: ExpandSummeryConfigure
    func summeryconfigure(with books: Book, isExpanded: Bool) {
        if books.summary.count > 450 {
            if isExpanded {
                summeryExpandButton.setTitle("접기", for: .normal)
                summeryLabel.text = books.summary
            }
            else {
                summeryExpandButton.setTitle("더보기", for: .normal)
                summeryLabel.text = books.summary.prefix(450) + "..."
            }
        }
        else {
            summeryExpandButton.setTitle("", for: .normal)
            summeryLabel.text = books.summary
        }
    }

}
