//
//  ViewController.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/10/31.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 로그인 정보가 남아있으면 데이터 불러오고 화면 전환
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                    }
                    else {
                        //기타 에러
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    self.setUserInfo()
                }
            }
        }
        else {
            //로그인 필요
        }
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
                    self.setUserInfo()
                }
            }
        }
    }
    @IBAction func logoutTestButton(_ sender: UIButton) {//로그아웃 버튼
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
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
        
        
        mainViewController.modalPresentationStyle = .fullScreen
        mainViewController.userId = "1"
        
        //present(mainViewController, animated: true)
        navigationController?.pushViewController(mainViewController, animated: false)
        
    }
    
    
}
extension ViewController{
    private func setUserInfo(){ // 사용자 정보 출력 및 화면 전환 함수
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
        //        _ = oauthToken
    }
}
