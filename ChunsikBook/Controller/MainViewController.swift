//
//  MainViewController.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/13/25.
//

class MainViewController {
    private let dataService = DataService()

    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                for book in books {
                    print("📘 Title: \(book.title)")
                    print("✍️ Author: \(book.author)")
                    print("📄 Pages: \(book.pages)")
                    print("🗓️ Release Date: \(book.release_date)")
                    print("💌 Dedication: \(book.dedication)")
                    print("📝 Summary: \(book.summary)")
                    print("🌐 Wiki: \(book.wiki)")
                    
                    print("📚 Chapters:")
                    for (index, chapter) in book.chapters.enumerated() {
                        print("   \(index + 1). \(chapter.title)")
                    }
                    
                    print("---------------")
                }
                
            case .failure(let error):
                print("❌ 에러 발생: \(error)")

            }
        }
    }


}
