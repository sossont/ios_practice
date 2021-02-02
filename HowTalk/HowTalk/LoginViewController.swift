//
//  LoginViewController.swift
//  HowTalk
//
//  Created by 정환우 on 2021/01/26.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    let remoteconfig = RemoteConfig.remoteConfig()
    var color : String!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! Auth.auth().signOut()  // Firebase 자체에서 로그인이 되어있기 때문에 로그아웃을 해줘야한다.
        
        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(40)
        }

        color = remoteconfig["splash_background"].stringValue
        statusBar.backgroundColor = UIColor(hex: color)
        LoginButton.backgroundColor = UIColor(hex: color)
        signInButton.backgroundColor = UIColor(hex: color)
        
        signInButton.addTarget(self, action: #selector(presentSignup), for: .touchUpInside)
        
        LoginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        // Do any additional setup after loading the view.
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if (user != nil){   // 로그인이 된다면?
                let view = self.storyboard?.instantiateViewController(identifier: "MainViewTabBarController") as! UITabBarController
                
                view.modalPresentationStyle = .fullScreen
                self.present(view, animated: true, completion: nil)
                
            }
        }
    }
    
    
    @objc func loginEvent(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, err) in
            if(err != nil){ // 에러가 날 때
                let alert = UIAlertController(title: "에러", message: err.debugDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                
            }
        }
    }
    
    @objc func presentSignup(){
        let view = self.storyboard?.instantiateViewController(identifier: "SigunUpViewContorller") as! SignUpViewController
        view.modalPresentationStyle = .fullScreen
        self.present(view, animated: true, completion: nil)
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
