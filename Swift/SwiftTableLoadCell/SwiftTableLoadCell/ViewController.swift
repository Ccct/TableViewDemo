//
//  ViewController.swift
//  SwiftTableLoadCell
//
//  Created by Helios on 2019/9/8.
//  Copyright © 2019 Helios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableV.delegate = self
        tableV.dataSource = self
        tableV.estimatedRowHeight = 0
        tableV.estimatedSectionFooterHeight = 0
        tableV.estimatedSectionHeaderHeight = 0
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cellid2")
        
//        tableV.register(tableCell2.self, forCellReuseIdentifier: tableCell2Id)
//        tableV.register(UINib.init(nibName: "tableCell3", bundle: nil), forCellReuseIdentifier: tableCell3Id)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /******* 纯代码cell *******/
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cellid")
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cellid")
//            cell?.textLabel?.text = "celltext"
//        }
//        return cell!
        
        //推荐
//        let cell2:tableCell2 = tableView.dequeueReusableCell(withIdentifier: tableCell2Id, for: indexPath) as! tableCell2
//        return cell2
        
        /********** xib cell ************/
        
        //推荐
//        let cell3:tableCell3 = tableView.dequeueReusableCell(withIdentifier: tableCell3Id, for: indexPath) as! tableCell3
//        return cell3
        
        
        var cell4 = tableView.dequeueReusableCell(withIdentifier: tableCell4Id)
        if cell4 == nil {
            let nib = UINib(nibName: "tableCell4", bundle: Bundle(for: type(of: self)))
            cell4 = nib.instantiate(withOwner: self, options: nil)[0] as? tableCell4
        }
        return cell4!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
