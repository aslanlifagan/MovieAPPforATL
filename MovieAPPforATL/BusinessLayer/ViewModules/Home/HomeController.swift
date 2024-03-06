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
        collectionView.registerNib(with: "MovieCollectionCell")
        collectionView.register(UINib(nibName: "MovieCollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MovieCollectionHeaderView")
    }
    fileprivate func moreAction(type: HeaderType) {
        print(type)
        
        //burada type gore backende request atilacaq
    }
    
    fileprivate func segmentAction(type: HeaderType, id: Int) {
        viewModel.getMovieForType(type: type, id: id)
        
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCollectionCell.self, indexPath: indexPath)
        cell.setList(list: viewModel.getMovieList())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionHeaderView", for: indexPath) as! MovieCollectionHeaderView
            headerView.type = indexPath.section == 0 ? .trending : .category
            headerView.configureView()
            headerView.moreCallBack = { [weak self] headerType in
                guard let self = self else {return}
                self.moreAction(type: headerType)
            }
            headerView.segmentCallBack = { [weak self] headerType, id in
                guard let self = self else {return}
                self.segmentAction(type: headerType, id: id)
            }
            return headerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: collectionView.frame.height * 0.4)
    }
}
