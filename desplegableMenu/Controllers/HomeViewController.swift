//
//  ViewController.swift
//  desplegableMenu
//
//  Created by Camilo Cabana on 27/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let desplegableButton: DesplegableButtonViewController = {
        let button = DesplegableButtonViewController()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let desplegableMenu = DespegableMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(desplegableButton)
        desplegableButton.setTitle("Select", for: .normal)
        setLayout()
    }
    
    func setLayout() {
        desplegableButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        desplegableButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        desplegableButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        desplegableButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

