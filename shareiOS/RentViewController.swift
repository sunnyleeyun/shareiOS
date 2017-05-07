//
//  RentViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/5/4.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RentViewController: UIViewController, UITextFieldDelegate {

    
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
    
    
    
    var couSun = 0
    var couMon = 0
    var couTue = 0
    var couWed = 0
    var couThu = 0
    var couFri = 0
    var couSat = 0
    

    
    
    @IBOutlet weak var Check50: UIButton!
    @IBOutlet weak var Check100: UIButton!
    @IBOutlet weak var Check125: UIButton!
    @IBOutlet weak var Check150: UIButton!
    
    var box50 = 0
    var box100 = 0
    var box125 = 0
    var box150 = 0
    
    
    @IBOutlet weak var Below5: UIButton!
    @IBOutlet weak var Bet5To10: UIButton!
    @IBOutlet weak var MoreThan10: UIButton!
    
    var boxBelow5 = 0
    var boxBet5To10 = 0
    var boxMoreThan10 = 0
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }
        
        self.StartTime.delegate = self
        self.EndTime.delegate = self

        
        
    
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Sun(_ sender: Any) {
        if couSun < 99{
            
            
            if couSun % 2 == 0{
                
                Sunday.backgroundColor = UIColor.yellow
            } else {
                
                Sunday.backgroundColor = UIColor.white
                
            }
            
            couSun += 1
            
            
        }else{
            Sunday.isEnabled = false
        }

    }
    
    @IBAction func Mon(_ sender: Any) {
        if couMon < 99{
            
            
            if couMon % 2 == 0{
                
                Monday.backgroundColor = UIColor.yellow
                
            } else {
                
                Monday.backgroundColor = UIColor.white
                
            }
            
            couMon += 1
            
            
        }else{
            Monday.isEnabled = false
        }

    }
    
    @IBAction func Tue(_ sender: Any) {
        if couTue < 99{
            
            
            if couTue % 2 == 0{
                
                Tuesday.backgroundColor = UIColor.yellow
            } else {
                
                Tuesday.backgroundColor = UIColor.white
                
            }
            
            couTue += 1
            
            
        }else{
            Tuesday.isEnabled = false
        }

    }
    
    @IBAction func Wed(_ sender: Any) {
        
        
        if couWed < 99{
            
            
            if couWed % 2 == 0{
                
                Wednesday.backgroundColor = UIColor.yellow
            } else {
                
                Wednesday.backgroundColor = UIColor.white
                
            }
            
            couWed += 1
            
            
        }else{
            Wednesday.isEnabled = false
        }

        
    }
    @IBAction func Thu(_ sender: Any) {
        if couThu < 99{
            
            
            if couThu % 2 == 0{
                
                Thursday.backgroundColor = UIColor.yellow
            } else {
                
                Thursday.backgroundColor = UIColor.white
                
            }
            
            couThu += 1
            
            
        }else{
            Thursday.isEnabled = false
        }

    }
    
    @IBAction func Fri(_ sender: Any) {
        
        if couFri < 99{
            
            
            if couFri % 2 == 0{
                
                Friday.backgroundColor = UIColor.yellow
            } else {
                
                Friday.backgroundColor = UIColor.white
                
            }
            
            couFri += 1
            
            
        }else{
            Friday.isEnabled = false
        }
    }
    @IBAction func Sat(_ sender: Any) {
        
        if couSat < 99{
            
            
            if couSat % 2 == 0{
                
                Saturday.backgroundColor = UIColor.yellow
            } else {
                
                Saturday.backgroundColor = UIColor.white
                
            }
            
            couSat += 1
            
            
        }else{
            Saturday.isEnabled = false
        }
        

    }
    
    
    @IBAction func box50(_ sender: Any) {
        if box50 < 99{
            
            
            if box50 % 2 == 0{
                
                Check50.setImage(UIImage(named: "check"), for: .normal)
            
            
            } else {
                
                Check50.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            box50 += 1
            
            
        }else{
            Check50.isEnabled = false
        }
        

    }
    @IBAction func box100(_ sender: Any) {
        if box100 < 99{
            
            
            if box100 % 2 == 0{
                
                Check100.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                Check100.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            box100 += 1
            
            
        }else{
            Check100.isEnabled = false
        }

    }
    @IBAction func box125(_ sender: Any) {
        if box125 < 99{
            
            
            if box125 % 2 == 0{
                
                Check125.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                Check125.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            box125 += 1
            
            
        }else{
            Check125.isEnabled = false
        }

    }
    @IBAction func box150(_ sender: Any) {
        if box150 < 99{
            
            
            if box150 % 2 == 0{
                
                Check150.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                Check150.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            box150 += 1
            
            
        }else{
            Check150.isEnabled = false
        }

    }

    
    
    
    @IBAction func Under5(_ sender: Any) {
        if boxBelow5 < 99{
            
            
            if boxBelow5 % 2 == 0{
                
                Below5.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                Below5.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            boxBelow5 += 1
            
            
        }else{
            Below5.isEnabled = false
        }

    }
    
    @IBAction func Bet5n10(_ sender: Any) {
        if boxBet5To10 < 99{
            
            
            if boxBet5To10 % 2 == 0{
                
                Bet5To10.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                Bet5To10.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            boxBet5To10 += 1
            
            
        }else{
            Bet5To10.isEnabled = false
        }

    }
    
    @IBAction func Above10(_ sender: Any) {
        if boxMoreThan10 < 99{
            
            
            if boxMoreThan10 % 2 == 0{
                
                MoreThan10.setImage(UIImage(named: "check"), for: .normal)
                
                
            } else {
                
                MoreThan10.setImage(UIImage(named: "checkno"), for: .normal)
                
            }
            
            boxMoreThan10 += 1
            
            
        }else{
            MoreThan10.isEnabled = false
        }

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
