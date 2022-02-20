//
//  Movie.swift
//  NetflixClone
//
//  Created by Mine Rala on 20.02.2022.
//

import Foundation

struct TrendingMoviesResponse: Decodable {
    let results: [Movie]
    
}

struct Movie: Decodable {
    let id: Int
    let meadia_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/*
 {
adult = 0;
"backdrop_path" = "/aTSA5zMWlVFTYBIZxTCMbLkfOtb.jpg";
"genre_ids" =             (
 27,
 53
);
id = 632727;
"media_type" = movie;
"original_language" = en;
"original_title" = "Texas Chainsaw Massacre";
overview = "After nearly 50 years of hiding, Leatherface returns to terrorize a group of idealistic young friends who accidentally disrupt his carefully shielded world in a remote Texas town.";
popularity = "115.199";
"poster_path" = "/meRIRfADEGVo65xgPO6eZvJ0CRG.jpg";
"release_date" = "2022-02-18";
title = "Texas Chainsaw Massacre";
video = 0;
"vote_average" = "5.5";
"vote_count" = 58;
},
 */
