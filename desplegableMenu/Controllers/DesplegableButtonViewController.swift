//
//  DesplegableButton.swift
//  desplegableMenu
//
//  Created by Camilo Cabana on 27/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class DesplegableButtonViewController: UIButton, DesplegableProtocol  {
    
    var height = NSLayoutConstraint()
    var isOpen = false
    var mySelection = String()
    
    let desplegableMenu: DespegableMenuViewController = {
        let despegableMenu = DespegableMenuViewController()
        despegableMenu.translatesAutoresizingMaskIntoConstraints = false
        return despegableMenu
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        desplegableMenu.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        superview?.addSubview(desplegableMenu)
        superview?.bringSubviewToFront(desplegableMenu)
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            if self.desplegableMenu.desplegableMenuTableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.desplegableMenu.desplegableMenuTableView.contentSize.height
            }
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.desplegableMenu.layoutIfNeeded()
                self.desplegableMenu.center.y += self.desplegableMenu.frame.height / 2
            }, completion: nil)
        } else {
            dismissDesplegableMenu()
        }
    }
    
    func dismissDesplegableMenu() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.desplegableMenu.center.y -= self.desplegableMenu.frame.height / 2
            self.desplegableMenu.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setLayout() {
        height = desplegableMenu.heightAnchor.constraint(equalToConstant: 0)
        desplegableMenu.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        desplegableMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        desplegableMenu.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func mySelection(string: String) {
        setTitle(string, for: .normal )
        dismissDesplegableMenu()
    }
}
