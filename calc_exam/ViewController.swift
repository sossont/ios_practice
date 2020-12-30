//
//  ViewController.swift
//  calc_exam
//
//  Created by 정환우 on 2020/12/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    
    
    override func viewDidLoad() {   // 화면이 처음 실행될 때 실행되는 코드들.
        
        displayLabel.layer.cornerRadius = 20    // 라벨의 모서리 둥글게 만드는 코드.
        displayLabel.layer.masksToBounds = true // Label은 masktobounds 코드가 기본적으로 False이기 떄문에 이 코드 없이 사용하면 둥글게 표시가 안됨.
        displayLabel.clipsToBounds = true   // maskstobounds랑 거의 비슷. 편한거 사용하자.
        
        btn1.layer.cornerRadius = 20    // 버튼은 노상관.
        btn1.layer.cornerRadius = btn1.bounds.width / 2 // 원래 가로길이의 반 값을 사용하면 원으로 표현하게되는 것.
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btn1.layer.cornerRadius = btn1.bounds.width / 2
    }
    
    
    /*
 viewdidload는 객체들이 display되기 전에 먼저 실행이 되는거고,viewdidapper는 객체들이 display되고 나서 실행이 되는 것.
 이게 무슨 차이가 있냐하면, 객체들이 나타나기 전에 width, height 값을 설정하는 것은 부정확함. 원하는 모양이 안나올 수 있다.
 따라서, btn1.layer.cornerRadius 함수는 viewdidapper 함수 안에서 실행하는 게 맞다.
 */
}

