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
    var title: String
    var overview: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
    }
}
