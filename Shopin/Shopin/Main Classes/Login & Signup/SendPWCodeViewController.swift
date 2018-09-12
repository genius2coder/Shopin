//
//  SendPWCodeViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class SendPWCodeViewController: UIViewController {

    let URL_USER_Forgot_Password = "http://api.thelifetracking.com/codeigniter/api/forgotpassword"
    @IBOutlet weak var txt_Email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Email.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendCode(_ sender: Any) {
        guard let textEmail = txt_Email.text, !textEmail.isEmpty else {
            self.alertMessage(message: "Please enter email.", title: "")
            return
        }
        let parameters: Parameters=[
            "user_email":textEmail
        ]
        SVProgressHUD.show(withStatus: "Loading")
        Alamofire.request(URL_USER_Forgot_Password, method: .post, parameters: parameters,encoding: URLEncoding.default, headers: nil).responseJSON {
            response in
            SVProgressHUD.dismiss()
            switch response.result {
            case .success:
                print(response)
                if let result = response.result.value {
                    let responseData = result as! NSDictionary
                    //if there is no error
                    
                    if(responseData.value(forKey: "status") as! Int == 200){
                        let confirmCodeVC:ConfirmCodeViewController = (UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "confirmCodeVC") as? ConfirmCodeViewController)!
                        confirmCodeVC.userEmail = textEmail
                        self.navigationController?.pushViewController(confirmCodeVC, animated: true)
                        
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
    @IBAction func didSelectBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SendPWCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }    
}
