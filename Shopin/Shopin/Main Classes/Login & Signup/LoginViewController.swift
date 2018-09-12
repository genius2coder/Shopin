//
//  LoginViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class LoginViewController: UIViewController {
    let URL_USER_LOGIN = "http://api.thelifetracking.com/codeigniter/api/login"
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        txt_Email.delegate = self
        txt_Password.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDownScreen)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func moveUpScreen() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: -UIScreen.main.bounds.height * 0.2, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func moveDownScreen() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @IBAction func onLoginWithEmail(_ sender: Any) {
        
            guard let textEmail = txt_Email.text, !textEmail.isEmpty else {
                self.alertMessage(message: "Please enter email.", title: "")
                return
            }
            guard let textPassword = txt_Password.text, !textPassword.isEmpty else {
                self.alertMessage(message: "Please enter password.", title: "")
                return
            }
            let parameters: Parameters=[
                "user_email":textEmail,
                "user_password":textPassword
            ]
        
            SVProgressHUD.show(withStatus: "Loading")
            Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseJSON {
                response in
                SVProgressHUD.dismiss()
                switch response.result {
                case .success:
                    print(response)
                    if let result = response.result.value {
                        let responseData = result as! NSDictionary
                        //if there is no error
                        
                        if(responseData.value(forKey: "status") as! Int == 200){
                            
                            //getting the user from response
                            let user = responseData.value(forKey: "detail") as! NSDictionary
                            
                            //getting user values
                            let userId = user.value(forKey: "user_uuid") as! String
                            //let userName = user.value(forKey: "user_name") as! String
                            let userEmail = user.value(forKey: "user_email") as! String
                            let userPhone = user.value(forKey: "user_phone") as! String
                            
                            //saving user values to defaults
                            self.defaultValues.set(userId, forKey: "userid")
                            //self.defaultValues.set(userName, forKey: "username")
                            self.defaultValues.set(userEmail, forKey: "useremail")
                            self.defaultValues.set(userPhone, forKey: "userphone")
                            
                            let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
                            self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
                            
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
    @IBAction func onLoginWithFB(_ sender: Any) {
            FacebookService().login(from: self) { (result) in
                switch result {
                case .success(let profile):
                    print(profile)
                    let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
                    self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
                default:
                    break
                }
            }
    }
    
    @IBAction func onLoginWithBiometric(_ sender: Any) {
        let loginWithBiometricVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginWithBiometricVC") as? LoginWithBiometricViewController
        self.navigationController?.pushViewController(loginWithBiometricVC!, animated: true)
    }
    
    @IBAction func onForgotPW(_ sender: Any) {
        let sendPWCodeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "sendPWCodeVC") as? SendPWCodeViewController
        self.navigationController?.pushViewController(sendPWCodeVC!, animated: true)
    }

    @IBAction func onSignup(_ sender: Any) {
        let signupVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signupVC") as? SignupViewController
        self.navigationController?.pushViewController(signupVC!, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        moveUpScreen()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txt_Email {
            txt_Password.becomeFirstResponder()
        }
        else if textField == txt_Password {
            textField.resignFirstResponder()
            moveDownScreen()
        }
        return true
    }    
}
