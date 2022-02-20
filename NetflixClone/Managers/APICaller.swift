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
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
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
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(tvs)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }

    func getUpcomingMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(movies)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(movies)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopularTvs(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(tvs)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(movies)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedTvs(completion: @escaping(Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTitleResponse.self, from: data)
                print(tvs)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
}
