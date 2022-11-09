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
    @IBOutlet weak var totalKcal: UILabel!
    @IBOutlet weak var totalCarbo: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    @IBOutlet weak var totalFat: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonTapped))
        
        title = mealTimeText!
        setupTableView()
    }
    
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        print(foodList)
        updateTotalInfo()
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FoodListCell", bundle: nil), forCellReuseIdentifier: "FoodListCell")
        tableView.rowHeight = 130
    }
    
    func updateTotalInfo() {
        var sumKcal = 0.0
        var sumCarbo = 0.0
        var sumProtein = 0.0
        var sumFat = 0.0
        
        for food in foodList {
            sumKcal += Double(food.nutrCont1) ?? 0
            sumCarbo += Double(food.nutrCont2) ?? 0
            sumProtein += Double(food.nutrCont3) ?? 0
            sumFat += Double(food.nutrCont4) ?? 0
        }
        
        totalKcal.text = "총 섭취 칼로리 : \(round(sumKcal*10)/10)"
        totalCarbo.text = "총 섭취 탄수화물 : \(round(sumCarbo*10)/10)"
        totalProtein.text = "총 섭취 단백질 : \(round(sumProtein*10)/10)"
        totalFat.text = "총 섭취 지방 : \(round(sumFat*10)/10)"
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodListCell", for: indexPath) as! FoodListCell
        
        let foodData = foodList[indexPath.row]
        
        cell.nameLabelText.text = foodData.descKor
        cell.sizeLabelText.text = foodData.servingSize
        cell.kcalLabelText.text = foodData.nutrCont1
        cell.carbohydrateLabelText.text = foodData.nutrCont2
        cell.proteinLabelText.text = foodData.nutrCont3
        cell.fatLabelText.text = foodData.nutrCont4
        
        return cell
    }
    
    
}
