//
//  WebViewController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 18.03.24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        let url = URL(string: "https://www.themoviedb.org/movie/693134-dune-part-two#play=U2Qp5pL3ovA")
        webView.load(URLRequest(url:url!))
    }
}
