//
//  FloatingViewController.swift
//  FloatingButton
//
//  Created by 정환우 on 2021/01/05.
//

import UIKit

class FloatingViewController: UIViewController {

    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            self.view.layoutIfNeeded()  // 이걸 꼭 해야 화면 갱신이 된다.
        } completion: { (Bool) in
            // 애니메이션 끝나는 시점.
        }

    }
    
    @IBAction func dismissFloating(_ sender: Any) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            
            self.view.layoutIfNeeded()  // 이걸 꼭 해야 화면 갱신이 된다.
        } completion: { (Bool) in
            // 애니메이션 끝나는 시점.
            
            self.dismiss(animated: false, completion: nil)
        }

    }

}
