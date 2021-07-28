//
//  ViewController.swift
//  SignUpDisplay
//
//  Created by 정환우 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("뷰가 메모리에 로드됨")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("뷰가 보여짐")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("뷰가 보여질 예졍")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("뷰가 없어질 예정")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("뷰가 없어짐")
    }

    override func viewWillLayoutSubviews() {
        print("subview를 레이아웃 할 예정")
    }
    
    override func viewDidLayoutSubviews() {
        print("subview를 레이아웃 함")
    }
}

