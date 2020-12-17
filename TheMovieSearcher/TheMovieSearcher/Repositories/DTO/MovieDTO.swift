//
//  MovieDTO.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation

struct MovieSearchResultDTO: Decodable {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var results: [MovieResultDTO]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct  MovieResultDTO: Decodable {
    var id: Int
    var overview: String
    var poster_path: String
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case poster_path
        case title
    }
}
