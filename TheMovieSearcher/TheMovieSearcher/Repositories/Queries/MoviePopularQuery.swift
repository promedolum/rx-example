//
//  MoviePopularQuery.swift
//  TheMovieSearcher
//
//  Created by Zanevskiy Alexander on 11.02.2021.
//  Copyright © 2021 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MoviePopularQuery {
    
    let resultRelay = PublishRelay<[MoviePopularResultDTO]>()
    let disposeBag = DisposeBag()
    
    func fetchData() -> Observable<[MoviePopularResultDTO]> {
        let session = URLSession.shared
        guard let url = self.createUrl() else { return
            .just([MoviePopularResultDTO]()) }
        
        return session.rx.data(request: URLRequest(url: url))
            .map { (data) -> [MoviePopularResultDTO] in
                guard let DTOs = try? JSONDecoder().decode(MoviePopularResultsDTO.self, from: data) else {
                    return [MoviePopularResultDTO]()
                }
                return DTOs.results
            }
    }
    
    private func createUrl() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = APIConfig.apiScheme
        urlComponents.host = APIConfig.apiHost
        urlComponents.path = "/3/movie/popular"
        urlComponents.queryItems = [
            .init(name: "api_key", value: APIConfig.apiKey),
            .init(name: "language", value: APIConfig.apiLanguage),
            .init(name: "page", value: "1")]
        return urlComponents.url
    }
}
