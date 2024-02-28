//
//  HomeController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureViewModel()
        
        viewModel.getPopularMovieList()
        setupView()
        
    }
    
    fileprivate func setupView() {
        viewModel.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MovieCollectionCell")
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

//MARK: HomeProtocol
extension HomeController: HomeProtocol {
    func success() {
        print("success")
    }
    
    func error(errorMessage: String) {
        print(errorMessage)
    }
    
    
}

//MARK: UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCollectionCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: collectionView.frame.height * 0.28)
    }
}
