//
//  OrderStatusViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/3/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class OrderStatusViewController: MomViewController {

    @IBOutlet weak var productView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        productView.layer.cornerRadius = 10
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.layer.borderWidth = 1
        productView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction override func onChat(_ sender: Any) {
        let chatVC0 = storyboard?.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
        let chatVC = UINavigationController(rootViewController: chatVC0)
        self.slideMenuController()?.changeMainViewController(chatVC, close: true)
    }
    
    @IBAction override func onNews(_ sender: Any) {
        let newsVC0 = storyboard?.instantiateViewController(withIdentifier: "newsVC") as! NewsViewController
        let newsVC = UINavigationController(rootViewController: newsVC0)
        self.slideMenuController()?.changeMainViewController(newsVC, close: true)
    }
    
    
    @IBAction override func onNotification(_ sender: Any) {
        let notificationVC0 = storyboard?.instantiateViewController(withIdentifier: "notificationVC") as! NotificationViewController
        let notificationVC = UINavigationController(rootViewController: notificationVC0)
        self.slideMenuController()?.changeMainViewController(notificationVC, close: true)
    }
    
    @IBAction override func onSelectCountry(_ sender: Any) {
        let selectCountryVC0 = storyboard?.instantiateViewController(withIdentifier: "selectCountryVC") as! SelectCountryViewController
        let selectCountryVC = UINavigationController(rootViewController: selectCountryVC0)
        self.slideMenuController()?.changeMainViewController(selectCountryVC, close: true)
    }
    
    @IBAction override func onSelectLanguage(_ sender: Any) {
        let selectLanguageVC0 = storyboard?.instantiateViewController(withIdentifier: "selectLanguageVC") as! SelectLanguageViewController
        let selectLanguageVC = UINavigationController(rootViewController: selectLanguageVC0)
        self.slideMenuController()?.changeMainViewController(selectLanguageVC, close: true)
    }
}
