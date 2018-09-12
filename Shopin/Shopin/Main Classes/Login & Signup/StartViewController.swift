//
//  StartViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(_ sender: Any) {
        let loginVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginVC") as? LoginViewController
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
    
    @IBAction func onSignup(_ sender: Any) {
        let signupVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signupVC") as? SignupViewController
        self.navigationController?.pushViewController(signupVC!, animated: true)
    }
    @IBAction func onSkip(_ sender: Any) {
        let mainTabBarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabBarVC") as? MainTabBarController
        self.navigationController?.pushViewController(mainTabBarVC!, animated: true)
    }
}

