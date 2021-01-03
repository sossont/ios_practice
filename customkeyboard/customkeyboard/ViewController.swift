//
//  ViewController.swift
//  customkeyboard
//
//  Created by 정환우 on 2021/01/03.
//

import UIKit


// 클래스에 protocol을 사용해준다고 선언을 해야함.
class ViewController: UIViewController, CustomKeyBoardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 커스텀 키보드 설정 방법.
        //firstTextField.inputView = "커스텀키보드뷰"
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)   // xib 파일 정보를 불러온 것.
        
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self  //이 선언문이 중요함.
        firstTextField.inputView = myKeyboardView
    }
    
    func KeyboardTapped(str: String) {
        // 키보드 눌렀을 때 호출 됨.
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil{
            newNumber = oldNumber! * 100
        }
        else if str == "000" && oldNumber != nil{
            newNumber = oldNumber! * 1000
        }
        else if oldNumber != nil{
            newNumber = newNumber! + oldNumber! * 10
        }
        
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal  // 숫자를 세자리마다 쉼표로 찍어줌.
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)){    // if let은 optional을 벗겨준다.
            firstTextField.text = String(describing: formatted)
            }
        }
    }
}
