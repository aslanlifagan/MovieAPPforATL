//
//  MovieManager.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

class MovieManager {
    static let shared = MovieManager()
    
    func getPopularMovieList(pageID: Int, complete: @escaping((PopulerMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.popular.path)\(pageID)"
        NetworkManager.shared.request(
            type: PopulerMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
    func getTopRatedMovieList(pageID: Int, complete: @escaping((TopRatedMovieModel?, String?) -> Void)){
        let url = "\(MovieHelper.topRated.path)\(pageID)"
        NetworkManager.shared.request(
            type: TopRatedMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
