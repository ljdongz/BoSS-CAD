//  Created by JunHee on 2022/11/04.

import UIKit

class CalcCViewController: UIViewController {

    @IBOutlet weak var completeButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    func makeUI() {
        completeButtom.clipsToBounds = true
        completeButtom.layer.cornerRadius = 10
    }
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
