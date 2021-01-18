//
//  ViewController.swift
//  switch
//
//  Created by 정환우 on 2021/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btncenterX: NSLayoutConstraint!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn.layer.cornerRadius = 25
        view1.layer.cornerRadius = 25
    }


    @IBAction func tapbtn(_ sender: Any) {
        
        if btncenterX.constant == 75{
            btncenterX.constant = -75
            view1.backgroundColor = UIColor.blue
        }
        else
        {
            btncenterX.constant = 75
            view1.backgroundColor = UIColor.lightGray
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

