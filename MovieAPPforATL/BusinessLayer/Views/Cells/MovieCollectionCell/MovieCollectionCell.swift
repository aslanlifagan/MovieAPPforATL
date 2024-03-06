//
//  MovieCollectionCell.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    private var movieList: [MovieCellProtocol] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.registerNib(with: "MovieCell")
    }
    
    func setList(list: [MovieCellProtocol]) {
        movieList = list
        movieCollectionView.reloadData()
    }
    
}

extension MovieCollectionCell: UICollectionViewDelegate,
                               UICollectionViewDataSource,
                               UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        let model = movieList[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
}
