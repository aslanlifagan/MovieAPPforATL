//
//  MovieCollectionHeaderView.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import UIKit
enum HeaderType: String {
case tranding = "Tranding"
case category = "Category"
}
class MovieCollectionHeaderView: UICollectionReusableView {
    @IBAction func segmentAction(_ sender: Any) {
        print(segmentView.selectedSegmentIndex)
    }
    
    @IBAction func moreAction(_ sender: Any) {
        print(#function)
    }
    @IBOutlet private weak var segmentView: UISegmentedControl!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentView.tintColor = .black
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
    }
    
    func configureView(type: HeaderType) {
        titleLabel.text = type.rawValue

segmentView.setTitle(
            type == .tranding ? "Popular" : "Today",
            forSegmentAt: 0)
        segmentView.setTitle(
            type == .tranding ? "Top Rated" : "This week",
            forSegmentAt: 1)
    }
}
