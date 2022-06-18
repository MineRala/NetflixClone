//
//  Urls.swift
//  NetflixClone
//
//  Created by Mine Rala on 22.02.2022.
//

import Foundation

enum UrlForTitles {
    case TrendingMovies
    case TrendingTv
    case UpcomingMovies
    case PopularMovies
    case PopularTv
    case TopRatedMovies
    case TopRatedTvs
    case discoverMovie
    
    var url: String {
        switch self {
        case .TrendingMovies:
            return "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)"
        case .TrendingTv:
            return "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)"
        case .UpcomingMovies:
            return "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)&language=en-US&page=1"
        case .PopularMovies:
            return "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
        case .PopularTv:
            return "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
        case .TopRatedMovies:
            return "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1"
        case .TopRatedTvs:
            return "\(Constants.baseUrl)/3/tv/top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1"
        case .discoverMovie:
            return "\(Constants.baseUrl)/3/discover/movie?api_key=\(Constants.apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
        }
    }
}
