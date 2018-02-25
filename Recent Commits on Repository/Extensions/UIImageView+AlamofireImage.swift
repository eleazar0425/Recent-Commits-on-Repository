//
//  UIImageView+AlamofireImage.swift
//  Recent Commits on Repository
//
//  Created by Eleazar Estrella on 2/24/18.
//  Copyright © 2018 Eleazar Estrella. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView {
    func setImage(withPath path: String){
        guard let url = try? path.asURL() else {
            return
        }
        self.af_setImage(withURL: url)
    }
    
    func setImage(withPath path: String, placeholderImage placeholder: UIImage? = nil){
        guard let url = try? path.asURL() else {
            self.image =  placeholder
            return
        }
        self.af_setImage(withURL: url, placeholderImage: placeholder)
    }
}
