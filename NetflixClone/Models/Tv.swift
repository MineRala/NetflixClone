//
//  TV.swift
//  NetflixClone
//
//  Created by Mine Rala on 20.02.2022.
//

import Foundation

struct TrendingTvsResponse: Decodable {
    let results: [Tv]
}

struct Tv: Decodable {
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
"backdrop_path" = "/ctxm191q5o3axFzQsvNPlbKoSYv.jpg";
"first_air_date" = "2022-01-13";
"genre_ids" =             (
 10759,
 35,
 10765,
 18
);
id = 110492;
"media_type" = tv;
name = Peacemaker;
"origin_country" =             (
 US
);
"original_language" = en;
"original_name" = Peacemaker;
overview = "The continuing story of Peacemaker \U2013 a compellingly vainglorious man who believes in peace at any cost, no matter how many people he has to kill to get it \U2013 in the aftermath of the events of \U201cThe Suicide Squad.\U201d";
popularity = "3290.551";
"poster_path" = "/hE3LRZAY84fG19a18pzpkZERjTE.jpg";
"vote_average" = "8.6";
"vote_count" = 1078;
},
 */
