//
//  VerificationCode.swift
//  Alwadi
//
//  Created by MacBookPro on 12/16/21.
//

import UIKit
import  TransitionButton
extension UIView {
    //    Set Background Gradient on Button in Swift
    //    https://stackoverflow.com/questions/37903124/set-background-gradient-on-button-in-swift
    @discardableResult
    func applyGradientVerificationCode(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradientVerificationCode(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradientVerificationCode(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

class VerificationCode: UIViewController {

    
    let Codebtn = TransitionButton(frame: CGRect(x: 0, y:0, width: 250, height: 50))
    
    @IBOutlet weak var addVerificationCode: UITextField!
    
    let refreshAlert = UIAlertController(title: "", message: "يجب ادخال رمز التحقق", preferredStyle: UIAlertController.Style.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCode()
    }
    func btnCode()  {
        //        btn.center = view.center
        //        Codebtn.backgroundColor = UIColor.init(named"btn1")
        //        self.Codebtn.applyGradient(colours:[.purple,.gray, .orange])
        self.Codebtn.applyGradientVerificationCode(colours: [.init(named: "btn1")!,.init(named: "btn3")!])
        //        Codebtn.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        //        Codebtn.layer.shadowOpacity = 1.0
        //        Codebtn.layer.shadowRadius = 2
        //        Codebtn.layer.masksToBounds = true
        //        Codebtn.clipsToBounds = false
        Codebtn.setTitle("تأكيد", for: .normal)
        Codebtn.layer.cornerRadius = 15
        
        Codebtn.addTarget(self, action: #selector(addCode), for: .touchUpInside)
        Codebtn.spinnerColor = .white
        Codebtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(Codebtn)
        
        let constraints = [
            //            https://www.youtube.com/watch?v=9MHG6JWGUP8
            Codebtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            Codebtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Codebtn.widthAnchor.constraint(equalToConstant: 200),
            Codebtn.heightAnchor.constraint(equalToConstant: 30)
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
    @IBAction func addCode(_ sender: Any) {
        Codebtn.startAnimation()
        if addVerificationCode.text?.isEmpty ?? true {
            print("textField is empty")
//            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
//                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
//                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
            self.Codebtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.5){
                    //                    self.Codebtn.layer.cornerRadius = 12
                    self.shwoAlertTime()
                    //                    let vc = SecondView()
                    //                    self.present(vc, animated: true)
                }
//            }
       
            
        } else {
            print("textField has some text")
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
                //                self.Codebtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 1){
                //                    self.Codebtn.layer.cornerRadius = 12
                //                    self.shwoAlertTime()
                
                
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "PersonalInfo") as! PersonalInfo
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }
    


}
