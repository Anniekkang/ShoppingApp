//
//  ShoppingDetailViewController.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit

class ShoppingDetailViewController: BaseViewController {

    
    let mainView = ShoppingDetailView()
    
    override func loadView() {
        self.view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      configure()
        
    }
    

    override func configure() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action:   #selector(detailsaveButtonTapped))
        
       
        
        mainView.imageButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
    }
    
    @objc func imageButtonTapped(){
        let vc = shoppoingImageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc func detailsaveButtonTapped(){
        
        
        
    }
    
  
}
