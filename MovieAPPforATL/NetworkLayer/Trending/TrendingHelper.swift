//
//  TrendingHelper.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 13.03.24.
//

import Foundation
enum TrendingHelper: String {
    case today = "trending/movie/day?language=en-US&page="
    case week = "trending/movie/week?language=en-US&page="
    
    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
