//
//  MoviePopularViewModel.swift
//  TheMovieSearcher
//
//  Created by Zanevskiy Alexander on 12.02.2021.
//  Copyright © 2021 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MoviePopularViewModelOutput {
    let popularResult: Driver<[MoviePopularResultModel]>
}

final class MoviePopularViewModel {
    let disposeBag = DisposeBag()
    let repo: MovieRepository
    
    init() {
        repo = MovieRepository()
    }
    
    func bind() -> MoviePopularViewModelOutput {
        return MoviePopularViewModelOutput(popularResult: repo.getPopularMovies().asDriver(onErrorJustReturn: [MoviePopularResultModel]())
        )
    }
}
