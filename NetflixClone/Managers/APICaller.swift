//
//  APICaller.swift
//  NetflixClone
//
//  Created by Mine Rala on 19.02.2022.
//

import Foundation

struct Constants {
    static let apiKey = "697d439ac993538da4e3e60b54e762cd"
    static let baseUrl = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingMoviesResponse.self , from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTvsResponse.self, from: data)
                print(tvs)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    func getUpcomingMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingMoviesResponse.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingMoviesResponse.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getPopularTvs(completion: @escaping(Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTvsResponse.self, from: data)
                print(tvs)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let movies = try decoder.decode(TrendingMoviesResponse.self, from: data)
                print(movies)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getTopRatedTvs(completion: @escaping(Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let decoder = JSONDecoder()
                let tvs = try decoder.decode(TrendingTvsResponse.self, from: data)
                print(tvs)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
