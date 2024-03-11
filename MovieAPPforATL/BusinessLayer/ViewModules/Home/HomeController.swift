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
        configureViewModel()
        viewModel.getPopularMovieList()
        setupView()
        
    }
    
    fileprivate func setupView() {
//        viewModel.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MovieCell")
        collectionView.register(UINib(nibName: "MovieCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MovieCollectionHeaderView")
    }
    
    fileprivate func segmentAction(type: SegmentType) {
        viewModel.getMovieForType(type: type)
        
        //burada type gore backende request atilacaq
    }
    fileprivate func configureViewModel() {
        
        viewModel.successCallback = { [weak self] in
            guard let self = self else {return}
            self.reloadCollectionView()
        }
        
        viewModel.errorCallback = { [weak self] errorString in
            guard let self = self else {return}
            print(errorString)
        }
    }
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

////MARK: HomeProtocol
//extension HomeController: HomeProtocol {
//    func success() {
//        print("success")
//    }
//
//    func error(errorMessage: String) {
//        print(errorMessage)
//    }
//
//
//}

//MARK: UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getMoviesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        let model = viewModel.getMovieList()[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "MovieCollectionHeaderView",
                for: indexPath) as! MovieCollectionHeaderView
            
            headerView.configureView()
            
            headerView.segmentCallBack = { [weak self] segmenType in
                guard let self = self else {return}
                self.segmentAction(type: segmenType)
            }
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width/3, height: collectionView.frame.height * 0.4)
    }
}
