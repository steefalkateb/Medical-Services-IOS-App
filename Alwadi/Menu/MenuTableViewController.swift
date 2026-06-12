//
//  MenuTableViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 12/1/21.
//

import UIKit
import SafariServices

class MenuTableViewController: UITableViewController  {
    
    let transportItems = [
        "عن مركز الوادي الطبي"
        ,
        "فيسبوك"
        ,
        "انستغرام"
        ,
        "الموقع الالكتروني"
        ,
        "اتصل بنا"
        ,
        "موقعنا"
        ,
        "تسجيل خروج"
        
    ]
    var imgArrayA = [UIImage(named: "aboutt"), UIImage(named: "facebook")
                     , UIImage(named: "insta"), UIImage(named: "website")
                     , UIImage(named: "callme"), UIImage(named: "location")
                     , UIImage(named: "sign_out")
    ]
    @IBOutlet weak var tableview:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.systemGray6
//        https://stackoverflow.com/questions/1369831/eliminate-extra-separators-below-uitableview6
//        show only my cell
        self.tableView.tableFooterView = UIView(frame: .zero)
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(transportItems.count)
        return transportItems.count
        
//        return 7
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCustomTable
        let row = indexPath.row
        cell.nemelable.text = transportItems[indexPath.row]
        cell.imgview.image = imgArrayA[indexPath.row]
        

        return cell

    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        //        print(indexPath)
        if case indexPath.row =  0 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            
//            let ctrl = AboutAs()
//
//            let nav = UINavigationController(rootViewController: ctrl)
//            nav.modalPresentationStyle = .fullScreen
//
//            self.navigationController?.present(nav, animated: true)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"AboutAsModalID") as! AboutAs
            self.present(viewController, animated: true)
            
        }else if case indexPath.row =  1 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            let safariVC = SFSafariViewController(url: URL(string: "https://www.facebook.com/alwadi.medical/")!)
            present(safariVC, animated: true)
        }else if case indexPath.row =  2 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            let safariVC = SFSafariViewController(url: URL(string: "https://www.instagram.com/alwadi_medical/?utm_medium=copy_link")!)
            present(safariVC, animated: true)
            
        }else if case indexPath.row =  3 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            let safariVC = SFSafariViewController(url: URL(string: "https://www.weldon-group.com/")!)
            present(safariVC, animated: true)
            
        }else if case indexPath.row =  4 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            //        0997442442
            if let url = NSURL(string: "tel://\(0997442442)") {
                UIApplication.shared.openURL(url as URL)
            }
        }else if case indexPath.row =  5 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
            //        34.755153,36.3167193
            let safariVC = SFSafariViewController(url: URL(string: "https://www.google.com/maps/place/34%C2%B045'18.6%22N+36%C2%B019'08.1%22E/@34.755153,36.3167193,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x67973628202453a0!8m2!3d34.755153!4d36.318908")!)
            present(safariVC, animated: true)
            
        }else if case indexPath.row =  6 {
            print(indexPath)
            HamburgerMenu().closeSideMenu()
//            https://stackoverflow.com/questions/56435510/presenting-modal-in-ios-13-fullscreen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"logout") as! logout
            self.present(viewController, animated: true)
          
        }
    }
    

      
    
}
