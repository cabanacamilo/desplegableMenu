//
//  DesplegableMenuViewController.swift
//  desplegableMenu
//
//  Created by Camilo Cabana on 27/11/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class DespegableMenuViewController: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var delegate: DesplegableProtocol!
    
    let desplegableMenuTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        return myTableView
    }()
    
    let desplegableMenuInfo: [String] = {
        return ["1","2","3","4","5","6"]
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(desplegableMenuTableView)
        desplegableMenuTableView.delegate = self
        desplegableMenuTableView.dataSource = self
        desplegableMenuTableView.register(DespegableMenuViewCell.self, forCellReuseIdentifier: "DesplegableMenu")
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desplegableMenuInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DesplegableMenu", for: indexPath) as! DespegableMenuViewCell
        cell.menuLabel.text = desplegableMenuInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.mySelection(string: desplegableMenuInfo[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func setLayout() {
        desplegableMenuTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        desplegableMenuTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        desplegableMenuTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        desplegableMenuTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
