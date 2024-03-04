//
//  HomeViewModel.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import Foundation

protocol HomeProtocol: AnyObject {
    func success()
    func error(errorMessage: String)
}

final class HomeViewModel {
    
    private var popularList: PopulerMovieModel?
//    var successCallback: (() -> Void)?
//    var errorCallback: ((String) -> Void)?
    weak var delegate: HomeProtocol?
    
    func getMovieForType(type: HeaderType, id: Int) {
        if type == .trending {
            if id == 0 {
                print("getTodayMovieList")
//                getTodayMovieList()
            } else {
                print("getThisWeekMovieList")
                // getThisWeekMovieList
            }
        } else {
            if id == 0 {
                getPopularMovieList()
            } else {
                print("getTopRatedList")
                // getTopRatedList
            }
        }
    }
    // MARK: Network
    func getPopularMovieList() {
        MovieManager.shared.getPopularMovieList(pageID:4) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.delegate?.error(errorMessage: errorString)
//                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.popularList = responseData
                self.delegate?.success()
            }
        }
    }
    deinit {
        print("HomeViewModel")
    }
}
