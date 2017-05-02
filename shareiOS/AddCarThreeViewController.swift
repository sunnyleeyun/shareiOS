//
//  AddCarThreeViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/27.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class AddCarThreeViewController: UIViewController {

    @IBOutlet weak var Sunday: UIButton!
    @IBOutlet weak var Monday: UIButton!
    @IBOutlet weak var Tuesday: UIButton!
    @IBOutlet weak var Wednesday: UIButton!
    @IBOutlet weak var Thursday: UIButton!
    @IBOutlet weak var Friday: UIButton!
    @IBOutlet weak var Saturday: UIButton!
    
    
    @IBOutlet weak var StartTime: UITextField!
    @IBOutlet weak var EndTime: UITextField!
    
    
    
    var uid = ""

    
    @IBOutlet weak var placeString: UILabel!
    

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
    
    @IBAction func Sun(_ sender: Any) {
        Sunday.backgroundColor = UIColor.blue
    }
    
    @IBAction func Mon(_ sender: Any) {
    }
    
    @IBAction func Tues(_ sender: Any) {
    }
    
    @IBAction func Wed(_ sender: Any) {
    }
    
    @IBAction func Thurs(_ sender: Any) {
    }
    
    @IBAction func Fri(_ sender: Any) {
    }
    
    @IBAction func Sat(_ sender: Any) {
    }
    
    @IBAction func place(_ sender: Any) {
    }
    
    
    
    
    

    @IBAction func Save(_ sender: Any) {
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
