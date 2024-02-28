//
//  MovieCollectionCell.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.registerNib(with: "MovieCell")
    }
    
}

extension MovieCollectionCell: UICollectionViewDelegate,
                               UICollectionViewDataSource,
                               UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // burdaki listin countunu backdan aliriq
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        cell.configureCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
}