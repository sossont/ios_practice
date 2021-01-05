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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCel_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true
        {
            cell.descriptionLabel.numberOfLines = 0
        }
        else
        {
            cell.descriptionLabel.numberOfLines = 1
        }
        cell.selectionStyle = .none
        
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   // Row 개수 반환하는 함수.
        
        return dataModels.count
        
    }
    var dataModels = [ExpandDataModel]()    // 구조체 배열 선언.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["short Text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "short Text",
                "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "short Text",
                "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long ",
            "short Text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long "
        ]   // 실제 서버에서 오는 데이터일것이다. 실무에서는
        
        for (_,value) in textArray.enumerated(){
            
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 클릭하면 확장하거나 축소해야한다 -> isExpand 값이 바뀌어야한다.
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
