//
//  APICaller.swift
//  NetflixClone
//
//  Created by Mine Rala on 19.02.2022.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.TrendingMovies.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self , from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.TrendingTv.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(tvs.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }

    func getUpcomingMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.UpcomingMovies.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.PopularMovies.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopularTvs(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.PopularTv.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(tvs.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.TopRatedMovies.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedTvs(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: UrlForTitles.TopRatedTvs.url) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                completion(.success(tvs.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
}
