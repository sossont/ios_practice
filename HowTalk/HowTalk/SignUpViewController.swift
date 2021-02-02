//
//  SignUpViewController.swift
//  HowTalk
//
//  Created by 정환우 on 2021/01/27.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import PhotosUI

class SignUpViewController: UIViewController, UINavigationControllerDelegate, PHPickerViewControllerDelegate{
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var color : String?
    let remoteconfig = RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statusBar = UIView()
        self.view.addSubview(statusBar)
        statusBar.snp.makeConstraints { (m) in
            m.right.top.left.equalTo(self.view)
            m.height.equalTo(40)
        }

        color = remoteconfig["splash_background"].stringValue
        statusBar.backgroundColor =  UIColor(hex:color!)
        signUpButton.backgroundColor = UIColor(hex: color!)
        cancelButton.backgroundColor = UIColor(hex: color!)
        // Do any additional setup after loading the view.
        
        signUpButton.addTarget(self, action: #selector(signupEvent), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelEvent), for: .touchUpInside)
        
        
        let tapGesutre = UITapGestureRecognizer(target: self, action: #selector(imagePicker))
        imageView.addGestureRecognizer(tapGesutre)
        imageView.isUserInteractionEnabled = true

    }
    
    @objc func imagePicker(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images,.livePhotos])
        
        let imagepicker = PHPickerViewController(configuration: configuration)
        imagepicker.delegate = self
        self.present(imagepicker, animated: true, completion: nil)

    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) // 1
        let itemProvider = results.first?.itemProvider // 2
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in DispatchQueue.main.async { self.imageView.image = image as? UIImage  } }
    }
    }
    
    @objc func signupEvent(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authresult, err) in
            
            guard let authresult = authresult, err == nil else{
                let alert = UIAlertController(title: "에러", message: err.debugDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let uid = authresult.user.uid
            let image = self.imageView.image?.jpegData(compressionQuality: 0.1)
            
            
            Storage.storage().reference().child("userImages").child(uid).putData(image!, metadata: nil) { (data, err) in
                
                Storage.storage().reference().child("userImages").child(uid).downloadURL { (url, err) in
                    
                    let values = ["userName":self.name.text,"profileImageUrl":url?.absoluteString]
                    Database.database().reference().child("users").child(uid).setValue(values) { (err, ref) in
                        
                        if(err==nil){   // 에러가 없을 경우
                            self.cancelEvent()  // 창을 닫아준다.
                        }
                    }
                }
            }
        }
    }
    
    @objc func cancelEvent(){
        
        self.dismiss(animated: true, completion: nil)
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
