//
//  FirstTableViewCell.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let nameRoom = ["Living Room","Dining Room","Bathroom","Bedroom"]
    let arrImg = ["tv","dining","bathroom","lamp"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        
    }
    
    func setUpView() {
        collectionView.register(UINib(nibName: "HeaderCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FirstTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as? HeaderCollectionViewCell else {return UICollectionViewCell()}
        cell.bindData(text: nameRoom[indexPath.row], img: arrImg[indexPath.row])
        if indexPath.item != 0 {
            cell.viewCustom.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}
