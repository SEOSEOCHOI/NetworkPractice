//
//  BeerListViewController.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import UIKit
import Kingfisher

class BeerListViewController: UIViewController {
    
    let manager = BeerListAPIManager()
    var list: Beer = []
    var count = 2
    
    
    @IBOutlet var beerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerTableView.dataSource = self
        beerTableView.delegate = self
        
        
        
    }
    
    
    
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        manager.callRequest { value in
            print(value.count)
            self.count = value.count
            self.beerTableView.reloadData()

        }
        
        return count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListTableViewCell", for: indexPath) as! BeerListTableViewCell
        
                manager.callRequest { value in
                    //self.list = value[indexPath.row]
        
                    //print(value.count)
        
                    let url = URL(string: value[indexPath.row].imageURL)
                    cell.beerImageView.kf.setImage(with: url)
        
        
                    cell.beerNameLabel.text = value[indexPath.row].name
                    cell.beerDescpriptionLabel.text = value[indexPath.row].description
                    self.beerTableView.reloadData()
          }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
