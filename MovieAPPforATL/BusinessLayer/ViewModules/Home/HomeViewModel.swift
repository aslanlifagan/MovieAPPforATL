//
//  HomeViewModel.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import Foundation

//protocol HomeProtocol: AnyObject {
//    func success()
//    func error(errorMessage: String)
//}

final class HomeViewModel {
    
    private var popularList: [MovieResult]?
    private var topRatedList: [TopRateResult]?
    private var todayModel: TrendingModel?
    private var weekModel: TrendingModel?
    private var searchModel: SearchModel?
    private var movieList: [MovieCellProtocol] = []
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
//    weak var delegate: HomeProtocol?
    
    func getMovieForType(type: SegmentType) {
        switch type {
        case .TopRated:
            getTopRatedMovieList()
            print("movieList")
        case .ThisWeek:
            getWeekMovieList()
            print("getThisWeekMovieList")
        case .Popular:
            getPopularMovieList()
            print("popularList")
        case .Today:
            getTodayMovieList()
            print("getTodayMovieList")
        }
    }
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
    }

    func getMoviesCount() -> Int{
        return movieList.count
    }
    
    // MARK: Network
    func getPopularMovieList() {
        MovieManager.shared.getPopularMovieList(pageID:4) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
//                self.delegate?.error(errorMessage: errorString)
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.popularList = responseData
                self.movieList = responseData
//                self.delegate?.success()
                self.successCallback?()
            }
        }
    }
    
    fileprivate func getTopRatedMovieList() {
        MovieManager.shared.getTopRatedMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallback?(errorString)
//                self.delegate?.error(errorMessage: errorString)
            } else if let responseData = responseData?.results {
                self.topRatedList = responseData
                self.movieList = responseData
                self.successCallback?()
            }
        }

    }
    
    fileprivate func getTodayMovieList() {
        TrendingManager.shared.getTodayMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.todayModel = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }

    }
    
    fileprivate func getWeekMovieList() {
        TrendingManager.shared.getWeekMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.weekModel = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }

    }
    
    func getSearchList(text: String) {
        SearchManager.shared.getSearchList(query: text) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.searchModel = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }

    }
    deinit {
        print("****", #function, String(describing: type(of: self)))
    }
}
