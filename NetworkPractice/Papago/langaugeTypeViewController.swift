//
//  tarLangTypeViewController.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import UIKit

class langaugeTypeViewController: UIViewController {
    
    var seletedData: String = ""

    @IBOutlet var languageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()

    }
    

}

extension langaugeTypeViewController {
    func configureView() {
        
        let xib = UINib(nibName: "languageTypeTableViewCell", bundle: nil)
        
        languageTableView.register(xib, forCellReuseIdentifier: "languageTypeTableViewCell")

        
        languageTableView.dataSource = self
        languageTableView.delegate = self
        
    }
}

extension langaugeTypeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PapagoValue.lagnuageDictionry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageTypeTableViewCell", for: indexPath) as! languageTypeTableViewCell
        
        var languageArray:[String] = []
        
        for language in PapagoValue.code.allCases{
            languageArray.append(String(describing: language))
        }
        
        cell.languageLabel.text = languageArray[indexPath.row]

        if cell.languageLabel.text == seletedData {
            cell.languageLabel.textColor = .red
        }
            
        
        
        return cell
    }
    
    
}
