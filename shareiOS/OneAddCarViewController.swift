//
//  OneAddCarViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/5/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class OneAddCarViewController: UIViewController, UITextFieldDelegate  {

    // 可以自動產生一組獨一無二的 ID 號碼，方便等一下上傳圖片的命名
    let uniqueString = NSUUID().uuidString
    
    var uid = ""
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // 結束編輯 把鍵盤隱藏起來
        self.view.endEditing(true)
        
        return true
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carNumber.delegate = self
        others.delegate = self
        
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddImage(_ sender: Any) {
        
        
        // 建立一個 UIImagePickerController 的實體
        let imagePickerController = UIImagePickerController()
        
        // 委任代理
        imagePickerController.delegate = self
        
        // 建立一個 UIAlertController 的實體
        // 設定 UIAlertController 的標題與樣式為 動作清單 (actionSheet)
        let imagePickerAlertController = UIAlertController(title: "上傳圖片", message: "請選擇要上傳的圖片", preferredStyle: .actionSheet)
        
        // 建立三個 UIAlertAction 的實體
        // 新增 UIAlertAction 在 UIAlertController actionSheet 的 動作 (action) 與標題
        let imageFromLibAction = UIAlertAction(title: "照片圖庫", style: .default) { (Void) in
            
            // 判斷是否可以從照片圖庫取得照片來源
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                
                // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.photoLibrary)，並 present UIImagePickerController
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        let imageFromCameraAction = UIAlertAction(title: "相機", style: .default) { (Void) in
            
            // 判斷是否可以從相機取得照片來源
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                // 如果可以，指定 UIImagePickerController 的照片來源為 照片圖庫 (.camera)，並 present UIImagePickerController
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
        // 新增一個取消動作，讓使用者可以跳出 UIAlertController
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (Void) in
            
            imagePickerAlertController.dismiss(animated: true, completion: nil)
        }
        
        // 將上面三個 UIAlertAction 動作加入 UIAlertController
        imagePickerAlertController.addAction(imageFromLibAction)
        imagePickerAlertController.addAction(imageFromCameraAction)
        imagePickerAlertController.addAction(cancelAction)
        
        // 當使用者按下 uploadBtnAction 時會 present 剛剛建立好的三個 UIAlertAction 動作與
        present(imagePickerAlertController, animated: true, completion: nil)
        

    }

    @IBOutlet weak var carNumber: UITextField!
    
    @IBOutlet weak var carYear: UISegmentedControl!
    
    @IBOutlet weak var carOil: UISegmentedControl!
    
    @IBOutlet weak var others: UITextField!
    
    @IBAction func Confirm(_ sender: Any) {
        
        
        if carNumber.text != ""{
            
            if let carNum = carNumber.text{
                
                
                
                
                FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarNumber").setValue(carNum)
                
                
                
                switch carYear.selectedSegmentIndex {
                case 0:
                 
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarYear").setValue("5年以下")
                    
                    
                case 1:

                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarYear").setValue("5-10年")
                    
                case 2:
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarYear").setValue("10年以上")
                    
                default:
                    break
                }
                
                
                switch carOil.selectedSegmentIndex {
                case 0:
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarOil").setValue("92油")
                    
                case 1:
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarOil").setValue("95油")
                    
                    
                case 2:
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarOil").setValue("98油")
                    
                    
                case 3:
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarOil").setValue("柴油")
                    
                    
                default:
                    break
                }
                
                
                if others.text != ""{
                    FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile").child(uniqueString).child("Other").setValue(others.text)
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarMore").setValue(others.text)

                }else{
                    FIRDatabase.database().reference(withPath: "Car/\(self.uid)/CarFile").child(uniqueString).child("Other").setValue("無備註")
                    
                    FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(uniqueString).child("CarMore").setValue("無備註")

                    
                }
                
                
                //                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //                let nextVC = storyboard.instantiateViewController(withIdentifier: "AddCarThreeViewControllerID")as! AddCarThreeViewController
                //                self.present(nextVC,animated:true,completion:nil)
                
                //self.navigationController?.pushViewController(nextVC, animated: true)
                
                
                
                
                
            }
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



extension OneAddCarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        
        var selectedImageFromPicker: UIImage?
        
        // 取得從 UIImagePickerController 選擇的檔案
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImageFromPicker = pickedImage
        }
        
        
        
        //let uidNum = FIRAuth.auth()?.currentUser?.uid
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
            
            
            // 當判斷有 selectedImage 時，我們會在 if 判斷式裡將圖片上傳
            if let selectedImage = selectedImageFromPicker {
                
                
                let storageRef = FIRStorage.storage().reference().child(self.uid).child("\(uniqueString).png")
                
                if let uploadData = UIImagePNGRepresentation(selectedImage) {
                    // 這行就是 FirebaseStorage 關鍵的存取方法。
                    storageRef.put(uploadData, metadata: nil, completion: { (data, error) in
                        
                        if error != nil {
                            
                            // 若有接收到錯誤，我們就直接印在 Console 就好，在這邊就不另外做處理。
                            print("Error: \(error!.localizedDescription)")
                            return
                        }
                        
                        // 連結取得方式就是：data?.downloadURL()?.absoluteString。
                        if let uploadImageUrl = data?.downloadURL()?.absoluteString {
                            
                            // 我們可以 print 出來看看這個連結事不是我們剛剛所上傳的照片。
                            print("Photo Url: \(uploadImageUrl)")
                            
                            
                            let databaseRef = FIRDatabase.database().reference(withPath: "Cars/\(self.uid)/CarFile").child(self.uniqueString).child("CarImage")
                            
                            databaseRef.setValue(uploadImageUrl, withCompletionBlock: { (error, dataRef) in
                                
                                if error != nil {
                                    
                                    print("Database Error: \(error!.localizedDescription)")
                                }
                                else {
                                    
                                    print("圖片已儲存")
                                }
                                
                            })
                            
                            
                        }
                    })
                }
            }
            dismiss(animated: true, completion: nil)
            
            
        }//uid
        
        
    }
    
    
    
}

