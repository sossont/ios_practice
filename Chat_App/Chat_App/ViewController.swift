//
//  ViewController.swift
//  Chat_App
//
//  Created by 정환우 on 2021/01/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var chatTableView: UITableView!{
        didSet{ // 오브젝트 생성했을 때
            
            // 이것을 하지 않으면 작동 x. 코드로 하거나 스토리보드에서 하면 된다.
            chatTableView.delegate = self
            chatTableView.dataSource = self
            
            chatTableView.separatorStyle = .none    // 테이블 뷰 구분선 없애는 것
        }
    }
    
    // 여기서는 네트워크를 통해 데이터를 구성하는 게 아니고, 그냥 하나의 Array에 모든 데이터를 저장하는 걸로 하자.
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView!{
        didSet{
            inputTextView.delegate = self
        }
    }
    
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 사용하려는 셀을 등록해야 사용할 수 있다.
        chatTableView.register(UINib(nibName: "MyCell", bundle:nil), forCellReuseIdentifier:"myCell")
        // nibName : xib 파일 이름.     forCellReuseIdentifier: Cell의 identifier. xib파일안에서 설정가능
        chatTableView.register(UINib(nibName: "YourCell", bundle:nil), forCellReuseIdentifier: "yourCell")
        
        // 키보드 관련 옵저버 설정을 해야 함.
        // 키보드 올라올 때.
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardup), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // 키보드 내려올 때.
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDown), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyBoardup(noti: Notification){
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        // 홈 버튼 없는 아이폰들은 다 빼줘야함.
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        
        let animationDuration = notiInfo[ UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        // 키보드 올라오는 애니메이션이랑 동일하게 텍스트뷰 올라가게 만들기.
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyBoardDown(noti: Notification){
        
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[ UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func sendButton(_ sender: Any) {
        // 텍스트뷰에 있는 값이 chatDatas array에 들어가야지.
        if inputTextView.text != ""{
            chatDatas.append(inputTextView.text)
            inputTextView.text = ""
        }
        
        let lastindexPath = IndexPath(row: chatDatas.count - 1, section: 0)
        
        // 방법 1 : chatTableView.reloadData() 리로드는 조금 부자연스럽다.
        // 방법 2 :
        chatTableView.insertRows(at: [lastindexPath], with: UITableView.RowAnimation.automatic)
        
        inputTextViewHeight.constant = 35
        
        // TableView에는 원하는 곳으로 이동하는 함수가 있다. 고로 전송할때마다 최신 대화로 이동.
        chatTableView.scrollToRow(at: lastindexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }
    
    // 테이블 뷰를 사용하게 되면 무조건 구현해야하는 함수 2개.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    
    // 원래는 상대방이 썼을 때 상대방의 셀, 내가 썼을 때 내 셀이 나와야 하는데 이거는 그냥 번갈아가면서 나오게 하는 거임.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0{
            
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell // MyCell 형식으로 사용하기 위해 형변환이 필요하다.
            myCell.myTextView.text = chatDatas[indexPath.row]   // 버튼 누르면 chatDatas 에 텍스트를 넣을 것이기 때문에 거기서 꺼내오면 되는거다.
            myCell.selectionStyle = .none
            return myCell
            
        }
        else{
            
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCell // 이것도 마찬가지.
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
            return yourCell
            
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 35{
            inputTextViewHeight.constant = 35
        }
        else if textView.contentSize.height >= 102{
            inputTextViewHeight.constant = 102
        }
        else{
            inputTextViewHeight.constant = textView.contentSize.height
        }
        
        
    }
}
