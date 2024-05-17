//
//  HomeController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var sortButton: UIButton!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    private var hideSearchField: Bool = true
    
//    private var showLoading: Bool = false {
//        didSet {
//            DispatchQueue.main.async {
//                self.showLoading ? self.indicatorView.startAnimating() : self.indicatorView.stopAnimating()
//            }
//        }
//    }
    private let viewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        viewModel.getMovieForType(type: .Today)
        setupView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        
        hideSearchField.toggle()
        UIView.transition(
            with: textField,
            duration: 0.8,
            options: .transitionFlipFromTop,
            animations: { [weak self] in
                guard let self = self else {return}
                self.textField.isHidden = self.hideSearchField
                self.sortButton.isHidden = !self.hideSearchField
            })
        
    }
    
    @IBAction func sortButtonAction(_ sender: Any) {
        print(#function)
    }
    fileprivate func setupView() {
        //        viewModel.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MovieCell")
        collectionView.register(
            UINib(
                nibName: "MovieCollectionHeaderView",
                bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "MovieCollectionHeaderView")
        
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
            guard let _ = self else {return}
            print(errorString)
        }
    }
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func showMovieDetailController() {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailController") as? MovieDetailController ?? MovieDetailController()
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func sortClicked() {
        print(#function)
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
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width:collectionView.frame.width/3, height: collectionView.frame.height * 0.4)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.getMovieList()[indexPath.row]
        viewModel.selectedMovie = movie
        showMovieDetailController()
    }
}

extension HomeController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        // burada bir search requesti atiriq
        viewModel.getSearchList(text: text)
    }
}
