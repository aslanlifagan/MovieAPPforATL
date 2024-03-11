//
//  Extensions.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 28.02.24.
//

import Foundation
import UIKit
import SDWebImage

extension UICollectionView {
    func registerNib(with identifier: String)
    {
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
    }
    func registerCodedCell(with cellClass: AnyClass)
    {
        let identifier = String(describing: cellClass.self)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    func dequeCell<T>(cellClass : T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell
    {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}

extension UITableView {
    func registerNib(with identifier: String)
    {
        self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    func registerCodedCell(with cellClass: AnyClass)
    {
        let identifier = String(describing: cellClass.self)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    func dequeCell<T>(cellClass : T.Type, indexPath: IndexPath) -> T where T: UITableViewCell
    {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }
}

extension String {
    func localized() -> String {
        if UserDefaultsHelper.getString(key: "AppLanguage") == "az" {
            let path = Bundle.main.path(forResource: "az", ofType: "lproj")
            let bundle = Bundle(path: path!)
            return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
        }
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
    }
}
extension UIImageView {
    func loadURL(_ url: String) {
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: urlString) {
            print(url)
            sd_setImage(with: url)
        }
    }
}
