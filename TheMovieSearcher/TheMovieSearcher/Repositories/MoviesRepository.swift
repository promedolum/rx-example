//
//  MoviesRepository.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation
import RxSwift

final class MovieRepository {
    
    let searchQuery = MovieSearchQuery()
    
    func getMovies(with query: Observable<String>) -> Observable<[MovieResultModel]> {
        return searchQuery.fetchData(with: query)
            .map { dtos in
               return dtos.map { dto in
                   return MovieResultModel(with: dto)
                }
        }
    }
    
}
