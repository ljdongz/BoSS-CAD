//
//  MainViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit
import KakaoSDKUser

class MainViewController: UIViewController {
    
    var dietsList: [String: [Row]] = [:]
    var mealTimeArray: [String] = []
    var foods: [Row]?
    
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
        
        // 사용자의 식단 리스트 및 식단에 포함된 음식 리스트를 가져옴
        RealTimeDBManager.shared.ref.child("users/\(userId!)/diets").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }

            let diets = snapshot?.value as? NSDictionary ?? [:]
            
            var carbo: String?
            var protein: String?
            var fat: String?
            var kcal: String?
            var size: String?
            
            self.mealTimeArray = []
            self.foods = []
            
            for (mealTime, foods) in diets {
                self.mealTimeArray.append(String(describing: mealTime))
                
                if String(describing: foods) == "" { continue }
                
                for (name, nutrient) in foods as! NSDictionary {
                    for (key, value) in nutrient as! NSDictionary {
                        
                        switch String(describing: key) {
                        case "carbo" :
                            carbo = String(describing: value)
                        case "protein" :
                            protein = String(describing: value)
                        case "fat" :
                            fat = String(describing: value)
                        case "kcal" :
                            kcal = String(describing: value)
                        case "size" :
                            size = String(describing: value)
                        default:
                            return
                        }
                    }
                    
                    self.foods?.append(Row(nutrCont1: kcal!, nutrCont2: carbo!, nutrCont3: protein!, nutrCont4: fat!, servingSize: size!, descKor: String(describing: name)))
                }
                self.dietsList[String(describing: mealTime)] = self.foods
            }
            
            print(self.foods)
            
            self.tableView.reloadData()
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
    
    @IBAction func logoutButton(_ sender: UIButton) {//로그아웃 버튼
        UserApi.shared.logout{(error) in
            if let error = error {
                print(error)
            }
            else{
                print("로그아웃 성공")
                self.navigationController?.popViewController(animated: true)
            }
        }
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
        if(mealTimeArray.count == indexPath.row) { // 식단 추가 셀
            print("plus")
            
            let alert = UIAlertController(title: "title",message: nil , preferredStyle: .alert)
            alert.addTextField { field in
                // textField 설정
            }
            
            let create = UIAlertAction(title: "생성", style: .default) { action in
                if let textField = alert.textFields?[0].text {
                    self.mealTimeArray.append(textField)
                    tableView.insertRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .bottom)
                    
                    // DB에 식단 추가
                    RealTimeDBManager.shared.ref.child("users/\(self.userId!)/diets/\(textField)").setValue("")
                }
            }
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(create)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
        } else { // 식단 리스트 표시
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
            
            let mealTime = mealTimeArray[indexPath.row]
            
            detailVC.mealTimeText = mealTime
            detailVC.foodList = dietsList[mealTime] ?? []
            detailVC.userId = userId
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
    // 셀 스와이프 시 이벤트
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let diet = mealTimeArray[indexPath.row]
            print(diet)
            
            dietsList[mealTimeArray[indexPath.row]] = nil
            
            
            mealTimeArray.remove(at: indexPath.row)
            RealTimeDBManager.shared.ref.child("users/\(userId!)/diets/\(diet)").removeValue()
            
            
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .top)
            
        }
    }
}
