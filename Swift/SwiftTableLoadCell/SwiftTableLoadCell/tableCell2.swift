//
//  tableCell2.swift
//  SwiftTableLoadCell
//
//  Created by Helios on 2019/9/8.
//  Copyright © 2019 Helios. All rights reserved.
//

import UIKit

let tableCell2Id:String = "tableCell2Id"

class tableCell2: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setUi()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {

    }
}

extension tableCell2{
    
    fileprivate func setUi(){
        
        let Lab = UILabel(frame: CGRect.init(x: 15, y: 10, width: 40, height: 20))
        Lab.text = "xxxxxxxxxx"
        self.contentView.addSubview(Lab)
    }
}
