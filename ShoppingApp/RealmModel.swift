//
//  RealmModel.swift
//  ShoppingApp
//
//  Created by 나리강 on 2022/08/25.
//

import UIKit
import Realm
import RealmSwift

class shoppingModel : Object {
    @Persisted var favorite : Bool
    @Persisted var checkbox : Bool
    @Persisted var list : String
    
    
    @Persisted(primaryKey: true) var objectId : ObjectId
    
    convenience init(list : String){
        self.init()
        self.list = list
        self.favorite  = false
        self.checkbox = false
        
    }
    
}


class detailShoppingModel : Object {
    @Persisted var textField : String
    @Persisted var textView : String
    @Persisted var ImageURL : String?
    
    @Persisted(primaryKey: true) var objectId : ObjectId
    
    convenience init(textField : String, textView : String, ImageURL : String?){
        self.init()
        self.textField = textField
        self.ImageURL = ImageURL
        self.textView = textView
        
        
    }
}
