//
//  LoginWithBiometricViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class LoginWithBiometricViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didSelectFaceId(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "TouchEnable")
        UserDefaults.standard.set(true, forKey: "FaceEnable")
    }
    @IBAction func didSelectTouchId(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "FaceEnable")
        UserDefaults.standard.set(true, forKey: "TouchEnable")
    }
    @IBAction func didSelectBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
