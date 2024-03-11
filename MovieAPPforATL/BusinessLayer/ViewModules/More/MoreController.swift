//
//  MoreController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class MoreController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var changeButton: UIButton!
    
    @IBAction func changeButtonAction(_ sender: Any) {
        UserDefaultsHelper.setString(key: "AppLanguage", value: "en")
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate {
            delegate.reloadApp()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "hi".localized()
    }

}
