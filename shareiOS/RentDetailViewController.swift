//
//  RentDetailViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/7/9.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class RentDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var CarOrScooter: UISegmentedControl!
    
    @IBOutlet weak var RentTime: UITextField!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RentTime.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Confirm(_ sender: Any) {
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
