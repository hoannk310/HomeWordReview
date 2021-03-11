//
//  DataCollectionViewCell.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func draw(_ rect: CGRect) {
        imgCell.layer.cornerRadius = 10
        btnRight.tintColor = .black
    }
    
    func bindData(item: Item){
        imgCell.loadImage(url: URLImage + item.image)
        lblName.text = item.name
        lblPrice.text = "\(item.price)"
    }
}
