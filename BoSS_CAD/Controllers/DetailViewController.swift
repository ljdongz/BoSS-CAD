//
//  DetailViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/03.
//

import UIKit

class DetailViewController: UIViewController {
    
    var mealTimeText: String?

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = mealTimeText
        // Do any additional setup after loading the view.
    }

}
