//
//  RecommendTableView.swift
//  InformationTechnology
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 zzj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class RecommendTableView: UITableViewController {

    //定义界面数据的数组
    var recommendDataArray:[RecommendModel] = []
    
    //定义数据接口
    var urlString:String?
    
    //定义数据刷新页码
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downLoadData()
    }

    func downLoadData() {
        
        //下载界面数据
        if urlString != nil {
            Alamofire.request(.GET, String(format: urlString!, currentPage)).responseData(completionHandler: { [unowned self] (response) in
                let xml = XML.parse(response.result.value!)
                if response.result.error == nil {
                    let items = xml["Items"]["Platform"]["Article"]
                    for item in items {
                        let model = RecommendModel()
                        model.ProviderName = item["ProviderName"].text
                        model.Description = item["Description"].text
                        model.PubDate = item["PubDate"].text
                        model.ShareLink = item["ShareLink"].text
                        model.Title = item["Title"].text
                        model.Url = item["Url"].text
                        self.recommendDataArray.append(model)
                        print(model)
                    }
                    self.tableView.reloadData()
                }
            })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
