//
//  ImageLabelCell.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 17.05.24.
//

import UIKit

protocol ImageLabelCellProtocol {
    var titleText: String { get }
    var imagePath: String { get }
}

class ImageLabelCell: UICollectionViewCell {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topImage.layer.cornerRadius = 16
    }
    
    func configure(data: ImageLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadURL(data.imagePath)
    }
}
