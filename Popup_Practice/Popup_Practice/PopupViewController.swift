//
//  PopupViewController.swift
//  Popup_Practice
//
//  Created by 정환우 on 2021/01/21.
//

import UIKit

class PopupViewController: UIViewController {


    @IBAction func closePopupBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)  // 사라지게 하기
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
