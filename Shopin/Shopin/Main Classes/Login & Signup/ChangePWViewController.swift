//
//  ChangePWViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ChangePWViewController: UIViewController {

    let URL_USER_Reset_Password = "http://api.thelifetracking.com/codeigniter/api/resetpassword "
    var verifyCode: String!
    var userEmail: String!
    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onResetPassword(_ sender: Any) {
        guard let textPassword = txt_Password.text, !textPassword.isEmpty else {
            self.alertMessage(message: "Please enter password.", title: "")
            return
        }
        if txt_Password.text != txt_ConfirmPW.text {
            self.alertMessage(message: "Please enter same password and confirm password.", title: "")
            return
        }
        let parameters: Parameters=[
            "user_password":textPassword,
            "user_email":userEmail,
            "user_token":verifyCode
        ]
        SVProgressHUD.show(withStatus: "Loading")
        Alamofire.request(URL_USER_Reset_Password, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            SVProgressHUD.dismiss()
            switch response.result {
            case .success:
                print(response)
                if let result = response.result.value {
                    let responseData = result as! NSDictionary
                    //if there is no error
                    
                    if(responseData.value(forKey: "status") as! Int == 200){
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let rootVC: UINavigationController = storyboard.instantiateViewController(withIdentifier: "rootVC") as! UINavigationController
                        let leftVC = storyboard.instantiateViewController(withIdentifier: "leftVC") as! LeftViewController
                        let rightVC = storyboard.instantiateViewController(withIdentifier: "rightVC") as! RightViewController
                        
                        let slideMenuController = SlideMenuController(mainViewController: rootVC, leftMenuViewController: leftVC, rightMenuViewController: rightVC)
                        slideMenuController.automaticallyAdjustsScrollViewInsets = true
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = slideMenuController
                        
                        let alertMessage = responseData.value(forKey: "message") as! String
                        self.alertMessage(message: alertMessage, title: "")
                    }else if(responseData.value(forKey: "statu") as! Int == 201){
                        let errorMessage = responseData.value(forKey: "message") as! String
                        
                        self.alertMessage(message: errorMessage, title: "")
                    }
                }
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
    func alertMessage(message: String, title:String) {
        
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

