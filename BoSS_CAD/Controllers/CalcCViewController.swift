//  Created by JunHee on 2022/11/04.

import UIKit

class CalcCViewController: UIViewController {

    @IBOutlet weak var completeButtom: UIButton!
    
    @IBOutlet weak var minusImage1: UIImageView!
    @IBOutlet weak var plusImage1: UIImageView!
    @IBOutlet weak var goalWeekLabel: UILabel!
    
    @IBOutlet weak var minusImage2: UIImageView!
    @IBOutlet weak var plusImage2: UIImageView!
    @IBOutlet weak var goalDecreaseLabel: UILabel!
    
    var goalWeek : Int = 4
    var goalDecrease : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        setGesture()
    }
    func makeUI() {
        completeButtom.clipsToBounds = true
        completeButtom.layer.cornerRadius = 10
        
        minusImage1.image = UIImage(named: "minus")
        plusImage1.image = UIImage(named: "plus")
        goalWeekLabel.text = String(goalWeek)
        
        
        minusImage2.image = UIImage(named: "minus")
        plusImage2.image = UIImage(named: "plus")
        goalDecreaseLabel.text = String(goalDecrease)
    
    }
    
    func setGesture() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(minusImage1Tapped))
        minusImage1.addGestureRecognizer(tapGesture1)
        minusImage1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(plusImage1Tapped))
        plusImage1.addGestureRecognizer(tapGesture2)
        plusImage1.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(minusImage2Tapped))
        minusImage2.addGestureRecognizer(tapGesture3)
        minusImage2.isUserInteractionEnabled = true
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(plusImage2Tapped))
        plusImage2.addGestureRecognizer(tapGesture4)
        plusImage2.isUserInteractionEnabled = true
    }
    
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @objc func minusImage1Tapped() {
        if goalWeek > 4 {
            goalWeek = goalWeek - 1
            goalWeekLabel.text = String(goalWeek)
        }
        else { return }
    }
    
    @objc func plusImage1Tapped() {
        if goalWeek < 48 {
            goalWeek = goalWeek + 1
            goalWeekLabel.text = String(goalWeek)
        } else { return }
    }
    
    @objc func minusImage2Tapped() {
        if goalDecrease > 1 {
            goalDecrease = goalDecrease - 1
            goalDecreaseLabel.text = String(goalDecrease)
        }
        else { return }
    }
    
    @objc func plusImage2Tapped() {
        if goalDecrease < 24 {
            goalDecrease = goalDecrease + 1
            goalDecreaseLabel.text = String(goalDecrease)
        } else { return }
    }
    
    
}
