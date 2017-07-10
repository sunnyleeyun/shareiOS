//
//  MainSettingViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/7/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class MainSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var tableData: [String] = ["Invite friends", "Switch to designer", "Settings","Help & support", "List your design", "Give us feedback"]
    
    var arrImageName: [String] = ["gift", "gift","gift","gift","gift","gift"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableview.tableFooterView = UIView()
        
        tableview.tableHeaderView = UIView()
        
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.clear.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MainSettingTableViewCell = self.tableview.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! MainSettingTableViewCell
        
        
        cell.imagreVW.image = UIImage(named:self.arrImageName[indexPath.row])
        
        cell.lblName.text = self.tableData[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        switch indexPath.row{
//        case 0: self.performSegue(withIdentifier: "invite", sender: self);
//        break;
//        case 1: self.performSegue(withIdentifier: "switch", sender: self);
//        break;
//        case 2: self.performSegue(withIdentifier: "settings", sender: self);
//        break;
//        case 3: self.performSegue(withIdentifier: "help", sender: self);
//        break;
//        case 4: self.performSegue(withIdentifier: "list", sender: self);
//        break;
//        case 5: self.performSegue(withIdentifier: "feedback", sender: self);
//        break;
//        default:
//            break
//        }
        
    }

    
}
