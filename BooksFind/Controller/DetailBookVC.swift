//
//  DetailBookVC.swift
//  BooksFind
//
//  Created by herlangga wibi on 08/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class DetailBookVC: UIViewController {
    
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var titleBook: UILabel!
    
    @IBOutlet var authorBook: UILabel!
    
    @IBOutlet var ratingBook: ASStarRatingView!
    
    @IBOutlet var descriptionBook: UITextView!
    
    var gambar = ""
    var judul = ""
    var penulis = ""
    var reting: Float?
    var deskripsi = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        image.setImage(with: gambar)
        titleBook.text = judul
        authorBook.text = penulis
        ratingBook.rating = reting ?? 0
        ratingBook.canEdit = false
        descriptionBook.text = deskripsi
    }
    
    
   

}
