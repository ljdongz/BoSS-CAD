//
//  ViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainNavVC")
        
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
        
    }
    
}

