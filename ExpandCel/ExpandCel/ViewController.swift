//
//  ViewController.swift
//  Expandcel
//
//  Created by 정환우 on 2021/01/04.
//

import UIKit

class ExpandCell:UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
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
        var title: String
        var isExpand: Bool
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCel_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        cell.titleLabel.text = dataModels[indexPath.row].title
        
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
        
        let titleArray = ["Title one",
        "Title two",
        "Title three",
        "Title four",
        "Title five"
        ]
        
        for index in 0..<titleArray.count{
            dataModels.append(ExpandDataModel.init(description: textArray[index], title: titleArray[index], isExpand: false))
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 클릭하면 확장하거나 축소해야한다 -> isExpand 값이 바뀌어야한다.
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

/* 셀 클릭했을 때 탁탁 튀는거 해결방안
 
 1. tableView.reloaddata() 어느정도 해결.
 
 2. heightForRowAt 에서 정확한 높이를 지정. 확실히 해결.
 
 3. tableView.estiamtedSectionHeaderHeight = 0
 tableView.estiamtedSectionFooterHeight = 0
 => 어느정도 해결.
 
 4. 애니메이션 효과 없애는 방법 -> 확실히 해결.
 UIView.setAnimationsEnabled(false)
 tableView.reloadRows(at: [indexPath], with: .none)
 UIVIew.setAnimationsEnabled(true)
 리로드하고 트루로 안바꿔주면 모든 애니메이션 효과가 안나오기 떄문에 큰일남
 
 */
