//
//  HeaderCollectionViewCell.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCustom: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblRoom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        viewCustom.layer.cornerRadius = viewCustom.frame.height/2
    }
    func bindData(text: String, img: String){
        lblRoom.text = text
        imgCell.image = UIImage(named: img)
    }
}
