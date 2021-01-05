//
//  ViewController.swift
//  Expandcel
//
//  Created by 정환우 on 2021/01/04.
//

import UIKit

class ExpandCell:UITableViewCell{
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    // 저 두가지를 선언해야 테이블 부 관련한 메소드들을 사용가능하다.

    /*
     데이터 구조
     필요한 텍스트가 포함.
     expand 상태
     */
    
    //Model
    struct ExpandDataModel{
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()    // 구조체 배열 선언.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textArray = ["short text", "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text",
                         "short text", "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text",
                         "short text", "long text long text long text long text long text long text long text long text long text long text long text long text long text long text long text"
        ]
        for (_,value) in textArray.enumerated(){
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCel_ID", for: indexPath) as! ExpandCell
        // 타입 캐스팅 필요함
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true{//확장이 필요한 경우
            cell.descriptionLabel.numberOfLines = 0
            // 0 이면 글자 줄 수 만큼 표현해라 라는 뜻.
        }
        else
        {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        return cell
    }
}

