//
//  SecondViewController.swift
//  SignUpDisplay
//
//  Created by 정환우 on 2021/07/20.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("secondVC가 메모리에 로드됨")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("secondVC 뷰가 보여짐")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("secondVC 뷰가 보여질 예졍")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("secondVC 뷰가 없어질 예정")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("secondVC 뷰가 없어짐")
    }

    override func viewWillLayoutSubviews() {
        print("secondVC subview를 레이아웃 할 예정")
    }
    
    override func viewDidLayoutSubviews() {
        print("secondVC subview를 레이아웃 함")
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
