//
//  CustomTextField.swift
//  BooksFind
//
//  Created by herlangga wibi on 07/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var rightImage: UIButton? {
        didSet{
            updateView()
        }
    }
    
    
    func updateView() {
        rightViewMode = UITextField.ViewMode.always
        var view: UIView!
        
        
        
        if let image = rightImage    {
            
        }
        
    }

}
