//
//  ChatViewController.swift
//  HowTalk
//
//  Created by 정환우 on 2021/02/02.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    var uid: String?
    var chatRoomid: String?
    
    var comments: [ChatModel.Comment] = []
    public var destinationUid: String?  // 나중에 내가 채팅할 대상의 uid.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let view = tableview.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        view.textLabel!.text = self.comments[indexPath.row].message
        
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uid = Auth.auth().currentUser?.uid
        checkChatRoom()
        sendButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func createRoom(){
        let createRoomInfo : Dictionary<String,Any> = [ "users" : [
            uid : true,
            destinationUid : true
            ]
        ]
                        
        if(chatRoomid == nil){
            // 방 생성 코드.
            Database.database().reference().child("chatrooms").childByAutoId().setValue(createRoomInfo) { (err, ref) in
                if err == nil{
                    self.checkChatRoom()
                    
                    self.sendButton.isEnabled = false
                }
            }
        }
        else
        {
            let value: Dictionary<String,Any> = [
                    "uid": uid,
                    "message" : textfield.text!
            ]
            Database.database().reference().child("chatrooms").child(chatRoomid!).child("comments").childByAutoId().setValue(value)
        }
    }
    
    func checkChatRoom(){
        
        Database.database().reference().child("chatrooms").queryOrdered(byChild: "users/" + uid!).queryEqual(toValue: true).observeSingleEvent(of: DataEventType.value) { (datasnapshot) in
            
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                
                if let chatRoomdic = item.value as? [String:Any]{
                    
                    let chatModel = ChatModel(JSON: chatRoomdic)
                    if(chatModel?.users[self.destinationUid!] == true){
                        self.chatRoomid = item.key
                    }
                }
                self.chatRoomid = item.key
                self.sendButton.isEnabled = true
                self.getMessageList()
            }
        }
    }
    
    func getMessageList(){
        
        Database.database().reference().child("chatrooms").child(self.chatRoomid!).child("comments").observe(DataEventType.value) { (datasnapshot) in
            
            self.comments.removeAll()
            
            for item in datasnapshot.children.allObjects as! [DataSnapshot]{
                let comment = ChatModel.Comment(JSON: item.value as! [String:Any])
                self.comments.append(comment!)
            }
            self.tableview.reloadData()
        }
    }
    
}

