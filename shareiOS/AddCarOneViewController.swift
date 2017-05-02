//
//  AddCarOneViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AddCarOneViewController: UIViewController {

    @IBOutlet weak var CarOrScooter: UISegmentedControl!
    @IBOutlet weak var RentOrBuy: UISegmentedControl!
    

    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    @IBAction func NextStep(_ sender: Any) {
        
        switch CarOrScooter.selectedSegmentIndex {
        case 0:
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/CarOrScooter").setValue("機車")
        case 1:
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/CarOrScooter").setValue("汽車")
        default:
            break
        }
        
        switch RentOrBuy.selectedSegmentIndex {
        case 0:
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/RentOrBuy").setValue("租借")
        case 1:
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/RentOrBuy").setValue("買賣")
        default:
            break
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "AddCarTwoViewControllerID")as! AddCarTwoViewController
        self.present(nextVC,animated:true,completion:nil)
        
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
