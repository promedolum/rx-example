//
//  MovieSearchViewModel.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct MovieSearchViewModelInput {
    let searchQuery: Observable<String?>
}

struct MovieSearchViewModelOutput {
    
    let searchResult: Driver<[MovieResultModel]>
}

final class MovieSearchViewModel {
    let disposeBag = DisposeBag()
    let repo: MovieRepository
    
    init() {
       repo = MovieRepository()
    }
    
    func bind(input: MovieSearchViewModelInput) -> MovieSearchViewModelOutput {
        
        let nonNullQuery = input.searchQuery.map { string -> String in
            return string ?? ""
        }
    
        return MovieSearchViewModelOutput(
            searchResult: repo.getMovies(with: nonNullQuery).asDriver(onErrorJustReturn: [MovieResultModel]())
        )
        
    }
}
