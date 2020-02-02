//
//  tableCell4.swift
//  SwiftTableLoadCell
//
//  Created by Helios on 2019/9/9.
//  Copyright © 2019 Helios. All rights reserved.
//

import UIKit

let tableCell4Id:String = "tableCell4Id"

class tableCell4: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func getCell4(tableView:UITableView) -> tableCell4 {
        
        var cell4 = tableView.dequeueReusableCell(withIdentifier: tableCell4Id)
        if cell4 == nil {
            let nib = UINib(nibName: "tableCell4", bundle: nil)
            cell4 = nib.instantiate(withOwner: self, options: nil)[0] as? tableCell4
        }
        return cell4! as! tableCell4
    }
    
}
