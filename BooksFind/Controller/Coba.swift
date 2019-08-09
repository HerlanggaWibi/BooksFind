//
//  Coba.swift
//  BooksFind
//
//  Created by herlangga wibi on 06/08/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class Coba: UIViewController {

    @IBOutlet weak var ratingStar: ASStarRatingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingStar.canEdit = true
        ratingStar.notSelectedStar = UIImage(named: "not_selected_star.png")
        ratingStar.halfSelectedStar = UIImage(named: "half_selected_star.png")
        ratingStar.selectedStar = UIImage(named: "selected_star.png")
        ratingStar.maxRating = 10
        ratingStar.minAllowedRating = 2
        ratingStar.maxAllowedRating = 8
        ratingStar.rating = 5
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
