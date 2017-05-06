//
//  CarViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/20.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class CarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var CarTableView: UITableView!
    
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorageReference!

    var refHandle: UInt!
    var carList = [Cars]()
    
    var imageCar = ["cucu","cucu"]
    
    var numberCar = ["981-JOS","jd1-P13"]
    var typeOil = ["92","95"]
    var yearCar = ["5年以下","5-10年"]
    
    var uid = ""

    
    let cellReuseIdentifier = "cell"

    @IBAction func addCar(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CarTableView.delegate = self
        CarTableView.dataSource = self
        
        
        if let user = FIRAuth.auth()?.currentUser {
            uid = user.uid
        }

        
        databaseRef = FIRDatabase.database().reference()
        storageRef = FIRStorage.storage().reference()

        fetchCarlist()
        
//
//        let rightButtonItem = UIBarButtonItem.init(
//            title: "新增",
//            style: .done,
//            target: self,
//            action: #selector(didTapEditButton)
//        )
//        
//        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        
        
        
        
        
        
        

    
    
    }

    func didTapEditButton(sender: AnyObject) {
        print("hjxdbsdhjbv")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "AddCarOneViewControllerID")as! AddCarOneViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    func fetchCarlist(){
       
        
        
        refHandle = databaseRef.child("Cars/\(self.uid)").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String : AnyObject]{
                
                print("dictionary is \(dictionary)")
                
                let carDetail = Cars()
                
                

                
                carDetail.setValuesForKeys(dictionary)
                self.carList.append(carDetail)
                
                
                DispatchQueue.main.async {
                    self.CarTableView.reloadData()
                }
                
                
            }
            
        })
//
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
        //return numberCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell" forIndexPath:indexPath) as CustomCarCell

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCarCell
        
        
        //cell.carImage.image = carList[indexPath.row].CarImage
        //cell.carImage.image = UIImage(named: imageCar[indexPath.row])
        cell.carImage.image = UIImage(named: "cucu")
        
        cell.carNumber.text = carList[indexPath.row].CarNumber
        //cell.carNumber.text = self.numberCar[indexPath.row]
        
        
        cell.carOil.text = carList[indexPath.row].CarOil
        
        //cell.oilType.text = self.typeOil[indexPath.row]
        
        
        cell.carYear.text = carList[indexPath.row].CarYear
        //cell.carYear.text = self.yearCar[indexPath.row]
        
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
