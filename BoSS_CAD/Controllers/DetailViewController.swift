//
//  DetailViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/03.
//

import UIKit

class DetailViewController: UIViewController {
    
    var mealTimeText: String?
    var foodList: [Row] = []

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = mealTimeText
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped))
    }
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        print(foodList)
    }
    
    @objc func barButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "searchVC") as! SearchViewController
        navigationController?.pushViewController(searchVC, animated: true)
    }

}
