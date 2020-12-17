//
//  MovieModel.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation


struct MovieResultModel {
    let id: Int
    let overview: String
    let poster_path: String
    let title: String
    
    init(with dto: MovieResultDTO) {
        id = dto.id
        overview = dto.overview
        poster_path = dto.poster_path
        title = dto.title
    }
}
