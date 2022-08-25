//
//  ShoppingDetailViewController.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit
import RealmSwift //1.

class ShoppingDetailViewController: BaseViewController {

    
    let mainView = ShoppingDetailView()
    let localRealm = try! Realm() //2.
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      configure()
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
    }
    

    override func configure() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action:   #selector(detailsaveButtonTapped))
        
        mainView.imageButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
    }
    
    @objc func imageButtonTapped(){
        let vc = shoppoingImageViewController()
        let navi = UINavigationController(rootViewController: vc)
        self.present(navi, animated: true)

        
    }
    
    // Realm+imagedocument에 저장
    @objc func detailsaveButtonTapped(){
        guard let title = mainView.detailTextField.text else { return }
        let task = shoppingModel(list: title)
        do{
            try localRealm.write {
                localRealm.add(task)
            }
        } catch let error {
            print(error)
        }
        
        if let image = mainView.detailImageView.image {
            saveToDocument(fileName: "\(task.objectId)", image: image)
        }
        
        dismiss(animated: true)
  
    }
    
    func saveToDocument(fileName : String, image : UIImage){
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        
        do {
            try data.write(to: fileURL)
            
        } catch let error {
            print(error)
        }
    }
    
    
}
