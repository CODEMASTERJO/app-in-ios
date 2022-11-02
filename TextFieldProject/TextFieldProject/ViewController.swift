//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 조용현 on 2022/10/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setUp()
        
    }
    
    func setUp() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()
    }
    
    // 다른 곳 터치 시 키보드가 내려가는것
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }

    // 텍스트필드의 입력을 시작할때 호출 -> 시작할지 말지의 여부 허락하는것
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 유저가 입력을 시작하는 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 유저가 텍스트필드 삭제를 허락할 것인가
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질때 호출이 되고 {허락}
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string)
        
        // 숫자 입력 제어 및 10글자 제한
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
        // 10글자이상 입력되는것을 막는 코드
//        if (textField.text?.count)! + string.count > 0 {
//            return false
//        } else {
//            return true
//        }
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝날 때 호출 {끝날지 말지 허락}
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을때 호출 {시점}
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력이 끝났다.")
    }
    
    
    
    
    
    
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
}

