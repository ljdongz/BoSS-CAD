//
//  RealTimeDBManager.swift
//  BoSS_CAD
//
//  Created by 이정동 on 2022/11/17.
//

import UIKit
import Firebase
import FirebaseDatabase

class RealTimeDBManager {
    static let shared = RealTimeDBManager()
    
    var ref: DatabaseReference = Database.database().reference()
    
    private init () {}
    
    func userChecking(userId: String) {
        
        ref.child("users/\(userId)").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription ?? "error")
                return;
            }
            
            // 처음 아이디 생성
            if snapshot?.childrenCount == 0 {
                print("err")
                self.ref.child("users/\(userId)").setValue(["kcal":"0"])
            }
            
           
        }
        
    }
}
