//
//  MovieDetailController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 18.03.24.
//

import UIKit

class MovieDetailController: UIViewController {
    @IBOutlet private weak var trailerButton: UIButton!
    var viewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        trailerButton.setTitle(viewModel.selectedMovie?.titleString, for: .normal)
        
    }
    
    @IBAction func trailerButtonAction(_ sender: Any) {
        showWebViewController()
        print(#function)
    }
    
    fileprivate func showWebViewController() {
        let vc = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController ?? WebViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
