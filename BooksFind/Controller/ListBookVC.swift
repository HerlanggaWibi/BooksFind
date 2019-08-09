//
//  ListBookVC.swift
//  BooksFind
//
//  Created by herlangga wibi on 01/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ListBookVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var searchInput: String?
    let url = "https://www.googleapis.com/books/v1/volumes?"
    
    var resultJSON = [ListBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataJSON()
    }
    
    func getDataJSON() {
        
        guard let param = searchInput else {return}
        print("param: \(param)")
        let parameter: [String: String] = ["q": "marketing"]
        
        Alamofire.request(url, method: .get, parameters: parameter).validate().responseJSON { (response) in
            if response.response?.statusCode == 200 {
                if response.result.isSuccess {
                    let responseBOOL = response.response?.statusCode
                    print("Status Code: \(String(describing: responseBOOL))")
                    let result: JSON = JSON(response.result.value!)
                    self.saveData(data: result)
                }
                else {
                    print("error: ",response.result.isFailure)
                }
            }
            else {
                print(response.response?.statusCode)
            }
        }
        
        
        
    } // Penutup Function
    
    func saveData(data: JSON) {
        let items = data["items"]
        for i in 0..<items.count {
            let title = items[i]["volumeInfo"]["title"].stringValue
            let author = items[i]["volumeInfo"]["authors"][0].stringValue
            let imagePreview = items[i]["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
            let rating = items[i]["volumeInfo"]["averageRating"].stringValue
            
            
            resultJSON.append(ListBook(title: title, image: imagePreview, author: author, rating: rating))
            collectionView.reloadData()
        }
    }
    
    
    
    
    


    
}

extension ListBookVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultJSON.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listBook", for: indexPath) as! ListBookCollectionVC
        
        print("resultJSON: \(resultJSON)")
        
        cell.title.text = resultJSON[indexPath.row].title
        cell.image.setImage(with: resultJSON[indexPath.row].image!)
        cell.author.text = resultJSON[indexPath.row].author
        cell.rating.text = resultJSON[indexPath.row].rating
        
        
        //        cell.image.setImage(with: obj.resultJSON[0].image!)
        //        cell.title.text = obj.resultJSON[0].title
        //        cell.author.text = obj.resultJSON[0].author
        //        cell.rating.text = obj.resultJSON[0].rating
        
        
        return cell
    }
}

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {return}
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        let kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}
