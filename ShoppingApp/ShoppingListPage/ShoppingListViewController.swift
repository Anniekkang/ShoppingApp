//
//  ShoppingListViewController.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit
import SnapKit

class ShoppingListViewController: BaseViewController {

    let mainView = ShoppingListView()
    var shoppingList : [String] = ["ddd","dddd"]
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    

    override func configure() {
        mainView.listTableView.delegate = self
        mainView.listTableView.dataSource = self
        mainView.listTableView.register(ShoppingListTableViewCell.self, forCellReuseIdentifier: ShoppingListTableViewCell.reuseIdentifier)
        
        mainView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc func saveButtonTapped(){
        
        guard let shopping = mainView.shoppingTextField.text else { return }
        shoppingList.append(shopping)
        
    }

    
    
}

extension ShoppingListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell()}
        
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 5
        cell.listLabel.text = shoppingList[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}
