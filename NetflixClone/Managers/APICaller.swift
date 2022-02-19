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
                let movies = try decoder.decode(TrendingMoviewsResponse.self , from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
