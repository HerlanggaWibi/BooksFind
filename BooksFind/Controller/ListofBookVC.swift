//
//  ListofBookVC.swift
//  BooksFind
//
//  Created by herlangga wibi on 03/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ListofBookVC: UICollectionViewController {
    
    
    var resultData: [ListBook]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout()
    }
    
    func flowLayout() {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/2, height: (self.collectionView.frame.size.height) / 2.5)
        layout.minimumLineSpacing = 30
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (resultData?.count)!
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ListofBookCell

        cell.configure()
        cell.title.text = resultData?[indexPath.row].title
        cell.image.setImage(with: (resultData?[indexPath.row].image!)!)
        cell.author.text = resultData?[indexPath.row].author
        cell.rating.rating = resultData?[indexPath.row].rating ?? 0
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailBook") as! DetailBookVC
        vc.judul = (resultData?[indexPath.row].title)!
        vc.gambar = (resultData?[indexPath.row].image)!
        vc.penulis = (resultData?[indexPath.row].author)!
        vc.reting = (resultData?[indexPath.row].rating)!
        vc.deskripsi = (resultData?[indexPath.row].description)!
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        let kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}

