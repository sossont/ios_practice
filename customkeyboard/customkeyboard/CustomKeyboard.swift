//
//  CustomKeyboard.swift
//  customkeyboard
//
//  Created by 정환우 on 2021/01/03.
//

import UIKit

// delegate - 기능이나 값을 위임해줌.

protocol CustomKeyBoardDelegate {
    func KeyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyBoardDelegate?   // 계속 남아있어 메모리 누수가 일어날 수 있으므로 optional로 선언.
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.KeyboardTapped(str: sender.titleLabel!.text!)
        
    }
    
}
