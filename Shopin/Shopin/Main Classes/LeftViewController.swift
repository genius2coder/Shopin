//
//  LeftViewController.swift
//  Shopin
//
//  Created by Golden Work on 8/29/18.
//  Copyright © 2018 Golden Work. All rights reserved.
//

import UIKit

enum LeftMenu: Int {
    case profile = 1
    case main
    case myCart
    case myOrder
    case wishlist
    case coupons
    case credits
    case chat
    case aboutUs
    case contactUs
    case termsAndConditions
    case privacyPolicy
    case logout
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Profile", "Categories", "My cart", "My orders", "Wishlist", "Coupons", "Credits", "Chat", "About us", "Contact us", "Terms and condition", "Privacy policy","Logout"]
    var profileVC: UIViewController!
    var mainTabBarVC: UIViewController!
    var myCartVC: UIViewController!
    var myOrdersVC: UIViewController!
    var wishlistVC: UIViewController!
    var couponVC: UIViewController!
    var creditVC: UIViewController!
    var chatVC: UIViewController!
    var aboutUsVC: UIViewController!
    var contactUsVC: UIViewController!
    var termsConditionsVC: UIViewController!
    var privacyPolicyVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let profileVC0 = storyboard.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        self.profileVC = UINavigationController(rootViewController: profileVC0)
        
        self.mainTabBarVC = storyboard.instantiateViewController(withIdentifier: "mainTabBarVC") as! MainTabBarController
        
        let myCartVC0 = storyboard.instantiateViewController(withIdentifier: "myCartVC") as! MycartViewController
        self.myCartVC = UINavigationController(rootViewController: myCartVC0)
        
        let myOrdersVC0 = storyboard.instantiateViewController(withIdentifier: "myOrdersVC") as! MyOrdersViewController
        self.myOrdersVC = UINavigationController(rootViewController: myOrdersVC0)
            
        let wishlistVC0 = storyboard.instantiateViewController(withIdentifier: "wishlistVC") as! WishlistViewController
        self.wishlistVC = UINavigationController(rootViewController: wishlistVC0)
            
        let couponVC0 = storyboard.instantiateViewController(withIdentifier: "couponVC") as! CouponViewController
        self.couponVC = UINavigationController(rootViewController: couponVC0)
            
        let creditVC0 = storyboard.instantiateViewController(withIdentifier: "creditVC") as! CreditViewController
        self.creditVC = UINavigationController(rootViewController: creditVC0)
            
        let chatVC0 = storyboard.instantiateViewController(withIdentifier: "chatVC") as! ChatViewController
        self.chatVC = UINavigationController(rootViewController: chatVC0)
            
        let aboutUsVC0 = storyboard.instantiateViewController(withIdentifier: "aboutUsVC") as! AboutUsViewController
        self.aboutUsVC = UINavigationController(rootViewController: aboutUsVC0)
            
        let contactUsVC0 = storyboard.instantiateViewController(withIdentifier: "contactUsVC") as! ContactUsViewController
        self.contactUsVC = UINavigationController(rootViewController: contactUsVC0)
        
        let termsConditionsVC0 = storyboard.instantiateViewController(withIdentifier: "termsConditionsVC") as! TermsConditionsViewController
        self.termsConditionsVC = UINavigationController(rootViewController: termsConditionsVC0)
            
        let privacyPolicyVC0 = storyboard.instantiateViewController(withIdentifier: "privacyPolicyVC") as! PrivacyPolicyViewController
        self.privacyPolicyVC = UINavigationController(rootViewController: privacyPolicyVC0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .profile:
            self.slideMenuController()?.changeMainViewController(self.profileVC, close: true)
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainTabBarVC, close: true)
        case .myCart:
            self.slideMenuController()?.changeMainViewController(self.myCartVC, close: true)
        case .myOrder:
            self.slideMenuController()?.changeMainViewController(self.myOrdersVC, close: true)
        case .wishlist:
            self.slideMenuController()?.changeMainViewController(self.wishlistVC, close: true)
        case .coupons:
            self.slideMenuController()?.changeMainViewController(self.couponVC, close: true)
        case .credits:
            self.slideMenuController()?.changeMainViewController(self.creditVC, close: true)
        case .chat:
            self.slideMenuController()?.changeMainViewController(self.chatVC, close: true)
        case .aboutUs:
            self.slideMenuController()?.changeMainViewController(self.aboutUsVC, close: true)
        case .contactUs:
            self.slideMenuController()?.changeMainViewController(self.contactUsVC, close: true)
        case .termsAndConditions:
            self.slideMenuController()?.changeMainViewController(self.termsConditionsVC, close: true)
        case .privacyPolicy:
            self.slideMenuController()?.changeMainViewController(self.privacyPolicyVC, close: true)
        case .logout:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rootVC: UINavigationController = storyboard.instantiateViewController(withIdentifier: "rootVC") as! UINavigationController
            let leftVC = storyboard.instantiateViewController(withIdentifier: "leftVC") as! LeftViewController
            let rightVC = storyboard.instantiateViewController(withIdentifier: "rightVC") as! RightViewController
            
            let slideMenuController = SlideMenuController(mainViewController: rootVC, leftMenuViewController: leftVC, rightMenuViewController: rightVC)
            slideMenuController.automaticallyAdjustsScrollViewInsets = true
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = slideMenuController
        }
        
    }
}

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = self.tableView.dequeueReusableCell(withIdentifier:"avapterCell") as! AvapterTableViewCell
            return cell
        }else{
            let cell = self.tableView.dequeueReusableCell(withIdentifier:"leftCell") as! LeftTableViewCell
            let title = menus[indexPath.row - 1]
            cell.img_Icon.image = UIImage(named:"icon_" + title)
            cell.lbl_Title.text = title
            return cell
        }
    }   
}
