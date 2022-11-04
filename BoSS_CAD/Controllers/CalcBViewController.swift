//  Created by JunHee on 2022/11/04.

import UIKit

class CalcBViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    func makeUI() {
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let calcCVC = storyboard.instantiateViewController(withIdentifier:
            "CalcCVC") as! CalcCViewController
        navigationController?.pushViewController(calcCVC, animated: true)
    }
}
