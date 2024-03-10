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
            print("getThisWeekMovieList")
        case .Popular:
            getPopularMovieList()
            print("popularList")
        case .Today:
            print("getTodayMovieList")
        }
    }
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
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
    deinit {
        print("****", #function, String(describing: type(of: self)))
    }
}
