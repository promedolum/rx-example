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
    let popularQuery = MoviePopularQuery()
    
    func getSearchedMovies(with query: Observable<String>) -> Observable<[MoviePopularResultModel]> {
        return searchQuery.fetchData(with: query)
            .map { dtos in
                return dtos.map { dto in
                    return MoviePopularResultModel(with: dto)
                }
            }
    }
    
    func getPopularMovies() -> Observable<[MoviePopularResultModel]> {
        return popularQuery.fetchData()
            .map { dtos in
                return dtos.map { dto in
                    return MoviePopularResultModel(with: dto)
                }
            }
    }
    
}
