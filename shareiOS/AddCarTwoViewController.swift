//
//  AddCarViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class AddCarTwoViewController: UIViewController{

    //, UIPickerViewDelegate, UIPickerViewDataSource
    
    /*
    let oilPickerView = UIPickerView()
    let agePickerView = UIPickerView()
    let typePickerView = UIPickerView()

    let oil = ["92油","95油","98油","柴油"]
    let age = [" 5 年以下 "," 5-10 年 "," 10 年以上 "]
    let type = ["塑膠車","擋車"]
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        
    
    
    
    
    /*
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1{
            return 1
        } else if pickerView.tag == 2{
            return 1
        }else if pickerView.tag == 3{
            return 1
        }
        
        return 1
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return oil.count
        } else if pickerView.tag == 2{
            return age.count
        }else if pickerView.tag == 3{
            return type.count
        }
        return 1
    }
  
   
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        // 設置為陣列 meals 的第 row 項資料
        if pickerView.tag == 1{
            return oil[row]
        } else if pickerView.tag == 2{
            return age[row]
        }else if pickerView.tag == 3{
            return type[row]
        }
        return ""

    }
    
    
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int, inComponent component: Int) {
        
        // 依據元件的 tag 取得 UITextField
        
        if pickerView == oilPickerView{

            let OilTextField =
            self.view?.viewWithTag(1) as? UITextField
        
        // 將 UITextField 的值更新為陣列 meals 的第 row 項資料
            OilTextField?.text = oil[row]
        } else if pickerView == agePickerView{
            let AgeTextField = self.view?.viewWithTag(2) as? UITextField
            
            // 將 UITextField 的值更新為陣列 meals 的第 row 項資料
            AgeTextField?.text = age[row]

        } else if pickerView == typePickerView{
            let TypeTextField = self.view?.viewWithTag(3) as? UITextField
            
            // 將 UITextField 的值更新為陣列 meals 的第 row 項資料
            TypeTextField?.text = type[row]
        }
        
        
        
        
        
    }
    
    func hideKeyboard(tapG:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
     
     /*
     let fullScreenSize = UIScreen.main.bounds.size
     
     
     // car text field
     var CarNumberTextField = UITextField(frame: CGRect(
     x: 0, y: 0,
     width: fullScreenSize.width * 0.5, height: 40))
     
     CarNumberTextField.placeholder = "車牌號碼"
     CarNumberTextField.backgroundColor = UIColor.init(
     red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
     CarNumberTextField.textAlignment = .center
     CarNumberTextField.center = CGPoint(
     x: fullScreenSize.width * 0.5,
     y: fullScreenSize.height * 0.4)
     self.view.addSubview(CarNumberTextField)
     
     
     // oil text field
     var OilTextField = UITextField(frame: CGRect(
     x: 0, y: 0,
     width: fullScreenSize.width * 0.5, height: 40))
     OilTextField.placeholder = "加油種類"
     
     oilPickerView.delegate = self
     oilPickerView.dataSource = self
     
     OilTextField.inputView = oilPickerView
     
     
     OilTextField.tag = 1 //oil tag
     
     OilTextField.backgroundColor = UIColor.init(
     red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
     OilTextField.textAlignment = .center
     OilTextField.center = CGPoint(
     x: fullScreenSize.width * 0.5,
     y: fullScreenSize.height * 0.5)
     self.view.addSubview(OilTextField)
     
     
     // car age text field
     var AgeTextField = UITextField(frame: CGRect(
     x: 0, y: 0,
     width: fullScreenSize.width * 0.5, height: 40))
     AgeTextField.placeholder = "愛車年齡"
     
     agePickerView.delegate = self
     agePickerView.dataSource = self
     
     AgeTextField.inputView = agePickerView
     
     AgeTextField.tag = 2 // age tag
     
     AgeTextField.backgroundColor = UIColor.init(
     red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
     AgeTextField.textAlignment = .center
     AgeTextField.center = CGPoint(
     x: fullScreenSize.width * 0.5,
     y: fullScreenSize.height * 0.6)
     self.view.addSubview(AgeTextField)
     
     
     
     // car type text field
     var TypeTextField = UITextField(frame: CGRect(
     x: 0, y: 0,
     width: fullScreenSize.width * 0.5, height: 40))
     TypeTextField.placeholder = "愛車種類"
     
     typePickerView.delegate = self
     typePickerView.dataSource = self
     
     TypeTextField.inputView = typePickerView
     
     TypeTextField.tag = 3 // type tag
     
     TypeTextField.backgroundColor = UIColor.init(
     red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
     TypeTextField.textAlignment = .center
     TypeTextField.center = CGPoint(
     x: fullScreenSize.width * 0.5,
     y: fullScreenSize.height * 0.7)
     self.view.addSubview(TypeTextField)
     
     
     // others
     var OthersTextField = UITextField(frame: CGRect(
     x: 0, y: 0,
     width: fullScreenSize.width * 0.5, height: 40))
     OthersTextField.placeholder = "其他備註"
     OthersTextField.backgroundColor = UIColor.init(
     red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
     OthersTextField.textAlignment = .center
     OthersTextField.center = CGPoint(
     x: fullScreenSize.width * 0.5,
     y: fullScreenSize.height * 0.8)
     self.view.addSubview(OthersTextField)
     
     */

     
     
     
    */
    
    
    
    
    
    
    
    
    
}
