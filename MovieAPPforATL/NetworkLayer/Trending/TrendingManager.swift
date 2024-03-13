//
//  TrendingManager.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 13.03.24.
//

import Foundation


class TrendingManager {
    static let shared = TrendingManager()
    
    func getWeekMovieList(pageID: Int, complete: @escaping((TrendingModel?, String?) -> Void)) {
        let url = "\(TrendingHelper.week.path)\(pageID)"
        NetworkManager.shared.request(
            type: TrendingModel.self,
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
    
    func getTodayMovieList(pageID: Int, complete: @escaping((TrendingModel?, String?) -> Void)) {
        let url = "\(TrendingHelper.today.path)\(pageID)"
        NetworkManager.shared.request(
            type: TrendingModel.self,
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
