//
//  CustomView.swift
//  HomeWorkReview
//
//  Created by Apple on 3/9/21.
//

import Foundation
import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    func setCustomView() {
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
