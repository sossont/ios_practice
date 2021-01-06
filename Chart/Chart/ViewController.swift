//
//  ViewController.swift
//  Chart
//
//  Created by 정환우 on 2021/01/06.
//

import UIKit

extension NSLayoutConstraint{
    func changeMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint
    {
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(item: firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}



class ViewController: UIViewController {


    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
    

        /*
         multiplier는 constant나 priority랑 다르게 get only property 라서 단순입력이 불가능함.
         그래서 extension을 이용한다!
         https://stackoverflow.com/questions/37294522/ios-change-the-multiplier-of-constraint-by-swift
         */
        
    
    @IBAction func ChangeValue(btn: UIButton) {
        if (btn.titleLabel!.text == "Case 1"){
            graph1Height = graph1Height.changeMultiplier(0.75)
            graph2Height = graph2Height.changeMultiplier(0.5)
            graph3Height = graph3Height.changeMultiplier(0.3)
            graph4Height = graph4Height.changeMultiplier(0.2)
            graph5Height = graph5Height.changeMultiplier(0.8)
        }
        else
        {
            graph1Height = graph1Height.changeMultiplier(0.95)
            graph2Height = graph2Height.changeMultiplier(0.7)
            graph3Height = graph3Height.changeMultiplier(0.2)
            graph4Height = graph4Height.changeMultiplier(0.8)
            graph5Height = graph5Height.changeMultiplier(0.45)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
}

