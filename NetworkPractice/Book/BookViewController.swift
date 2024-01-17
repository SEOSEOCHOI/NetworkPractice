//
//  BookViewController.swift
//  SeSAC4Network
//
//  Created by 최서경 on 1/17/24.
//

import UIKit
import Kingfisher


class BookViewController: UIViewController {
    
    let manager = BookAPIManager()
    var list: [Document] = []
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var bookCollectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        setCollectionViewLayout()
        
        
    }
    
}

//MARK: View
extension BookViewController {
    func configureView() {
        searchBar.delegate = self
        tabBarItem.title = "Book"
    }
}

// MARK: SearchBar
extension BookViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        manager.callRuest(text: searchBar.text!) { value in
            self.list = value.documents
            self.bookCollectionVIew.reloadData()

        }
    }
}
//MARK: CollectionView
extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookCollectionVIew.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell

        let item = list[indexPath.row]
        
        let url = URL(string: item.thumbnail)
        
        var authors: String = ""
        for author in item.authors {
            authors = authors + author
        }
        cell.backgroundColor = UIColor(red: CGFloat(Int.random(in: 0...1)),
                                                     green: CGFloat(Int.random(in: 0...1)),
                                                     blue: CGFloat(Int.random(in: 0...1)),
                                       alpha: 0.3)
        cell.bookImageView.kf.setImage(with: url)
        cell.bookNameLabel.text = item.title
        cell.bookNameLabel.numberOfLines = 0
        cell.bookAuthorsLabel.text = authors
        cell.bookAuthorsLabel.numberOfLines = 0
        cell.bookPublisherLabel.text = item.publisher
        cell.bookPublisherLabel.numberOfLines = 0
        return cell
    }
}

extension BookViewController {
    func configureCollectionView() {
        let xib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        
        bookCollectionVIew.register(xib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        bookCollectionVIew.delegate = self
        bookCollectionVIew.dataSource = self
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.4)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        
        bookCollectionVIew.collectionViewLayout = layout
    }
}

