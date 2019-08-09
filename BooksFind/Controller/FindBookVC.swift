//
//  FindBookVC.swift
//  BooksFind
//
//  Created by herlangga wibi on 01/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FindBookVC: UIViewController {
    
    @IBOutlet weak var searchBook: UITextField!
    
    var resultData = [ListBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        searchBook.becomeFirstResponder()
        setLeftImage()
        roundedTextField()
    }
    
    func setLeftImage() {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icons8-search-24.png"), for: .normal)
        button.addTarget(self, action: #selector(self.searchBook1), for: .touchUpInside)
        button.frame = CGRect(x: CGFloat(searchBook.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 3)
        
        searchBook.rightView = button
        searchBook.rightViewMode = .always
    }
    
    func roundedTextField() {
        searchBook.layer.cornerRadius = 15.0
        searchBook.layer.borderWidth = 2.0
        searchBook.layer.borderColor = UIColor.gray.cgColor
    }
    
    @objc func searchBook1(_ sender: Any) {
        if searchBook.text == "" {
                ProgressHUD.showError("Silahkan masukkan keyword", interaction: true)
        }
        else {
            execute()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.searchBook.resignFirstResponder()
    }
    
    
    func execute() {
        let param = searchBook.text!
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?")
        let parameter = ["q": param]
        Alamofire.request(url!, method: .get, parameters: parameter).responseJSON { (response) in
            if response.response?.statusCode != 200 {
                ProgressHUD.showError("Buku tidak ditemukan", interaction: true)
            }
            else {
                if response.result.isSuccess {
                    let result: JSON = JSON(response.result.value!)
                    self.saveData(data: result)
                }
                else {
                    print("error: ",response.result.isFailure)
                }
            }
        }

    }
    
    func saveData(data: JSON) {
        let items = data["items"]
        for i in 0..<items.count {
            let title = items[i]["volumeInfo"]["title"].stringValue
            let author = items[i]["volumeInfo"]["authors"][0].stringValue
            let imagePreview = items[i]["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
            let rating = items[i]["volumeInfo"]["averageRating"].floatValue
            let description = items[i]["volumeInfo"]["description"].stringValue
            
            resultData.append(ListBook(title: title, image: imagePreview, author: author, rating: rating, description: description))
        }
        if resultData.count > 1 {
            self.performSegue(withIdentifier: "listBook", sender: self)
            resultData = [ListBook]()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "listBook" {
            
            let destinationVC = segue.destination as! UINavigationController
            let passData = destinationVC.topViewController as! ListofBookVC

            passData.resultData = resultData
            
        }
    }

}
