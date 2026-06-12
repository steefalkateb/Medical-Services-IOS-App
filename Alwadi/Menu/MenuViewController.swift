//
//  MenuViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

//https://medium.com/@prathamsalvi27/hamburger-menu-on-uitabbarcontroller-swift-d2ac929937a3

import UIKit
//import SafariServices
class MenuViewController: UIViewController {
    @IBOutlet weak var profileee: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        profileee.backgroundColor = .clear
//        profileee.layer.cornerRadius = 5
//        profileee.layer.borderWidth = 1
//        profileee.layer.borderColor = UIColor.white.cgColor
//        profileee.titleEdgeInsets.top = 0
//        profileee.titleEdgeInsets.left = 1
//        profileee.titleEdgeInsets.bottom = 0
//        profileee.titleEdgeInsets.right = 1
    }
    @IBAction func openViewBtnAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "openViewOneSegue", sender: self)
        HamburgerMenu().closeSideMenu()
        
     
    }
    
    @IBAction func editprofile(_ sender: Any) {
        HamburgerMenu().closeSideMenu()

//        if let vc = storyboard?.instantiateViewController(withIdentifier: "EditProfile") as? EditProfile {
//
//            print("EditProfile")
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    //    @IBAction func openViewTwoBtnAction(_ sender: Any) {
//        HamburgerMenu().closeSideMenu()
//
//        let safariVC = SFSafariViewController(url: URL(string: "https://www.facebook.com/alwadi.medical/")!)
//        present(safariVC, animated: true)
//
//    }
//
//    @IBAction func AboutUs(_ sender: Any) {
//        print("about")
//        HamburgerMenu().closeSideMenu()
//    }
//
//
//    @IBAction func facebook(_ sender: Any) {
//        print("face")
//        HamburgerMenu().closeSideMenu()
//        let safariVC = SFSafariViewController(url: URL(string: "https://www.facebook.com/alwadi.medical/")!)
//        present(safariVC, animated: true)
//    }
//
//    @IBAction func insta(_ sender: Any) {
//        print("insta")
//        HamburgerMenu().closeSideMenu()
//        let safariVC = SFSafariViewController(url: URL(string: "https://www.instagram.com/alwadi_medical/?utm_medium=copy_link")!)
//        present(safariVC, animated: true)
//    }
//
//    @IBAction func web(_ sender: Any) {
//        print("web")
//        HamburgerMenu().closeSideMenu()
//        let safariVC = SFSafariViewController(url: URL(string: "https://www.weldon-group.com/")!)
//        present(safariVC, animated: true)
//    }
//
//    @IBAction func callme(_ sender: Any) {
//        print("callme")
//        HamburgerMenu().closeSideMenu()
////        0997442442
//        if let url = NSURL(string: "tel://\(0997442442)") {
//            UIApplication.shared.openURL(url as URL)
//          }
//    }
//
//    @IBAction func location(_ sender: Any) {
//        print("location")
//        HamburgerMenu().closeSideMenu()
////        34.755153,36.3167193
//        let safariVC = SFSafariViewController(url: URL(string: "https://www.google.com/maps/place/34%C2%B045'18.6%22N+36%C2%B019'08.1%22E/@34.755153,36.3167193,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x67973628202453a0!8m2!3d34.755153!4d36.318908")!)
//        present(safariVC, animated: true)
//    }
//
    
    //    @IBAction func Out(_ sender: Any) {
    //    https://medium.com/@mohammadhemani/set-the-next-view-controller-to-show-as-full-screen-in-ios-13-e7e42e20587a
    //        print("out")
    //        HamburgerMenu().closeSideMenu()
    //        let story = UIStoryboard(name: "Main", bundle: nil)
    //            let controller = story.instantiateViewController(identifier: "loginViewController") as! loginViewController
    //            self.present(controller, animated: true, completion: nil)
    //    }
    
}
