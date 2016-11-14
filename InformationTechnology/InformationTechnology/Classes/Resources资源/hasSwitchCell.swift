//
//  hasSwitchCell.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class hasSwitchCell: UITableViewCell {

    @IBOutlet weak var leftImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //创建cell的方法
    class func createSwitchCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath) -> hasSwitchCell {
        
        let cellId = "hasSwitchCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? hasSwitchCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("hasSwitchCell", owner: nil, options: nil).last as? hasSwitchCell
        }
        return cell!
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
