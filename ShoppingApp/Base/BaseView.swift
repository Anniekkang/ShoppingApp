//
//  BaseView.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit

class BaseView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
        
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configure(){}
    func setConstraints(){}

}
