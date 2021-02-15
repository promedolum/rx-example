//
//  MovieModel.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation


struct MovieSearchResultModel {
    let title: String
    let overview: String
    
    init(with dto: MovieSearchResultDTO) {
        title = dto.title
        overview = dto.overview
    }
}
