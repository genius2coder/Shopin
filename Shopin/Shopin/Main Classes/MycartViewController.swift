//
//  MycartViewController.swift
//  Shopin
//
//  Created by Golden Work on 9/1/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

class MycartViewController: MomViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction override func onLeftNenu(_ sender: Any) {
        self.slideMenuController()?.openLeft()
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

extension MycartViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension MycartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"wishListCell") as! WishListTableViewCell
        cell.lbl_ItemNO.text = (String)(indexPath.row + 1)
        return cell
    }
}
