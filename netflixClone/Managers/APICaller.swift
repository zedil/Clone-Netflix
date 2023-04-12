//
//  APICaller.swift
//  netflixClone
//
//  Created by Dilara Şimşek on 12.04.2023.
//

import Foundation

struct Constants {
    static let apiKey = "cb302cf2fa7bf2f641c72d4683998f42"
    static let baseURL = "https://api.themoviedb.org"
    static let trendingURL = "/3/trending/all/day?api_key="
}

enum APIError: Error {
    case failed
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.trendingURL + Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // throws an error we must execute it
            do {
                let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
}
