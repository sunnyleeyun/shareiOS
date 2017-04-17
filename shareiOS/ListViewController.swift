//
//  ListViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    var carNum = ["981-JOS","jd1-P13"]
    var totTime = ["1 day","3.5 hours"]
    var totAmo = ["200 NT","50 NT"]
    
    var ListArray: [String?] = []
    
    
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        listTableView.delegate = self
        listTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carNum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomListCell
        
        //let cell: CustomListCell = self.listTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomListCell
        
        //cell.myView.backgroundColor = self.colors[indexPath.row]
        //cell.myCellLabel.text = self.animals[indexPath.row]
        
        cell.OutputCarNumber.text = self.carNum[indexPath.row]

        
        cell.OutputTotalTime.text = self.totTime[indexPath.row]
        cell.OutputTotalAmount.text = self.totAmo[indexPath.row]
        //cell.FinishOrNot.text = self.animals[indexPath.row]
        
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
