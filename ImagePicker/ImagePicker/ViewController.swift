//
//  ViewController.swift
//  ImagePicker
//
//  Created by 정환우 on 2021/08/02.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    // MARK:-ImagePicker
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    

    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Alert
    // 사진 가져올 때 허락 맡아야 하니까 버튼 생성.
    @IBAction func touchUpSelectImageButton( _sender: UIButton){
        let alert = UIAlertController(title: "사진 접근 허용", message: "사진을 가져올까요?.", preferredStyle: .alert)
        let okaction = UIAlertAction(title: "OK", style: .default) { (action) in self.openPhotoLibrary() }
        let noaction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(noaction)   // addAction 한 순서대로 왼쪽에서 부터 뜬다.
        alert.addAction(okaction)
        present(alert, animated: true, completion: nil)
    }
    
    func openPhotoLibrary(){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


}

