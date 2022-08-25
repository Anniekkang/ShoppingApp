//
//  shoppoingImageViewController.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/26.
//

import UIKit
import RealmSwift

class shoppoingImageViewController: BaseViewController {

    let mainView = shoppoingImageView()
    var delegate : SelectImageDelegate?
    var selectedImage : UIImage?
    var selectedIndexPath : IndexPath?
    var detail = ShoppingDetailViewController()
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(shoppingImageCollectionViewCell.self, forCellWithReuseIdentifier: shoppingImageCollectionViewCell.reuseIdentifier)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(selectedImageButtonTapped))
    }
    
}

extension shoppoingImageViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageDummy.data.count
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? shoppingImageCollectionViewCell else { return }
        
        selectedImage = cell.imageView.image
        selectedIndexPath = indexPath
       
        print(#function)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shoppingImageCollectionViewCell.reuseIdentifier, for: indexPath) as? shoppingImageCollectionViewCell else { return UICollectionViewCell()}
        
       
        cell.setImage(data: ImageDummy.data[indexPath.row].url)
        cell.layer.borderColor = selectedIndexPath == indexPath ? UIColor.black.cgColor : nil
        cell.layer.borderWidth = selectedIndexPath == indexPath ? 4 : 0
        
        return cell
    }
    
    @objc func selectedImageButtonTapped(){
        print(#function)
       
        delegate?.sendImageDate(image: selectedImage!)
       dismiss(animated: true)
  
        
    }


}

extension ShoppingDetailViewController : SelectImageDelegate {
    func sendImageDate(image: UIImage) {
        ShoppingDetailViewController().mainView.detailImageView.image = image
    }
    
    
}
