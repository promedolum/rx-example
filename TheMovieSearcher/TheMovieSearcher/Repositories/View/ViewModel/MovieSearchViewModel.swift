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
    
    let searchResult: Driver<[MoviePopularResultModel]>
}

final class MovieSearchViewModel {
    let disposeBag = DisposeBag()
    let repo: MovieRepository
    
    init() {
       repo = MovieRepository()
    }
    
    func bind(input: MovieSearchViewModelInput) -> MovieSearchViewModelOutput {

        let niceRequest = input.searchQuery.flatMap { [weak self] inputString -> Observable<[MoviePopularResultModel]> in
            guard let self = self else { throw RxError.unknown }
            let request: Observable<[MoviePopularResultModel]>
            if let input = inputString,
               !input.isEmpty {
                request = self.repo.getSearchedMovies(with: Observable.just(input))
            } else {
                request = self.repo.getPopularMovies()
            }
            return request
        }
        
//        let notNiceRequest = input.searchQuery.flatMap { [weak self] inputString -> Observable<[MoviePopularResultModel]> in
//            guard let self = self else { throw RxError.unknown }
//            guard let input = inputString else { throw RxError.unknown }
//            return self.repo.getSearchedMovies(with: Observable.just(input))
//        }
//        .debug()
//        .retry()
    
        return MovieSearchViewModelOutput(
//            searchResult:notNiceRequest.asDriver(onErrorJustReturn: [MoviePopularResultModel]())
            searchResult:niceRequest.asDriver(onErrorJustReturn: [MoviePopularResultModel]())
        )
        
    }
}
