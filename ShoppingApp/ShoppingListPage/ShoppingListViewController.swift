//
//  ShoppingListViewController.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit
import SnapKit
import RealmSwift//1.

class ShoppingListViewController: BaseViewController {

    let mainView = ShoppingListView()
    
    let localRealm = try! Realm() //2.
    
    var tasks: Results<shoppingModel>! {
        didSet {
            mainView.listTableView.reloadData()
            print("tasks changed")
        }
    }
    
    
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchRealm()
    }
    

    func fetchRealm(){
        //Realm 3. Realm 데이터를 정렬해 tasks 에 담기
        tasks = localRealm.objects(shoppingModel.self).sorted(byKeyPath: "list", ascending: true)
    }
    
    override func configure() {
        mainView.listTableView.delegate = self
        mainView.listTableView.dataSource = self
        mainView.listTableView.register(ShoppingListTableViewCell.self, forCellReuseIdentifier: ShoppingListTableViewCell.reuseIdentifier)
        
        mainView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "정렬", style: .plain, target: self, action: #selector(sortButtonTapped))
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
    //정렬버튼
    @objc func sortButtonTapped(){
        
        
        tasks = localRealm.objects(shoppingModel.self).sorted(byKeyPath: "list", ascending: true)
        
        
    }
    
    //realm 저장
    @objc func saveButtonTapped(){
        print("button tapped")
        
        guard let title = mainView.shoppingTextField.text else { return }
        let task = shoppingModel(list: title)
        do {
            try localRealm.write{
                       localRealm.add(task)
                       print("realm succeed")
                }
            } catch {
                print(Error.self)
            }
       
                   mainView.listTableView.reloadData()
                   mainView.shoppingTextField.text = ""

    }
    
}

extension ShoppingListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell else { return UITableViewCell()}
        
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 5
        cell.setData(data: tasks[indexPath.row])
        cell.checkBoxButton.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        
        
        return cell
    }
    
    
    @objc func checkboxButtonTapped(){
        
        
        
    }
    
    @objc func favoriteButtonTapped(){
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShoppingDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let tasksFordeletion = tasks?[indexPath.row] {
                try! localRealm.write({
                    localRealm.delete(tasksFordeletion)
                })
                tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
 }

}
