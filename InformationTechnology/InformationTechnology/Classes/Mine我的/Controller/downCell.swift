//
//  downCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class downCell: UITableViewCell {

    @IBOutlet weak var leftImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rightImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    //创建cell的方法
    class func createSwitchCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath) -> downCell {
        
        let cellId = "downCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? downCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("downCell", owner: nil, options: nil).last as? downCell
        }
        return cell!
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
