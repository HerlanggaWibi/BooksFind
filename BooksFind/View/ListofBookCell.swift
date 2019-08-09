//
//  ListofBookCell.swift
//  BooksFind
//
//  Created by herlangga wibi on 03/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class ListofBookCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var rating: ASStarRatingView!
    
    func configure() {
        rating.canEdit = false
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
}
}
