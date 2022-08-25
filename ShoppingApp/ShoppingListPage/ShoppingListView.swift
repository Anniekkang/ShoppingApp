//
//  ShoppingListView.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit
import SnapKit

class ShoppingListView: BaseView {

  
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let shoppingTextField : TextField = {
        let view = TextField()
        view.placeholder = "쇼핑목록을 작성하시오"
        return view
    }()
    
    let saveButton : UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 5
        view.setTitle("저장", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        return view
        
    }()
    
    let listTableView : UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = .systemGray6
        return view
        
    }()
    
    override func configure() {
        [shoppingTextField,listTableView].forEach {
            self.addSubview($0)
        }
        shoppingTextField.addSubview(saveButton)
        
        
    }
    
    override func setConstraints() {
        shoppingTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(safeAreaLayoutGuide).offset(30)
            make.leadingMargin.equalTo(safeAreaLayoutGuide).offset(30)
            make.trailingMargin.equalTo(safeAreaLayoutGuide).offset(-30)
            make.height.equalTo(80)
        }
        
        saveButton.snp.makeConstraints { make in
            make.topMargin.equalTo(shoppingTextField.snp.topMargin).offset(20)
            make.bottomMargin.equalTo(shoppingTextField.snp.bottomMargin).offset(-20)
            make.trailingMargin.equalTo(shoppingTextField.snp.trailingMargin).offset(-20)
            make.width.equalTo(50)
        }
        
        listTableView.snp.makeConstraints { make in
            make.topMargin.equalTo(shoppingTextField.snp.bottomMargin).offset(30)
            make.leadingMargin.trailingMargin.bottomMargin.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    
    
    
    
}
