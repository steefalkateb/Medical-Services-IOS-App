//
//  loginViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 11/29/21.
//

import UIKit
import  TransitionButton
//https://www.youtube.com/watch?v=a5_Z9HZSUNM

extension UIView {
    //    Set Background Gradient on Button in Swift
    //    https://stackoverflow.com/questions/37903124/set-background-gradient-on-button-in-swift
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

class loginViewController: UIViewController, OverlayHost {
    
    
    
    let loginbtn = TransitionButton(frame: CGRect(x: 0, y:0, width: 250, height: 50))
    
    @IBOutlet weak var AddMobileNumber: UITextField!
    
    let refreshAlert = UIAlertController(title: "", message: "يجب ادخال رقم الموبايل", preferredStyle: UIAlertController.Style.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnlog()
    }
    func btnlog()  {
        //        btn.center = view.center
        //        loginbtn.backgroundColor = UIColor.init(named"btn1")
        //        self.loginbtn.applyGradient(colours:[.purple,.gray, .orange])
        self.loginbtn.applyGradient(colours: [.init(named: "btn1")!,.init(named: "btn3")!])
        
        //        loginbtn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        //        loginbtn.layer.shadowOpacity = 1.0
        //        loginbtn.layer.shadowRadius = 2
        //        loginbtn.layer.masksToBounds = true
        //        loginbtn.clipsToBounds = false
        loginbtn.setTitle("تأكيد", for: .normal)
        
        loginbtn.layer.cornerRadius = 15
        
        loginbtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginbtn.spinnerColor = .white
        loginbtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginbtn)
        
        let constraints = [
            //            https://www.youtube.com/watch?v=9MHG6JWGUP8
            loginbtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            loginbtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginbtn.widthAnchor.constraint(equalToConstant: 200),
            loginbtn.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    func  shwoAlertTime(){
        //          refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
        //                print("Handle Ok logic here")
        //          }))
        
        refreshAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    @IBAction func login(_ sender: Any) {
        loginbtn.startAnimation()
        if AddMobileNumber.text?.isEmpty ?? true {
            print("textField is empty")
0                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
            self.loginbtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.5){
                self.shwoAlertTime()

            }
                    //                    self.loginbtn.layer.cornerRadius = 12
//                    self.showOverlay(type: MessageViewController.self, fromStoryboardWithName: "Main")

                    //                    let vc = SecondView()
                    //                    self.present(vc, animated: true)
//                }
            
        } else {
            print("textField has some text")
//            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
                //                self.loginbtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 1){
                //                    self.loginbtn.layer.cornerRadius = 12
                //                    self.shwoAlertTime()
                
                
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddCodeViewController") as! AddCodeViewController
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    
}
