//
//  CalcAViewController.swift
//  BoSS_CAD
//
//  Created by JunHee on 2022/11/04.

import UIKit

class CalcAViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    var selectedGender : String = "남성" // 선택된 성별 저장 변수
    var age : Int = 0 // 나이
    var height : Int = 0 // 키
    var weight : Int = 0 // 몸무게

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 대리자 설정
        ageTextField.delegate = self
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
        
        //  이미지 탭제스쳐 설정
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(genderButtonTapped1))
        imageView1.addGestureRecognizer(tapGesture1)
        imageView1.isUserInteractionEnabled = true
        
        // 이미지 탭제스쳐 설정
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(genderButtonTapped2))
        imageView2.addGestureRecognizer(tapGesture2)
        imageView2.isUserInteractionEnabled = true
    }
    
    // 버튼 및 이미지 설정 함수
    func makeUI() {
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10
        
        imageView1.image = UIImage(named: "male")
        imageView2.image = UIImage(named: "female")
        
        view1.clipsToBounds = true
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 2.5
        view1.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
               
        view2.clipsToBounds = true
        view2.layer.cornerRadius = 10
        view2.layer.borderWidth = 1.5
        view2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        ageTextField.clipsToBounds = true
        ageTextField.layer.cornerRadius = 10
        ageTextField.layer.borderWidth = 1.5
        ageTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        heightTextField.clipsToBounds = true
        heightTextField.layer.cornerRadius = 10
        heightTextField.layer.borderWidth = 1.5
        heightTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        weightTextField.clipsToBounds = true
        weightTextField.layer.cornerRadius = 10
        weightTextField.layer.borderWidth = 1.5
        weightTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    // 다음 버튼 눌렸을 때
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if let ageText = ageTextField.text {
            if let age = Int(ageText) {self.age = age}
        } else {return}
        
        if let heightText = heightTextField.text {
            if let height = Int(heightText) {self.height = height}
        } else {return}
        if let weightText = weightTextField.text {
            if let weigiht = Int(weightText) {self.weight = weigiht}
        } else {return}
        
        // 나이, 키, 몸무게 값을 모두 입력받았다면 화면이동
        if (0 < age) && (0 < height) && (0 < weight) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let calcBVC = storyboard.instantiateViewController(withIdentifier:
                "CalcBVC") as! CalcBViewController
            navigationController?.pushViewController(calcBVC, animated: true)
            
        } else {return}
    }
    
    // 남성 이미지 선택된 경우
    @objc func genderButtonTapped1() {
        view1.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        selectedGender = "남성"
    }
    
    // 여성 이미지 선택된 경우
    @objc func genderButtonTapped2() {
        view2.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        view1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        selectedGender = "여성"
    }
    
    // 화면 터치시 키보드 내림
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ageTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    // 3 글자까지 입력받도록 함
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 3
    }
}

// numberpad done 버튼 추가
extension UITextField {
    @IBInspectable var wanryoAccesory: Bool{
        get {
            return self.wanryoAccesory
        }
        set(hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default
            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(self.doneButtonAction))
            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
            self.inputAccessoryView = doneToolbar
        }
        @objc func doneButtonAction() {
            self.resignFirstResponder()
        }
}
