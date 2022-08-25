//
//  ShoppingListTableViewCell.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    
    func setData(data: shoppingModel) {
        listLabel.text = data.list
        
    }
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 2
        return view
    }()
    
    let checkBoxButton : UIButton = {
        let view = UIButton()
        view.tintColor = .black
        view.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        return view
    }()
    
    let favoriteButton : UIButton = {
       let view = UIButton()
        view.tintColor = .black
        view.setImage(UIImage(systemName: "star"), for: .normal)
        return view
    }()
    
    
    let listLabel : UILabel = {
        let view = UILabel()
        view.textColor = .black
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        constraints()
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    func configure(){
        
        self.addSubview(stackView)
        [checkBoxButton,listLabel,favoriteButton].forEach {
            stackView.addArrangedSubview($0)
            
        }
        
    }
    
    func constraints(){

        
        stackView.snp.makeConstraints { make in
            make.leadingMargin.top.equalTo(2)
            make.bottom.trailing.equalTo(-2)
            
        }
        
        
    }
}
