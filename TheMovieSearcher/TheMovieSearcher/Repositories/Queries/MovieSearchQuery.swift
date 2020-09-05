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
    
    private let apiKey = "ab3bbac040d5de34d3f9e1183cde779e"
    let resultRelay = PublishRelay<[MovieResultDTO]>()
    let disposeBag = DisposeBag()
    
    func fetchData(with query: Observable<String>) -> Observable<[MovieResultDTO]> {
        let session = URLSession.shared
        
        return query.flatMap {[weak self] (query) -> Observable<[MovieResultDTO]> in
            guard let url = self?.createURL(with: query) else { return .just([MovieResultDTO]()) }
            return session.rx.data(request: URLRequest(url: url))
                .map { (data) -> [MovieResultDTO] in
                    guard let DTOs = try? JSONDecoder().decode(MovieSearchResultDTO.self, from: data) else {
                        return [MovieResultDTO]()
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
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/search/movie"
        urlComponents.queryItems = [
            .init(name: "api_key", value: apiKey),
            .init(name: "language", value: "ru-RU"),
            .init(name: "query", value: query),
            .init(name: "page", value: "1"),
            .init(name: "include_adult", value: "false")]
        return urlComponents.url
    }
    
}
