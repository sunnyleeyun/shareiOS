//
//  AddCarOneViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class AddCarOneViewController: UIViewController {

    @IBOutlet weak var CarOrScooter: UISegmentedControl!
    @IBOutlet weak var RentOrBuy: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func NextStep(_ sender: Any) {
        
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
