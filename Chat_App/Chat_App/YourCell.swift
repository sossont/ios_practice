//
//  YourCell.swift
//  Chat_App/Users/hwanu/Desktop/swift/Chat_App/Chat_App/YourCell.xib
//
//  Created by 정환우 on 2021/01/22.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
