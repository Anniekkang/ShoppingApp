//
//  ShoppingDetailView.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit

class ShoppingDetailView: BaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let detailImageView : UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .systemGray5
        view.image = UIImage(systemName: "star")
        return view
    }()
    
    let detailTextField : TextField = {
        let view = TextField()
        return view
    }()
    
    let detailTextView : UITextView = {
        let view = UITextView()
        view.backgroundColor = .systemGray5
        view.textColor = .black
        view.layer.cornerRadius = 5
        return view
    }()
    
    let imageButton : UIButton = {
       let view = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        view.setImage(UIImage(systemName: "photo.circle.fill", withConfiguration: largeConfig), for: .normal)
        view.tintColor = .black
       
        
        return view
    }()
    
    
    override func configure() {
        [detailImageView,detailTextField,detailTextView,imageButton].forEach {
            self.addSubview($0)
        }
      
    }
    
    override func setConstraints() {
        detailImageView.snp.makeConstraints { make in
            make.topMargin.equalTo(30)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(self).multipliedBy(0.4)
            
        }
        
        detailTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(detailImageView.snp.bottomMargin).offset(30)
            make.leadingMargin.equalTo(detailImageView.snp.leadingMargin)
            make.trailingMargin.equalTo(detailImageView.snp.trailingMargin)
            make.height.equalTo(40)
        }
        
        detailTextView.snp.makeConstraints { make in
            make.topMargin.equalTo(detailTextField.snp.bottomMargin).offset(30)
            make.leadingMargin.equalTo(detailTextField.snp.leadingMargin)
            make.trailingMargin.equalTo(detailTextField.snp.trailingMargin)
            make.height.equalTo(self).multipliedBy(0.2)
        }
        
        imageButton.snp.makeConstraints { make in
            make.bottomMargin.equalTo(detailImageView.snp.bottomMargin).offset(-30)
            make.trailingMargin.equalTo(-50)
            make.height.width.equalTo(60)
        }
        
        
    }

}
