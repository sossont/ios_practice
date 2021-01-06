//
//  ViewController.swift
//  FloatingButton
//
//  Created by 정환우 on 2021/01/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup"{
            let floatingVC = segue.destination as! FloatingViewController
            floatingVC.modalPresentationStyle = .overCurrentContext // 해당 뷰컨트롤러를 투명하게 만들어줌. 이 설정이 없으면 뷰의 백그라운드를 없애도 다른 뷰가 보이지 않는다.
            floatingVC.modalPresentationStyle = .overFullScreen
        }
    }

}

