//
//  MoviePopularModel.swift
//  TheMovieSearcher
//
//  Created by Zanevskiy Alexander on 11.02.2021.
//  Copyright © 2021 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation

struct MoviePopularResultModel {
    let movieId: Int
    let localizedTitle: String
    let originalTitle: String
    let posterPath: String
    let releaseDate: String
    
    init(with dto: MoviePopularResultDTO) {
        movieId = dto.movieId
        localizedTitle = dto.localizedTitle
        originalTitle = dto.originalTitle
        posterPath = dto.posterPath
        releaseDate = dto.releaseDate
    }
}
