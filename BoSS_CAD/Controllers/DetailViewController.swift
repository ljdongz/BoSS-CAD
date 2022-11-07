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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped))
        
        title = mealTimeText!
    }
    
    func setupTableView() {
        tableView.dataSource = self
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

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
}
