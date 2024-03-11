//
//  MovieCell.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import UIKit

protocol MovieCellProtocol {
    var titleString: String {get}
    var subtitleString: String {get}
    var iconString: String {get}
}

class MovieCell: UICollectionViewCell {
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    fileprivate func setupView() {
        movieImageView.layer.cornerRadius = 8
    }
    
    func configureCell(model: MovieCellProtocol) {
        titleLabel.text = model.titleString
        subtitleLabel.text = model.subtitleString
        movieImageView.loadURL(model.iconString)
    }

}
