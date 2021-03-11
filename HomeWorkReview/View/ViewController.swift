//
//  ViewController.swift
//  HomeWorkReview
//
//  Created by Apple on 3/9/21.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightButton1: UIBarButtonItem!
    
    var identifier: String!
    var arrItem = [Item]()
    var viewModel = ViewModel()
    var heightData: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getRequest { (item) in
            self.arrItem = item
            self.heightData = Float((self.arrItem.count * Int(self.tableView.frame.width)/2) - 300)
            self.tableView.reloadData()
        }
       setUpView()
    }

    func setUpView(){
        tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
        tableView.register(UINib(nibName: "ThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "ThirdTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        barButton.tintColor = .black
        rightButton1.tintColor = .black
        heightData = Float(arrItem.count * Int(tableView.frame.width) + 150)
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate , UpdateTableview {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as? FirstTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell", for: indexPath) as? ThirdTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        }
    }
    
    func updateTableViewMenu() {
        heightData = Float((arrItem.count * Int(tableView.frame.width)/2) - 300)
        tableView.reloadData()
    }
    
    func updateTableViewRound() {
        heightData = Float(arrItem.count * Int(tableView.frame.width)) + 150
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return CGFloat(heightData)
        }else {
            return UITableView.automaticDimension
            
        }
    }
}
