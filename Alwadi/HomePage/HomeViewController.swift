//
//  HomeViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit
import Koloda
//https://www.youtube.com/watch?v=PhqBJom68rk
//https://github.com/Yalantis/Koloda


class HomeViewController: UIViewController ,KolodaViewDataSource, KolodaViewDelegate {
    @IBOutlet weak var view1: UIView!
    var timer: Timer? = nil
    @IBOutlet var vc_koloda: KolodaView!
    var arr = [OfferArr]()
    @IBOutlet var spinner: UIActivityIndicatorView!
    var containers  = [Container_VC_Koloda]()
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
        HamburgerMenu().triggerSideMenu()
    }
    @objc func hideHamburger(){
        HamburgerMenu().closeSideMenu()
    }
    
    
    
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let container = containers[index]
        container.bb = self.arr[index].name
//     "https://kalansarigroup.com/ALWADI_2021/doctors/icon/cardiovascular_diseases/icon_doc1.jpg")
                        let url = URL(string: arr[index].image)
                        let data = try? Data(contentsOf: url!)
                        if let imageData = data {
                            container.image = UIImage(data: imageData)
                        }
        print("5555555")

        container.resetContent()
        self.StopLoadding()
        
        
        //                self.vc_koloda.addSubview(container.view)
        return containers[index].view
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        if arr.count == 3 {
            print("666666")
            vc_koloda.reloadData()
        }
    

        return arr.count

    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection)
    {
        if index == arr.endIndex-1 {
            
            print("222222")
            vc_koloda.resetCurrentCardIndex()
        }else{
            print("333333")

        }
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "OfferDetails") as? OfferDetails {
            
            print("4444444")

            //       https://www.youtube.com/watch?v=Xk2JVTIQGkk
            vc.get_name = arr[index].name
            vc.get_desc = arr[index].desc1
            vc.get_img_view = arr[index].image
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
//            print("777777sr")
//            readournew()rrrrrrr


    //                        loadContaunerView()
  
            
    
            
//                            vc_koloda.reloadData()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
                self.StartLoadding()
    }



    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
    }
    
    
    
    func readournew(){
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/offer_page.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        //        urlRequest.httpMethod = "POST"
        //        let postString = "\()"
        //
        //        //        print(postString,"mmmm")
        //        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                //                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                print(outPutArr[3])
                
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    
                    //                    let name = teamName["name"] as! String
                    //                    print(teamName["desc"])
                    
                    let loc = OfferArr(
                        name: teamName["name"] as! String,
                        image: teamName["image"] as! String,
                        desc1: teamName["desc1"] as! String
                    )
                    
                    self.arr.append(loc)
                }
                self.loadContaunerView()
//                print(self.arr)
                
                DispatchQueue.main.async {
                    self.vc_koloda.dataSource = self
                    self.vc_koloda.delegate = self
//
                    self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.handleTimer), userInfo: nil, repeats: true)
                    

                }
            }
        }
        task.resume()
    }
    
        func loadContaunerView() {
            for _ in 0 ... arr.count - 1 {
//                print(arr)
                
                DispatchQueue.main.async {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Container_VC_Koloda") as!
                        Container_VC_Koloda
                    self.addChild(vc)
                    self.containers.append(vc)
                }
               
                
             
            }

        }
    
//    func loadContaunerView() {
//        for _ in 0 ... arr.count - 1 {
////            print(arr)
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Container_VC_Koloda") as!
//                Container_VC_Koloda
//            self.addChild(vc)
//            containers.append(vc)
//
//        }
////
////
//    }
    
    @objc func handleTimer(_ timer: Timer) {
//        print("Timer ticking! sss")
        vc_koloda.swipe(.right)

        
    }
    
    @IBAction func crossAction(){
        //        print("hhh")
        vc_koloda.swipe(.left)
    }
    
    @IBAction func likeAction(){
        vc_koloda.swipe(.right)
        //        print("nnn")
    }
    
    @IBAction func revertAction(){
        //        print("rrr")
        vc_koloda.reloadData()
        vc_koloda.resetCurrentCardIndex()
    }
    
    
}

//extension HomeViewController: KolodaViewDataSource, KolodaViewDelegate {

    
//    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
////        loadContaunerView()
//
//
//
//        let container = containers[index]
//        //        container.image = self.arry[index]
//        //        container.bb = "22"
//
//        //        print(arr[index].name,"zz")
//        container.bb = self.arr[index].name
//
//        //        print(arr[index].image,"zz")
//
//        //                let url = URL(string: "https://kalansarigroup.com/ALWADI_2021/doctors/icon/cardiovascular_diseases/icon_doc1.jpg")
//        //
//        //                let data = try? Data(contentsOf: url!)
//        //
//        //                if let imageData = data {
//        //                    container.image = UIImage(data: imageData)
//        //
//        //                }
//
//                        let url = URL(string: arr[index].image)
//                        let data = try? Data(contentsOf: url!)
//                        if let imageData = data {
//                            container.image = UIImage(data: imageData)
//                        }
//
//
//        container.resetContent()
//        self.StopLoadding()
//
//
//        //                self.vc_koloda.addSubview(container.view)
//        return containers[index].view
//    }
//
//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        //        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
//        //   CLICK
//
////        print("XXX")
//
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "OfferDetails") as? OfferDetails {
//            //       https://www.youtube.com/watch?v=Xk2JVTIQGkk
//            vc.get_name = arr[index].name
//            vc.get_desc = arr[index].desc1
//            vc.get_img_view = arr[index].image
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//
//    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection)
//    {
////        print(index)
//        if index == arr.endIndex-1 {
////            print("WWW")
//            vc_koloda.resetCurrentCardIndex()
//        }else{
////            print("QQQ")
//        }
//    }
//
//    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//        return arr.count
//    }
//}






