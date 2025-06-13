//
//  Bookmanager.swift
//  ChunsikBook
//
//  Created by 이태윤 on 6/13/25.
//

struct BookResponse: Codable {
    let data: [BookData]
}

struct BookData: Codable {
    let attributes: Book
}

struct Book: Codable {
    let title: String
    let author: String
    let pages: Int
    let release_date: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [chapter]
}

struct chapter: Codable {
    let title: String
}
