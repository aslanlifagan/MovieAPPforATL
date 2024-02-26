//
//  HomeController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    private let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureViewModel()
        viewModel.delegate = self
        viewModel.getPopularMovieList()
    }
    
//    fileprivate func configureViewModel() {
//
//        viewModel.successCallback = { [weak self] in
//            guard let self = self else {return}
//            print("success")
//        }
//
//        viewModel.errorCallback = { [weak self] errorString in
//            guard let self = self else {return}
//            print(errorString)
//        }
//    }
}

extension HomeController: HomeProtocol {
    func success() {
        print("success")
    }
    
    func error(errorMessage: String) {
        print(errorMessage)
    }
    
    
}
