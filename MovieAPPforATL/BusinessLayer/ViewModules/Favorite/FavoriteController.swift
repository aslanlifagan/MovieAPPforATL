//
//  FavoriteController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 26.02.24.
//

import UIKit

class FavoriteController: UIViewController {
    @IBOutlet private weak var testButton: UIButton!
    
    @IBAction func testButtonAction(_ sender: Any) {
        let vc = TestController()
        present(vc, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
