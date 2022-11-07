//  Created by JunHee on 2022/11/04.

import UIKit

class CalcBViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var choiceLabel_1: UILabel!
    @IBOutlet weak var choiceLabel_2: UILabel!
    @IBOutlet weak var choiceLabel_3: UILabel!
    @IBOutlet weak var choiceLabel_4: UILabel!
    @IBOutlet weak var choiceLabel_5: UILabel!
    
    var selectedChoice : Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGesture()
        makeUI()
    }
    func makeUI() {
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10
        
        choiceLabel_1.clipsToBounds = true
        choiceLabel_1.layer.cornerRadius = 10
        choiceLabel_1.layer.borderWidth = 2.5
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel_2.clipsToBounds = true
        choiceLabel_2.layer.cornerRadius = 10
        choiceLabel_2.layer.borderWidth = 2.5
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel_3.clipsToBounds = true
        choiceLabel_3.layer.cornerRadius = 10
        choiceLabel_3.layer.borderWidth = 2.5
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        choiceLabel_4.clipsToBounds = true
        choiceLabel_4.layer.cornerRadius = 10
        choiceLabel_4.layer.borderWidth = 2.5
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        choiceLabel_5.clipsToBounds = true
        choiceLabel_5.layer.cornerRadius = 10
        choiceLabel_5.layer.borderWidth = 2.5
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func setGesture() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(choiceLabelTapped_1))
        choiceLabel_1.addGestureRecognizer(tapGesture1)
        choiceLabel_1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(choiceLabelTapped_2))
        choiceLabel_2.addGestureRecognizer(tapGesture2)
        choiceLabel_2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(choiceLabelTapped_3))
        choiceLabel_3.addGestureRecognizer(tapGesture3)
        choiceLabel_3.isUserInteractionEnabled = true
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(choiceLabelTapped_4))
        choiceLabel_4.addGestureRecognizer(tapGesture4)
        choiceLabel_4.isUserInteractionEnabled = true
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(choiceLabelTapped_5))
        choiceLabel_5.addGestureRecognizer(tapGesture5)
        choiceLabel_5.isUserInteractionEnabled = true
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calcCVC = storyboard.instantiateViewController(withIdentifier:
            "CalcCVC") as! CalcCViewController
        navigationController?.pushViewController(calcCVC, animated: true)
    }
    
    @objc func choiceLabelTapped_1() {
        selectedChoice = 1
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func choiceLabelTapped_2() {
        selectedChoice = 2
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @objc func choiceLabelTapped_3() {
        selectedChoice = 3
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @objc func choiceLabelTapped_4() {
        selectedChoice = 4
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @objc func choiceLabelTapped_5() {
        selectedChoice = 5
        choiceLabel_1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_3.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_4.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        choiceLabel_5.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }
}
