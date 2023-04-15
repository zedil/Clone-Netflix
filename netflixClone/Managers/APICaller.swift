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
    static let trendingURL = "/3/trending/movie/day?api_key="
    static let tvURL = "/3/trending/tv/day?api_key="
    static let upcomingURL = "/3/movie/upcoming?api_key="
    static let languageURL = "&language=en-US&page=1"
    static let popularURL = "/3/movie/popular?api_key="
    static let topRatedURL = "/3/movie/top_rated?api_key="
    
}

enum APIError: Error {
    case failed
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.trendingURL + Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // throws an error we must execute it
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.tvURL + Constants.apiKey)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
            }
            catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.upcomingURL + Constants.apiKey + Constants.languageURL)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.popularURL + Constants.apiKey + Constants.languageURL)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL + Constants.topRatedURL + Constants.apiKey + Constants.languageURL)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(results)
            } catch {
                completion(.failure(APIError.failed))
            }
        }
        task.resume()
    }
}
