//
//  DespegableMenuViewCell.swift
//  desplegableMenu
//
//  Created by Camilo Cabana on 27/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class DespegableMenuViewCell: UITableViewCell {
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        backgroundColor = .lightGray
        addSubview(menuLabel)
        setLayout()
    }
    
    func setLayout() {
        menuLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        menuLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }

}
