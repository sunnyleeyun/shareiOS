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


class AddCarThreeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Sunday: UIButton!
    @IBOutlet weak var Monday: UIButton!
    @IBOutlet weak var Tuesday: UIButton!
    @IBOutlet weak var Wednesday: UIButton!
    @IBOutlet weak var Thursday: UIButton!
    @IBOutlet weak var Friday: UIButton!
    @IBOutlet weak var Saturday: UIButton!
    
    
    @IBOutlet weak var StartTime: UITextField!
    @IBOutlet weak var EndTime: UITextField!
    
    var placeString = ""
    
    
    var uid = ""

    
    
    var couSun = 0
    var couMon = 0
    var couTue = 0
    var couWed = 0
    var couThu = 0
    var couFri = 0
    var couSat = 0

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }
        
        self.StartTime.delegate = self;
        self.EndTime.delegate = self;

    
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
    
    @IBAction func Tues(_ sender: Any) {
        
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
    
    @IBAction func Thurs(_ sender: Any) {
        
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
    
    
    
    @IBAction func place(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "AddCarMapViewControllerID")as! AddCarMapViewController
        self.present(nextVC,animated:true,completion:nil)

    }
    
    
    
    
    

    @IBAction func Save(_ sender: Any) {
        
        if StartTime.text != "" && EndTime.text != ""{
            if couSun % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Sunday").setValue("ON")
            }else if couSun == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Sunday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Sunday").setValue("OFF")
                
            }
            
            if couMon % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Monday").setValue("ON")
            }else if couMon == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Monday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Monday").setValue("OFF")
                
            }
            
            if couTue % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Tuesday").setValue("ON")
            }else if couTue == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Tuesday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Tuesday").setValue("OFF")
            }
            
            
            
            if couWed % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Wednesday").setValue("ON")
            }else if couWed == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Wednesday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Wednesday").setValue("OFF")
            }
            
            
            
            if couThu % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Thursday").setValue("ON")
            }else if couThu == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Thursday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Thursday").setValue("OFF")
                

            }
            
            
            
            if couFri % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Friday").setValue("ON")
            }else if couFri == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Friday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Friday").setValue("OFF")
                
            }

            
            if couSat % 2 == 1{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Saturday").setValue("ON")
            }else if couSat == 0{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Saturday").setValue("OFF")

            }else{
                FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time/Day").child("Saturday").setValue("OFF")
                
            }

            
            
            
            //placeString = "Taipei"
            
            //FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time").child("Place").setValue(placeString)

            
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time").child("Start").setValue(StartTime.text!)

            
            FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile/Time").child("End").setValue(EndTime.text!)
            
            
            
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let nextVC = storyboard.instantiateViewController(withIdentifier: "CarViewControllerID")as! CarViewController
//            self.present(nextVC,animated:true,completion:nil)
            
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
