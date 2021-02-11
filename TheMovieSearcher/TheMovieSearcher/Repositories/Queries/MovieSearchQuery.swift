//
//  MovieSearchQuery.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MovieSearchQuery {
    
    let resultRelay = PublishRelay<[MovieSearchResultDTO]>()
    let disposeBag = DisposeBag()
    
    func fetchData(with query: Observable<String>) -> Observable<[MovieSearchResultDTO]> {
        let session = URLSession.shared
        
        return query.flatMap {[weak self] (query) -> Observable<[MovieSearchResultDTO]> in
            guard let url = self?.createURL(with: query) else { return .just([MovieSearchResultDTO]()) }
            return session.rx.data(request: URLRequest(url: url))
                .map { (data) -> [MovieSearchResultDTO] in
                    guard let DTOs = try? JSONDecoder().decode(MovieSearchResultsDTO.self, from: data) else {
                        return [MovieSearchResultDTO]()
                    }
                    return DTOs.results
            }
        }
    }
    
    private func createURL(with query: String) -> URL? {
        guard !query.isEmpty else {
            return nil
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = APIConfig.apiScheme
        urlComponents.host = APIConfig.apiHost
        urlComponents.path = "/3/search/movie"
        urlComponents.queryItems = [
            .init(name: "api_key", value: APIConfig.apiKey),
            .init(name: "language", value: APIConfig.apiLanguage),
            .init(name: "query", value: query),
            .init(name: "page", value: "1"),
            .init(name: "include_adult", value: "false")]
        return urlComponents.url
    }
    
}
