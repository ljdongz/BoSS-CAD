//
//  ViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit
import KakaoSDKUser

import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    
    @IBAction func kakaoLoginButtonTouchUpInside(_ sender: UIButton) {
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
        else {// 카카오톡 없는경우
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("me() success.")
                            
                            //do something
                            _ = user // 사용자 정보 출력 (동의한 것만)
                            
                            let userId = String(describing: user!.id!)
                            print("사용자 정보  = \(userId)")
                            RealTimeDBManager.shared.userChecking(userId: userId)
                            
                            
                            // 파이어베이스에 사용자 데이터 불러온 후 탈출 클로저로 화면 전환하기
                            let storyboard = UIStoryboard(name: "Main", bundle: .main)
                            let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
                            
                            mainViewController.modalPresentationStyle = .fullScreen
                            mainViewController.userId = userId
                            
                            self.navigationController?.pushViewController(mainViewController, animated: false)
                        }
                    }
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
        
        
        mainViewController.modalPresentationStyle = .fullScreen
        mainViewController.userId = "1"
        
        //present(mainViewController, animated: true)
        navigationController?.pushViewController(mainViewController, animated: false)
        
    }
    
}

