//
//  ThirdTableViewCell.swift
//  HomeWorkReview
//
//  Created by Apple on 3/10/21.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var roundBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var btnPopular: UIButton!
    @IBOutlet weak var lblProducts: UILabel!
    
    
var viewModel = ViewModel()
    var item = [Item]()
    
    var widthItem = CGFloat()
    var heightItem = CGFloat()
    
    var delegate: UpdateTableview!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        viewModel.getRequest { (item) in
            self.item = item
            self.widthItem = CGFloat(Float(self.collectionView.bounds.width/2 - 10))
            self.heightItem =  CGFloat(Float(self.collectionView.bounds.width - 100))
            self.lblProducts.text = "\(item.count) products"
            self.collectionView.reloadData()
        }
        
    }
    
    func setUpView() {
        collectionView.register(UINib(nibName: "DataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        menuBtn.setImage(UIImage(named: "menu"), for: .normal)
        roundBtn.setImage(UIImage(named: "rounded-rectangle"), for: .normal)
        btnPopular.tintColor = .black
    }
    
    @IBAction func roundBtn(_ sender: Any) {
        
        self.widthItem = CGFloat(Float(self.collectionView.bounds.width - 20))
        self.heightItem =  CGFloat(Float(self.collectionView.bounds.width))
        self.collectionView.reloadData()
        menuBtn.setImage(UIImage(named: "menu (2)"), for: .normal)
        roundBtn.setImage(UIImage(named: "rounded-black-square-shape (1)"), for: .normal)
        
        delegate.updateTableViewRound()
    }
    
    @IBAction func menuBtn(_ sender: Any) {
    
        self.widthItem = CGFloat(Float(self.collectionView.bounds.width/2 - 10))
        self.heightItem =  CGFloat(Float(self.collectionView.bounds.width - 100))
        self.collectionView.reloadData()
        menuBtn.setImage(UIImage(named: "menu"), for: .normal)
        roundBtn.setImage(UIImage(named: "rounded-rectangle"), for: .normal)
        
        delegate.updateTableViewMenu()
    }
    
}
extension ThirdTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as? DataCollectionViewCell else {return UICollectionViewCell()}
        if widthItem == CGFloat(Float(self.collectionView.bounds.width/2 - 10))  {
            cell.btnRight.isHidden = true
        }
        else {
            cell.btnRight.isHidden = false
        }
        if item.count != 0 {
            cell.bindData(item: item[indexPath.row])
            return cell
        }
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthItem, height: heightItem)
    }
  
}

