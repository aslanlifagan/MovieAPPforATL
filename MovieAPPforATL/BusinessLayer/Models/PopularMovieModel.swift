//
//  PopularMovieModel.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import Foundation

// MARK: - PopulerMovieModel
import Foundation

// MARK: - PopulerMovieModel
struct PopulerMovieModel: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, MovieCellProtocol {
    var titleString: String {
        originalTitle ?? ""
    }
    
    var subtitleString: String {
        releaseDate ?? ""
    }
    
    var iconString: String {
        "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/\(posterPath ?? "")"
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
