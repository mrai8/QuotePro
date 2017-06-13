//
//  QPobject.swift
//  QuotePro
//
//  Created by Mandeep on 2017-06-12.
//  Copyright © 2017 Mandeep. All rights reserved.
//

import UIKit


class QPObject: NSObject {
    var quote:String
    var photo:UIImage
    
    init?(quote:String, photo:UIImage){
        self.quote = quote
        self.photo = photo
    }
}
