//
//  TestViewController.swift
//  MovieAPPforATL
//
//  Created by Fagan Aslanli on 13.03.24.
//

import Foundation
import UIKit
class TestController: UIViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 12
        view.anchorSize(.init(width: 100, height: 100))
        return view
    }()
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 24
        view.anchorSize(.init(width: 0, height: 200))
        return view
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
//        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        button.setTitleColor(.red, for: .normal)
        button.setImage(UIImage(named: "avatar"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(redView)
        view.addSubview(greenView)
        redView.centerInSuperview()
        redView.anchorSize(.init(width: 100, height: 100))
        
        greenView.anchor(
            top: redView.bottomAnchor,
            leading: view.leadingAnchor,
            bottom: nil,
            trailing: view.trailingAnchor,
            padding: .init(top: 12, left: 12, bottom: 0, right: -12))
        
        redView.addSubview(testLabel)
        testLabel.fillSuperview(padding: .init(top: 12, left: 8, bottom: -24, right: -16))
        
        greenView.addSubview(submitButton)
        submitButton.centerInSuperview()
        submitButton.anchorSize(.init(width: 0, height: 56))
        
        //        testView.translatesAutoresizingMaskIntoConstraints = false
        //        testView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        testView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        let horizontalConstraint = testView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        //        let verticalConstraint = testView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        
    }
    
    @objc func submitButtonClicked() {
        print(#function)
    }
}
