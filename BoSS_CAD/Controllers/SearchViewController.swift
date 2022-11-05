//
//  SearchViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/04.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var foodDatas: [Row] = []
    var appendedDatas: [Row] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let vcStack = self.navigationController?.viewControllers else { return }
        for vc in vcStack {
            if let detailView = vc as? DetailViewController {
                detailView.foodList = self.appendedDatas
            }
        }
    }

}

// MARK: - SearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else { return }
        
        var url = "https://openapi.foodsafetykorea.go.kr/api/e59ca6152eff49a681b7/I2790/json/1/10/DESC_KOR=" + text
        print(url)
        
        let encodedStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // 문자열 타입의 URL을 구조체 타입의 URL로 변환
        guard let url = URL(string: encodedStr) else { print("err"); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // URL Session 생성 (서버랑 통신하는 객체 ~= 브라우저)
        // dataTask -> 비동기적으로 처리됨
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
            // error 발생 시 리턴
            if error != nil {
                print("err")
                return
            }
        
            // 응답코드에 따른 처리
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~=
            response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            // 데이터가 존재하면 출력
            if let safeData = data {
                do {
                    let decoder = JSONDecoder()

                    var decodedData = try decoder.decode(FoodData.self, from: safeData)

                    decodedData.i2790.row.sort { $0.descKor.count < $1.descKor.count }

                    self.foodDatas = decodedData.i2790.row
                    print(foodDatas)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Error")
                }
            }
        }.resume()
        
        
    }
}

// MARK: - TableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListCell", for: indexPath) as! SearchListCell
        
        let foodData = foodDatas[indexPath.row]
        
        cell.nameLabel.text = foodData.descKor
        cell.sizeLabel.text = foodData.servingSize
        cell.kcalLabel.text = foodData.nutrCont1
        cell.carbohydrateLabel.text = foodData.nutrCont2
        cell.proteinLabel.text = foodData.nutrCont3
        cell.fatLabel.text = foodData.nutrCont4
        
        return cell
    }
}

// MARK: - TableViewDelegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(foodDatas[indexPath.row])
        
        // create the alert
        let alert = UIAlertController(title: "추가하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { action in
            // 음식 리스트 추가
            self.appendedDatas.append(self.foodDatas[indexPath.row])
            
            // 확인 버튼
            let alertOK = UIAlertController(title: "추가되었습니다.", message: nil, preferredStyle: UIAlertController.Style.alert)
            alertOK.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alertOK, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
