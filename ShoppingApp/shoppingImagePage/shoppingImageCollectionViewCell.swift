//
//  shoppingImageCollectionViewCell.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/26.
//

import UIKit
import SnapKit
import Kingfisher

class shoppingImageCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
       let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
        
        
    }()
    
    func configure(){
        self.addSubview(imageView)

    }
    
    func setConstraints(){
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
    }
    
    func setImage(data : String){
        let url = URL(string: data)
        imageView.kf.setImage(with: url)
        
        
        
        
    }
    
}
