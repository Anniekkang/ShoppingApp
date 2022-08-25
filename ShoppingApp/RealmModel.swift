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
