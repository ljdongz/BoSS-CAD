//  Created by JunHee on 2022/11/04.

import UIKit

class CalcBViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var choiceLabel1: UILabel!
    @IBOutlet weak var choiceLabel2: UILabel!
    @IBOutlet weak var choiceLabel3: UILabel!
    @IBOutlet weak var choiceLabel4: UILabel!
    @IBOutlet weak var choiceLabel5: UILabel!
    
    var selectedChoice : Int = 3
    var userBMR : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        setGesture()
    }
    
    func makeUI() {
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10
        
        choiceLabel1.text = "거의 운동하지 않음"
        choiceLabel2.text = "가벼운 운동(주 1~3일)"
        choiceLabel3.text = "보통 수준의 운동(주 4~5일)"
        choiceLabel4.text = "적극적으로 운동(주 6~7일)"
        choiceLabel5.text = "매우 적극적으로 운동(주 7일)"
        
        choiceLabel1.clipsToBounds = true
        choiceLabel1.layer.cornerRadius = 10
        choiceLabel1.layer.borderWidth = 2.5
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel2.clipsToBounds = true
        choiceLabel2.layer.cornerRadius = 10
        choiceLabel2.layer.borderWidth = 2.5
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel3.clipsToBounds = true
        choiceLabel3.layer.cornerRadius = 10
        choiceLabel3.layer.borderWidth = 2.5
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        choiceLabel4.clipsToBounds = true
        choiceLabel4.layer.cornerRadius = 10
        choiceLabel4.layer.borderWidth = 2.5
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel5.clipsToBounds = true
        choiceLabel5.layer.cornerRadius = 10
        choiceLabel5.layer.borderWidth = 2.5
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    
    func setGesture() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(choiceLabel1Tapped))
        choiceLabel1.addGestureRecognizer(tapGesture1)
        choiceLabel1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(choiceLabel2Tapped))
        choiceLabel2.addGestureRecognizer(tapGesture2)
        choiceLabel2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(choiceLabel3Tapped))
        choiceLabel3.addGestureRecognizer(tapGesture3)
        choiceLabel3.isUserInteractionEnabled = true
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(choiceLabel4Tapped))
        choiceLabel4.addGestureRecognizer(tapGesture4)
        choiceLabel4.isUserInteractionEnabled = true
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(choiceLabel5Tapped))
        choiceLabel5.addGestureRecognizer(tapGesture5)
        choiceLabel5.isUserInteractionEnabled = true
    }
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calcCVC = storyboard.instantiateViewController(withIdentifier:
            "CalcCVC") as! CalcCViewController
        calcCVC.userDMR = calDMR (bmr : userBMR, choice : selectedChoice)
        navigationController?.pushViewController(calcCVC, animated: true)
    }
    
    @objc func choiceLabel1Tapped() {
        selectedChoice = 1
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func choiceLabel2Tapped() {
        selectedChoice = 2
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func choiceLabel3Tapped() {
        selectedChoice = 3
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func choiceLabel4Tapped() {
        selectedChoice = 4
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func choiceLabel5Tapped() {
        selectedChoice = 5
        choiceLabel1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel5.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
}
