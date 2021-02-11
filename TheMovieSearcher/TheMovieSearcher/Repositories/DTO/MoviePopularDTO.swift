//
//  MoviePopularDTO.swift
//  TheMovieSearcher
//
//  Created by Zanevskiy Alexander on 11.02.2021.
//  Copyright © 2021 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation

struct MoviePopularResultsDTO: Decodable {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var results: [MoviePopularResultDTO]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct MoviePopularResultDTO: Decodable {
    var movieId: Int
    var localizedTitle: String
    var originalTitle: String
    var posterPath: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case movieId
        case localizedTitle
        case originalTitle
        case posterPath
        case releaseDate
    }
}
