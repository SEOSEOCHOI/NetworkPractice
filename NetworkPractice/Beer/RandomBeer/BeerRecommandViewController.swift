//
//  BeerRecommandViewController.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerRecommandViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var beerImageView: UIImageView!
    @IBOutlet var beerNameLabel: UILabel!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var expainLabel: UILabel!
    
    let manager = BeerAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    
        
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        callManager()
    }
}

extension BeerRecommandViewController {
    func configureView() {
        titleLabel.text = "오늘은 이 맥주를 추천합니다!"
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        
        beerNameLabel.font = .systemFont(ofSize: 15)
        beerNameLabel.textAlignment = .center

        expainLabel.font = .systemFont(ofSize: 13)
        expainLabel.textAlignment = .center
        expainLabel.numberOfLines = 0
        
        
        randomButton.setTitle("다른 맥주 추천받기", for: .normal)
        randomButton.titleLabel?.font = .systemFont(ofSize: 15)
        randomButton.setTitleColor(.systemPink, for: .normal)
        
        callManager()
    }
}

extension BeerRecommandViewController {
    func callManager() {
        manager.callRequest { value in
            let url = URL(string: value[0].imageURL ?? "")
            self.beerImageView.kf.setImage(with: url)
            
            self.beerNameLabel.text = value[0].name
            self.expainLabel.text = value[0].description
        }
    }
}
