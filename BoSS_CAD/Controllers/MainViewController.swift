//
//  MainViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit

class MainViewController: UIViewController {
    
    var mealTimeArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""

        setupTableView()
        setupNavigationBar()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        tableView.register(UINib(nibName: "PlusCell", bundle: nil), forCellReuseIdentifier: "PlusCell")
    }
    
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func addCellButtonTapped(_ sender: UIButton) {
        mealTimeArray.append("아침")
        tableView.reloadData()
    }
    
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calcAVC = storyboard.instantiateViewController(withIdentifier:
            "CalcAVC") as! CalcAViewController
        navigationController?.pushViewController(calcAVC, animated: true)
    }
    
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealTimeArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == mealTimeArray.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlusCell", for: indexPath) as! PlusCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            
            cell.mealTimeLabel.text = mealTimeArray[indexPath.row]
            return cell
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(mealTimeArray.count == indexPath.row) {
            print("plus")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
            
            detailVC.mealTimeText = mealTimeArray[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
}
