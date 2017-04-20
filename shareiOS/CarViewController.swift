//
//  CarViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/20.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var CarTableView: UITableView!
    
    var imageCar = ["cucu","cucu"]
    
    var numberCar = ["981-JOS","jd1-P13"]
    var typeOil = ["92","95"]
    var yearCar = ["5年以下","5-10年"]
    var typeCar = ["塑膠車","擋車"]
    
    
    var Array: [String?] = []
    
    
    let cellReuseIdentifier = "cell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        CarTableView.delegate = self
        CarTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell" forIndexPath:indexPath) as CustomCarCell

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCarCell
        
        
        
        cell.carImage.image = UIImage(named: imageCar[indexPath.row])
        
        cell.carNumber.text = self.numberCar[indexPath.row]
        
        cell.oilType.text = self.typeOil[indexPath.row]
        
        cell.carYear.text = self.yearCar[indexPath.row]
        
        cell.carType.text = self.typeCar[indexPath.row]

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
