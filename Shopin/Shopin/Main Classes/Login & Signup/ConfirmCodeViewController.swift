
//
//  ConfirmCodeViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ConfirmCodeViewController: UIViewController {

    var userEmail: String!
    @IBOutlet weak var txt_Code: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txt_Code.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onConfirmCode(_ sender: Any) {
        guard let textCode = txt_Code.text, !textCode.isEmpty else {
            self.alertMessage(message: "Please enter code.", title: "")
            return
        }

        let changePWVC:ChangePWViewController = (UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "changePWVC") as? ChangePWViewController)!
        changePWVC.verifyCode = textCode as String
        changePWVC.userEmail = userEmail
        self.navigationController?.pushViewController(changePWVC, animated: true)
    }
    
    func alertMessage(message: String, title:String) {
        
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension ConfirmCodeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
