//
//  APIConfig.swift
//  TheMovieSearcher
//
//  Created by Zanevskiy Alexander on 11.02.2021.
//  Copyright © 2021 Алешин Игорь Эдуардович. All rights reserved.
//

import Foundation

enum APIConfig {
    static let apiKey = "ab3bbac040d5de34d3f9e1183cde779e"
    static let apiScheme = "https"
    static let apiHost = "api.themoviedb.org"
    static let apiLanguage = "ru-RU"
}

final class TheMovieSearcher {
    
    static func makeURL(urlPath: String, urlQuery: [String: String]) -> URL? {
        
        guard !urlQuery.isEmpty else {
            return nil
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = APIConfig.apiScheme
        urlComponents.host = APIConfig.apiHost
        urlComponents.path = urlPath
        urlComponents.queryItems = [
            .init(name: "api_key", value: APIConfig.apiKey),
            .init(name: "language", value: APIConfig.apiLanguage)]
        urlComponents.queryItems?.append(contentsOf: urlQuery.compactMap {
                                            URLQueryItem(name: $0, value: $1) })
        return urlComponents.url
    }
}
