//
//  addReFreshProtocol.swift
//  zzjDown
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

protocol AddReFreshProtocol:NSObjectProtocol {
    func addRefresh(header:(()->())?,footer:(()->())?)
}

extension AddReFreshProtocol where Self:UITableViewController {
    func addRefresh(header:(()->())?,footer:(()->())?) {
        
        if header != nil {
            tableView!.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        
        if footer != nil {
            tableView!.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: footer)
        }
    }
}
