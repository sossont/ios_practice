//
//  PopupViewController.swift
//  Popup_Practice
//
//  Created by 정환우 on 2021/01/21.
//

import UIKit

class PopupViewController: UIViewController {


    @IBAction func donebtn(_ sender: Any) {
        print("press done action")
    }
    @IBAction func closePopupBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)  // 사라지게 하기
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
