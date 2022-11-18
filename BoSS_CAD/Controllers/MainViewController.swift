//
//  MainViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit

class MainViewController: UIViewController {
    
    var mealTimeArray: [String] = []
    var userKcalvalue = "0"
    var userId: String?
    
    @IBOutlet weak var userKcal: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = userId

        setupTableView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 사용자의 칼로리를 가져옴
        RealTimeDBManager.shared.ref.child("users/\(userId!)/kcal").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            self.userKcalvalue = snapshot?.value as? String ?? ""
            self.userKcal.text = self.userKcalvalue + " Kcal"
        }
        
        // 사용자의 식단 리스트를 가져옴
        
        RealTimeDBManager.shared.ref.child("users/\(userId)/diets").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }

            print(snapshot?.value)
        }
    }
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 130
        tableView.register(UINib(nibName: "PlusCell", bundle: nil), forCellReuseIdentifier: "PlusCell")
    }
    
    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
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
    // 셀 클릭 시 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(mealTimeArray.count == indexPath.row) {
            print("plus")
            
            let alert = UIAlertController(title: "title",message: nil , preferredStyle: .alert)
            alert.addTextField { field in
                // textField 설정
            }
            
            let create = UIAlertAction(title: "생성", style: .default) { action in
                if let textField = alert.textFields?[0].text {
                    self.mealTimeArray.append(textField)
                    tableView.insertRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .bottom)
                    
//                    RealTimeDBManager.shared.ref.child("users/\(self.userId!)/diets").setValue("\(textField)")
                }
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(create)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
            
            detailVC.mealTimeText = mealTimeArray[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
    // 셀 스와이프 시 이벤트
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mealTimeArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .top)
            
        } else if editingStyle == .insert {
            print("insert")
        }
    }
}
