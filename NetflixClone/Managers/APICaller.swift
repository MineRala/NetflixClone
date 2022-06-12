//
//  APICaller.swift
//  NetflixClone
//
//  Created by Mine Rala on 19.02.2022.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    
    func getDatas(dataType: String, completion: @escaping (Result<[Title], APIError>) -> Void) {
        guard let url = URL(string: dataType) else {return}
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
}
