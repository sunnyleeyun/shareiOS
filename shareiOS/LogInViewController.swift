//
//  LogInViewController.swift
//  shareiOS
//
//  Created by Mac on 2017/4/26.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class LogInViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullScreenSize = UIScreen.main.bounds.size

        
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        
        loginButton.frame = CGRect(x: 0, y: 0, width: view.frame.width-32, height: 50)
        loginButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.85)

        loginButton.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }

    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        logIn()
        
        print("Successfully logged in with facebook")
    }
    
    
    
    func logIn(){
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if error != nil{
                print("Something went wrong with our fb user: ", error ?? "")
                return
                
            }
            
            
            let nextView = (self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerID"))! as UIViewController
            self.present(nextView, animated: true, completion: nil)
            
            print("Successfully logged in with our user: ", error ?? "")
            
            
            
        })
        
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
