//
//  ViewController.swift
//  chat_app_copy
//
//  Created by 정환우 on 2021/01/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var chatTableView: UITableView!{
        didSet{
            chatTableView.delegate = self
            chatTableView.dataSource  = self
            chatTableView.separatorStyle = .none
        }
    }
    
    var  chatDatas = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath) as! myCell
        mycell.myTextView.text = chatDatas[indexPath.row]
        mycell.selectionStyle = .none
        return mycell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chatTableView.register(UINib(nibName: "myCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "yourCell", bundle: nil), forCellReuseIdentifier: "Yourcell")
    }
}

