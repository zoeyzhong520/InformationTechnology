//
//  ScienceDetailCell.swift
//  InformationTechnology
//
//  Created by zzj on 16/11/5.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit

class ScienceDetailCell: UITableViewCell {


    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func clickBtn(sender: UIButton) {
        
    }
    
    @IBOutlet weak var editorLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    //显示数据
    var cellModel:CellDetailBody? {
        didSet {
            showData()
        }
    }
    
    //显示数据
    private func showData() {
        
        //遍历添加图片
        let cnt = cellModel?.img?.count
        if cellModel?.img?.count > 0 {
            
            for i in 0..<cnt! {
                
                //图片
                let model = cellModel?.img![i]
                if model!.url != nil {
                    let url = NSURL(string: (model?.url)!)
                    ImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    
                }
            }
            
            //标题文字
            if cellModel?.title != nil {
                titleLabel.text = cellModel?.title
            }
            
            //时间label
            if cellModel?.editTime != nil && cellModel?.source != nil {
                timeLabel.text = "\(cellModel!.editTime!)  \(cellModel!.source!)"
            }
            
            //详情文字
            if cellModel?.text != nil {
                descLabel.text = cellModel?.text 
            }
            
            //作者
            if cellModel?.author != nil && cellModel?.editorcode != nil {
                editorLabel.text = "作者:\(cellModel!.author!)  责任编辑:\(cellModel!.editorcode!)"
            }
        }
    }
    
    //创建cell的方法
    class func createDetailCellFor(tableView:UITableView, atIndexPath indexPath:NSIndexPath, cellModel:CellDetailBody?) -> ScienceDetailCell {
        
        let cellId = "scienceDetailCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ScienceDetailCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ScienceDetailCell", owner: nil, options: nil).last as? ScienceDetailCell
        }
        cell?.cellModel = cellModel
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
