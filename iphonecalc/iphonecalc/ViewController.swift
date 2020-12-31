//
//  ViewController.swift
//  iphonecalc
//
//  Created by 정환우 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {

    var printnum : Double = 0
    var load = true    // 처음 상태
    var num1 : Double = 0, num2 : Double = 0, op = 0 // 인자 1, 인자 2
    
    var isplus = true
    let numberFormatter = NumberFormatter()

    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var pmButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var pButton: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var minButton: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) { // 버튼들 꾸미기.
        super.viewDidAppear(animated)
        btn0.layer.cornerRadius = btn0.bounds.height / 2
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn2.bounds.width / 2
        btn3.layer.cornerRadius = btn3.bounds.width / 2
        btn4.layer.cornerRadius = btn4.bounds.width / 2
        btn5.layer.cornerRadius = btn5.bounds.width / 2
        btn6.layer.cornerRadius = btn6.bounds.width / 2
        btn7.layer.cornerRadius = btn7.bounds.width / 2
        btn8.layer.cornerRadius = btn8.bounds.width / 2
        btn9.layer.cornerRadius = btn9.bounds.width / 2
        acButton.layer.cornerRadius = acButton.bounds.width / 2
        pmButton.layer.cornerRadius = pmButton.bounds.width / 2
        divButton.layer.cornerRadius = divButton.bounds.width / 2
        pButton.layer.cornerRadius = pButton.bounds.width / 2
        mulButton.layer.cornerRadius = mulButton.bounds.width / 2
        minButton.layer.cornerRadius = minButton.bounds.width / 2
        plusButton.layer.cornerRadius = plusButton.bounds.width / 2
        dotButton.layer.cornerRadius = dotButton.bounds.width / 2
        equalButton.layer.cornerRadius = equalButton.bounds.width / 2
    }
    
    func changeNumber(_ a: Int){
        load = false    // 무언가 입력이 있었기 때문에 출력이 바뀌겠지.
        printnum = printnum*10 + Double(a)
        
        displayLabel.text = String(printnum)
        
        if !load {   // 처음이 아니면 다 C로 떠야함.
            acButton.setTitle("C", for: .normal)
        }
        else{
            acButton.setTitle("AC", for: .normal)
        }
    }
    
    @IBAction func clickpm(_ sender: Any) {
        if isplus{
            isplus = false
        }
        else
        {
            isplus = true
        }
        printnum = 0 - printnum
        displayLabel.text = String(printnum)
    }
    
    @IBAction func clickac(_ sender: Any) {
        load = true // 초기 상태로 돌아감.
        num1 = 0
        num2 = 0
        op = 0
        acButton.setTitle("AC", for: .normal)
        printnum = 0
        displayLabel.text = String(printnum)
    }
    
    @IBAction func clickbtn9(_ sender: Any) {
        changeNumber(9)
    }
    @IBAction func clickbtn8(_ sender: Any) {
        changeNumber(8)
    }
    @IBAction func clickbtn7(_ sender: Any) {
        changeNumber(7)
    }
    @IBAction func clickbtn6(_ sender: Any) {
        changeNumber(6)
    }
    @IBAction func clickbtn5(_ sender: Any) {
        changeNumber(5)
    }
    @IBAction func clickbtn4(_ sender: Any) {
        changeNumber(4)
    }
    @IBAction func clickbtn3(_ sender: Any) {
        changeNumber(3)
    }
    @IBAction func clickbtn2(_ sender: Any) {
        changeNumber(2)
    }
    @IBAction func clickbtn1(_ sender: Any) {
        changeNumber(1)
    }
    @IBAction func clickbtn0(_ sender: Any) {
        changeNumber(0)
    }
    
    
    @IBAction func clickplus(_ sender: Any) {
        num1 = printnum // 화면에 있는 숫자가 첫번째 인자임. 연산자 누르기 전에 숫자.
        op = 1
        printnum = 0
    }
    @IBAction func clickminus(_ sender: Any) {
        num1 = printnum // 화면에 있는 숫자가 첫번째 인자임. 연산자 누르기 전에 숫자.
        op = 2
        printnum = 0
    }
    @IBAction func clickmul(_ sender: Any) {
        num1 = printnum // 화면에 있는 숫자가 첫번째 인자임. 연산자 누르기 전에 숫자.
        op = 3
        printnum = 0
    }
    @IBAction func clickdiv(_ sender: Any) {
        num1 = printnum // 화면에 있는 숫자가 첫번째 인자임. 연산자 누르기 전에 숫자.
        op = 4
        printnum = 0
    }
    @IBAction func clickp(_ sender: Any) {
        num1 = printnum // 화면에 있는 숫자가 첫번째 인자임. 연산자 누르기 전에 숫자.
        op = 5
        printnum = 0
    }
    @IBAction func clickequal(_ sender: Any) {
        num2 = printnum
        printnum = operation(num1,num2,op)
        displayLabel.text = String(printnum)
    }
    
    
    func operation(_ a: Double, _ b: Double, _ op:Int) -> Double { // 계산하는 함수. 1 : +, 2:-, 3:*, 4:/, 5:%
        switch op{
        case 1:
            return (a + b)
        case 2:
            return (a - b)
        case 3:
            return (a * b)
        case 4:
            return (a / b)
        case 5:
            return a.truncatingRemainder(dividingBy: b)
        default:
            return 0
        }
    }
    
    
}

