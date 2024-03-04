//
//  MovieCollectionHeaderView.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import UIKit

enum HeaderType: String {
    case trending = "Trending"
    case category = "Category"
}
class MovieCollectionHeaderView: UICollectionReusableView {
    @IBAction func segmentAction(_ sender: Any) {
        segmentCallBack?(type, segmentView.selectedSegmentIndex)
        print(type, segmentView.selectedSegmentIndex)
    }
    
    @IBAction func moreAction(_ sender: Any) {
        moreCallBack?(type)
//        print(type)
        
    }
    @IBOutlet private weak var segmentView: UISegmentedControl!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var moreButton: UIButton!
    var type: HeaderType = .trending
    
    var segmentCallBack: ((HeaderType, Int) ->())?
    var moreCallBack: ((HeaderType) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentView.tintColor = .black
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        segmentView.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.label], for: .normal)
    }
    
    func configureView() {
        titleLabel.text = type.rawValue
        
        segmentView.setTitle(
            type == .trending ? "Today" : "Popular",
            forSegmentAt: 0)
        
        
        segmentView.setTitle(
            type == .trending ? "This week" : "Top Rated",
            forSegmentAt: 1)
    }
}
