//
//  SettingViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let items1 = ["帳號","常用地址","緊急聯絡人"]
    let items2 = ["用戶指南","給享卡好評","法律條款","關於享卡"]
    let items3 = ["登出"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fullScreenSize = UIScreen.main.bounds.size
        
        
        let myTableView = UITableView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20),
                                      style: .grouped)
        
        // 註冊 cell
        myTableView.register(
            UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // 設置委任對象
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // 分隔線的樣式
        myTableView.separatorStyle = .singleLine
        
        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
        myTableView.separatorInset =
            UIEdgeInsetsMake(0, 20, 0, 20)
        
        // 是否可以點選 cell
        myTableView.allowsSelection = true
        
        // 是否可以多選 cell
        myTableView.allowsMultipleSelection = false
        
        // 加入到畫面中
        self.view.addSubview(myTableView)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return [3,4,1][section]
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "Cell", for: indexPath) as
        UITableViewCell
        
        
        if indexPath.section == 0{
            cell.textLabel?.text = items1[indexPath.row]
        } else if indexPath.section == 1{
            cell.textLabel?.text = items2[indexPath.row]
        } else if indexPath.section == 2{
            cell.textLabel?.text = items3[indexPath.row]
        }
        
        //        let cell = PurseTableview.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        //        if indexPath.section == 0{
        //            cell.textLabel?.text = items1[indexPath.row]
        //        } else if indexPath.section == 1{
        //            cell.textLabel?.text = items2[indexPath.row]
        //        } else {
        //            cell.textLabel?.text = items3[indexPath.row]
        //
        //        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
