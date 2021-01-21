//
//  ViewController.swift
//  Popup_Practice
//
//  Created by 정환우 on 2021/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showPopup(_ sender: Any) {
        // PopupViewController가 나와야 하는 부분.
        
        
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)    // PopupViewController 라는 이름을 가진 스토리보드를 가져옴
        
        let popupVC = storyBoard.instantiateViewController(identifier: "popupVC")  // 뷰컨트롤러를 불러오는 함수. identifier는 뷰컨트롤러의 storyboard ID.
        
        popupVC.modalPresentationStyle = .overCurrentContext    //  투명도가 있으면 투명도에 맞춰서 나오게 해주는 코드(뒤에있는 배경이 보일 수 있게)
        self.present(popupVC, animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

