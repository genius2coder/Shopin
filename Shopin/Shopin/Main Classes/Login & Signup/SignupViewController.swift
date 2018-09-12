//
//  SignupViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class SignupViewController: UIViewController {

    let URL_USER_REGISTER = "http://api.thelifetracking.com/codeigniter/api/register"
    let defaultValues = UserDefaults.standard
    
    
    @IBOutlet weak var txt_FullName: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_PhoneNO: UITextField!
    @IBOutlet weak var txt_Password: UITextField!
    @IBOutlet weak var txt_ConfirmPassword: UITextField!
    var isAccept:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_FullName.delegate = self
        txt_Email.delegate = self
        txt_PhoneNO.delegate = self
        txt_Password.delegate = self
        txt_ConfirmPassword.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveDownScreen)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveUpScreen() {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: -UIScreen.main.bounds.height * 0.05, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func moveDownScreen() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        let loginVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginVC") as? LoginViewController
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    @IBAction func didSelectAccpetTerms(_ sender: UIButton) {
        
        if sender.isSelected {
            isAccept = false
            sender.isSelected = false
        }else
        {
            isAccept = true
            sender.isSelected = true
        }
    }
    
    
    @IBAction func didSelectRegister(_ sender: Any) {
        //"phone":txt_PhoneNO.text!,
        //getting the username and password
        
        guard let textName = txt_FullName.text, !textName.isEmpty else {
            self.alertMessage(message: "Please enter name.", title: "")
            return
        }
        guard let textEmail = txt_Email.text, !textEmail.isEmpty else {
            self.alertMessage(message: "Please enter email.", title: "")
            return
        }
        guard let textPhone = txt_PhoneNO.text, !textPhone.isEmpty else {
            self.alertMessage(message: "Please enter phone.", title: "")
            return
        }
        guard let textPassword = txt_Password.text, !textPassword.isEmpty else {
            self.alertMessage(message: "Please enter password.", title: "")
            return
        }
        if txt_Password.text != txt_ConfirmPassword.text {
            self.alertMessage(message: "Please enter same password and confirm password.", title: "")
            return
        }
        if isAccept == false {
            self.alertMessage(message: "Please accpet terms & privacy policy.", title: "")
            return
        }
        
        
        
        
        let parameters: Parameters=[
            "user_name":txt_FullName.text!,
            "user_email":txt_Email.text!,
            "user_phone":txt_PhoneNO.text!,
            "user_password":txt_Password.text!
        ]

        SVProgressHUD.show(withStatus: "Loading")
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            SVProgressHUD.dismiss()
            switch response.result {
            case .success:
                print(response)
                if let result = response.result.value {
                    let responseData = result as! NSDictionary
                    //if there is no error

                    if(responseData.value(forKey: "status") as! Int == 200){

                        let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
                        self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
                        
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
                    }else if(responseData.value(forKey: "status") as! Int == 201){

                        //error message in case of invalid credential
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
    @IBAction func onLoginWithBiometric(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
//        let loginWithBiometricVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginWithBiometricVC") as? LoginWithBiometricViewController
//        self.navigationController?.pushViewController(loginWithBiometricVC!, animated: true)
    }
    
    
    func alertMessage(message: String, title:String) {
        
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //moveUpScreen()
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txt_FullName {
            txt_Email.becomeFirstResponder()
        }else if textField == txt_Email{
            txt_PhoneNO.becomeFirstResponder()
        }else if textField == txt_PhoneNO{
            txt_Password.becomeFirstResponder()
        }else if textField == txt_Password{
            txt_ConfirmPassword.becomeFirstResponder()
        }else if textField == txt_ConfirmPassword{
            textField.resignFirstResponder()
            moveDownScreen()
        }

        return true
    }
    
    
}

