//
//  Extension.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import Foundation
import Alamofire
import AlamofireImage

extension UIImageView {
    func loadImage(url: String) {
        AF.request(url,method: .get).responseImage { (response) in
            guard let data = response.data else {return}
            self.image = UIImage(data: data)
        }
    }
}
