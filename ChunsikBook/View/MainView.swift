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
    let titleView = UIView()
    let booktitleLabel = UILabel()
    let seriesStackView = UIStackView()
    
    // MARK: ScrollView
    let scrollView = UIScrollView()
    let scrollContentView = UIView()
    
    // MARK: BookInfo
    let infoView = UIView()
    let bookinfoStackView = UIStackView()
    let bookimageView = UIImageView()
    let infoStackView = UIStackView()
    let titleLabel = UILabel()
    let authorStackView = UIStackView()
    let authortitleLabel = UILabel()
    let authorLabel = UILabel()
    let releasedStackView = UIStackView()
    let releasedtitleLabel = UILabel()
    let releasedLabel = UILabel()
    let pageStackView = UIStackView()
    let pagetitleLabel = UILabel()
    let pageLabel = UILabel()
    
    // MARK: Dedication
    let dedicationView = UIView()
    let dedicationStackView = UIStackView()
    let dedicationtitleLabel = UILabel()
    let dedicationLabel = UILabel()
    
    // MARK: Summary
    let summaryView = UIView()
    let summaryStackView = UIStackView()
    let summarytitleLabel = UILabel()
    let summaryLabel = UILabel()
    let summaryExpandButton = UIButton()
    
    // MARK: Chapters
    let chaptersView = UIView()
    let chaptersStackView = UIStackView()
    let chaptertitleLabel = UILabel()
    var chapterlistLabel: [String: [UILabel]] = [:]
    
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
        authortitleLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        authorLabel.font = .systemFont(ofSize: 18)
        authorLabel.textColor = .darkGray
        
        releasedStackView.axis = .horizontal
        releasedStackView.spacing = 8
        
        releasedtitleLabel.text = "Released"
        releasedtitleLabel.font = .boldSystemFont(ofSize: 14)
        releasedtitleLabel.textColor = .black
        releasedtitleLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        releasedLabel.font = .systemFont(ofSize: 14)
        releasedLabel.textColor = .gray
        
        pageStackView.axis = .horizontal
        pageStackView.spacing = 8
        
        pagetitleLabel.text = "Pages"
        pagetitleLabel.font = .boldSystemFont(ofSize: 14)
        pagetitleLabel.textColor = .black
        pagetitleLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        pageLabel.font = .systemFont(ofSize: 14)
        pageLabel.textColor = .gray
    }
    
    // MARK: Dedication
    func dedicationUI() {
        dedicationStackView.axis = .vertical
        dedicationStackView.spacing = 8
        
        dedicationtitleLabel.text = "Dedication"
        dedicationtitleLabel.font = .boldSystemFont(ofSize: 18)
        
        dedicationLabel.font = .systemFont(ofSize: 14)
        dedicationLabel.textColor = .darkGray
        dedicationLabel.numberOfLines = 0
        dedicationLabel.lineBreakMode = .byWordWrapping
    }
    
    // MARK: Summary
    func summaryUI() {
        summaryStackView.axis = .vertical
        summaryStackView.spacing = 8
        
        summarytitleLabel.text = "Summary"
        summarytitleLabel.font = .boldSystemFont(ofSize: 18)
        
        summaryLabel.font = .systemFont(ofSize: 14)
        summaryLabel.textColor = .darkGray
        summaryLabel.numberOfLines = 0
        summaryLabel.lineBreakMode = .byTruncatingTail
        
        summaryExpandButton.backgroundColor = .clear
        summaryExpandButton.setTitleColor(.systemBlue, for: .normal)
        summaryExpandButton.titleLabel?.font = .systemFont(ofSize: 14)
        summaryExpandButton.setContentHuggingPriority(.required, for: .vertical)
        summaryExpandButton.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: Chapters
    func chaptertUI() {
        chaptersStackView.axis = .vertical
        chaptersStackView.spacing = 8
        
        chaptertitleLabel.text = "Chapters"
        chaptertitleLabel.font = .boldSystemFont(ofSize: 18)
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
        scrollContentView.addSubview(summaryView)
        summaryView.addSubview(summaryStackView)
        
        summaryStackView.addArrangedSubview(summarytitleLabel)
        summaryStackView.addArrangedSubview(summaryLabel)
        summaryView.addSubview(summaryExpandButton)
        
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
        summaryView.snp.makeConstraints {
            $0.top.equalTo(dedicationView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        summaryStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.equalToSuperview()
        }
        
        summaryExpandButton.snp.makeConstraints {
            $0.top.equalTo(summaryStackView.snp.bottom)
            $0.trailing.bottom.equalToSuperview()
            $0.width.height.equalTo(40)
        }
    }
    
    // MARK: Chapters
    func chapterConstaint() {
        chaptersView.snp.makeConstraints {
            $0.top.equalTo(summaryView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        chaptersStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: Configure
    func configure(with book: Book, selectSeries: Int, isExpanded: Bool, formattedDate: String, seriesCount: Int) {
        booktitleLabel.text = book.title
        bookimageView.image = UIImage(named: "harrypotter\(selectSeries + 1)")
        titleLabel.text = book.title
        authorLabel.text = book.author
        releasedLabel.text = formattedDate
        pageLabel.text = String(book.pages)
        dedicationLabel.text = book.dedication
        showChapters(for: book.title)
        self.summaryconfigure(with: book, isExpanded: isExpanded)
        
    }
    
    // MARK: CreateSeriesButton
    func createSeriesButton(seriesCount: Int) {
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
    }
    
    
    // MARK: ExpandSummaryConfigure
    func summaryconfigure(with book: Book, isExpanded: Bool) {
        if book.summary.count > 450 {
            if isExpanded {
                summaryExpandButton.setTitle("접기", for: .normal)
                summaryLabel.text = book.summary
            }
            else {
                summaryExpandButton.setTitle("더보기", for: .normal)
                summaryLabel.text = book.summary.prefix(450) + "..."
            }
        }
        else {
            summaryExpandButton.setTitle("", for: .normal)
            summaryLabel.text = book.summary
        }
    }
    
    // MARK: SetChapterConfigure
    func setChapterConfigure(with books: [Book]) {
        for book in books {
            var chapterlList: [UILabel] = []
            for chapter in book.chapters {
                let chapterLabel = UILabel()
                chapterLabel.text = "\(chapter.title)"
                chapterLabel.font = .systemFont(ofSize: 14)
                chapterLabel.textColor = .darkGray
                chapterLabel.numberOfLines = 0
                chapterLabel.isHidden = true
                chapterlList.append(chapterLabel)
                
                chaptersStackView.addArrangedSubview(chapterLabel)
            }
            chapterlistLabel[book.title] = chapterlList
        }
    }
    
    func showChapters(for selectedTitle: String) {
        for (title, labelList) in chapterlistLabel {
            let show = (title == selectedTitle)
            labelList.forEach { $0.isHidden = !show }
        }
    }
    
}
