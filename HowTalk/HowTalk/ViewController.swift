//
//  ViewController.swift
//  HowTalk
//
//  Created by 정환우 on 2021/01/26.
//

import UIKit
import SnapKit
import Firebase

class ViewController: UIViewController {

    
    var box = UIImageView()
    var remoteConfig : RemoteConfig!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        // 서버가 연결이 안 될 경우 사용하는 디폴트 값.
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        remoteConfig.fetch() { (status, error) -> Void in
          if status == .success {   // 서버와 연결 성공하면
            print("Config fetched!")
            self.remoteConfig.activate() { (changed, error) in
              // ...
            }
          } else {  // 서버와 연결 실패하면.
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
          self.displayWelcome()
        }
        
        
        
        
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        box.image = #imageLiteral(resourceName: "loading_icon")

    }
    
    func displayWelcome(){
        
        let color = remoteConfig["splash_background"].stringValue
        let caps = remoteConfig["splash_message_caps"].boolValue
        let message = remoteConfig["splash_message"].stringValue
        
        
        if(caps){
            
            let alert = UIAlertController(title: "공지사항", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: { (action) in
                exit(0)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        self.view.backgroundColor = UIColor(hex: color!)
    }
    
}

extension UIColor { // swift hex code.
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        
        scanner.scanLocation = 1    // 1로 바꿔줘야 #000000 여기서 #을 뺀 뒷 부분부터 읽을 수 있음.
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

