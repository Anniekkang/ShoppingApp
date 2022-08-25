//
//  TextField.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit

class TextField : UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(){
        backgroundColor = .systemGray5
        textColor = .black
        layer.cornerRadius = 5
      
    }
    
}


