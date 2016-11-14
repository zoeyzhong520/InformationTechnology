//
//  topCell.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/13.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class topCell: UITableViewCell {

    @IBOutlet weak var avatarImgView: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    //点击事件
    @IBAction func clickBtn(sender: UIButton) {
        
        
    }
    
    @IBOutlet weak var historyImg: UIImageView!
    
    @IBOutlet weak var commentImg: UIImageView!
    
    @IBOutlet weak var messageImg: UIImageView!
    
    @IBOutlet weak var collectImg: UIImageView!
    
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var collectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    //创建cell的方法
    class func createTopCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath) -> topCell {
        
        let cellId = "topCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? topCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("topCell", owner: nil, options: nil).last as? topCell
        }
        return cell!
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
