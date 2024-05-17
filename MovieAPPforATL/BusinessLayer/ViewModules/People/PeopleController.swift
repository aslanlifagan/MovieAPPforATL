//
//  PeopleController.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import UIKit

class PeopleController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = PeopleViewModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureViewModel()
        viewModel.getPeopleList()
    }
    
    func configureUI() {
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshControl
        collection.register(UINib(nibName: "ImageLabelCell", bundle: nil), forCellWithReuseIdentifier: "ImageLabelCell")
    }
    
    fileprivate func configureViewModel() {
        
        viewModel.success = { [weak self] in
            guard let self = self else {return}
            self.reloadCollectionView()
        }
        
        viewModel.error = { [weak self] errorString in
            guard let _ = self else {return}
            print(errorString)
        }
    }
    
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collection.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func pullToRefresh() {
        collection.reloadData()
        viewModel.getPeopleList()
    }
}

extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        
        cell.configure(data: viewModel.getItem(index: indexPath.row))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 280)
    }
}
 
