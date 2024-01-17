//
//  BookCollectionViewCell.swift
//  NetworkPractice
//
//  Created by 최서경 on 1/17/24.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var bookNameLabel: UILabel!
    @IBOutlet var bookAuthorsLabel: UILabel!
    @IBOutlet var bookPublisherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
