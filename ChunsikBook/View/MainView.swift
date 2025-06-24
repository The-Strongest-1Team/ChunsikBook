//
//  MainView.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/15/25.
//
import UIKit
import SnapKit
import Then

class MainView: UIView {
    // MARK: Title
    let titleView = UIView()
    
    let booktitleLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .boldSystemFont(ofSize: 24)
        $0.numberOfLines = 0
    }
    
    let seriesStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    // MARK: ScrollView
    let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false // 수직 스크롤바 설정.
        $0.isScrollEnabled = true // 스크롤 활성화 설정 (false로 설정하면 스크롤이 비활성화됨 기본값은 true이므로 생략 가능)
    }
    
    let scrollContentView = UIView()
    
    // MARK: BookInfo
    let infoView = UIView()
    
    let bookinfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .top
        $0.spacing = 10
    }
    
    let bookimageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
    }
    
    let authorStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    let authortitleLabel = UILabel().then {
        $0.text = "Author"
        $0.font = .boldSystemFont(ofSize: 16)
        $0.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    let authorLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .darkGray
    }
    
    let releasedStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    let releasedtitleLabel = UILabel().then {
        $0.text = "Released"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    let releasedLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    let pageStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    let pagetitleLabel = UILabel().then {
        $0.text = "Pages"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.setContentHuggingPriority(.required, for: .horizontal)
    }
    
    let pageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    // MARK: Dedication
    let dedicationView = UIView()
    
    let dedicationStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    let dedicationtitleLabel = UILabel().then {
        $0.text = "Dedication"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let dedicationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
        $0.numberOfLines = 0
    }
    
    // MARK: Summary
    let summaryView = UIView()
    
    let summaryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    let summarytitleLabel = UILabel().then {
        $0.text = "Summary"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let summaryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
        $0.numberOfLines = 0
    }
    
    let summaryExpandButton = UIButton().then {
        $0.backgroundColor = .clear
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    // MARK: Chapters
    let chaptersView = UIView()
    
    let chaptersStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    let chaptertitleLabel = UILabel().then {
        $0.text = "Chapters"
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    var chapterlistLabel: [String: [UILabel]] = [:]
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
    
    // MARK: TitleLayOut
    private func titleConstaint() {
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
    
    // MARK: ScrollViewLayOut
    private func scrollConstaint() {
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
    
    // MARK: BookInfoLayOut
    private func bookinfoConstaint() {
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
    
    // MARK: DedicationLayOut
    private func dedicatonConstaint() {
        dedicationView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        dedicationStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: SummaryLayOut
    private func summaryConstaint() {
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
    
    // MARK: ChaptersLayOut
    private func chapterConstaint() {
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
        summaryconfigure(with: book, isExpanded: isExpanded)
        
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
    
    private func showChapters(for selectedTitle: String) {
        for (title, labelList) in chapterlistLabel {
            let show = (title == selectedTitle)
            labelList.forEach { $0.isHidden = !show }
        }
    }
}
