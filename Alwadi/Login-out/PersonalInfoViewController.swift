//
//  PersonalInfoViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 12/14/21.
//

import UIKit
import  TransitionButton
extension UIView {
    //    Set Background Gradient on Button in Swift
    //    https://stackoverflow.com/questions/37903124/set-background-gradient-on-button-in-swift
    @discardableResult
    func applyGradientPersonalInfo(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradientPersonalInfo(colours: colours, locations: nil)
    }
    
    @discardableResult
    func applyGradientPersonalInfo(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
class PersonalInfoViewController: UIViewController {
    
    let Codebtn = TransitionButton(frame: CGRect(x: 0, y:0, width: 250, height: 50))
    
    @IBOutlet weak var AddName: UITextField!
    @IBOutlet weak var AddEmail: UITextField!

    let refreshAlert = UIAlertController(title: "", message: "يجب ادخال الاسم والايميل", preferredStyle: UIAlertController.Style.alert)
    
    @IBOutlet weak var profileimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimg.image = profileimg.image?.withRenderingMode(.alwaysTemplate)
        profileimg.tintColor = UIColor.init(named: "AlwadiColor")
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
        Codebtn.setTitle("حفظ", for: .normal)
        Codebtn.layer.cornerRadius = 15
        
        Codebtn.addTarget(self, action: #selector(Save), for: .touchUpInside)
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
    @IBAction func Save(_ sender: Any) {
        Codebtn.startAnimation()
        if AddName.text?.isEmpty ?? true && AddEmail.text?.isEmpty ?? true {
            print("AddName is empty")
            print("AddEmail is empty")

//            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
                self.Codebtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 0.5){
                    //                    self.Codebtn.layer.cornerRadius = 12
                    self.shwoAlertTime()
                    //                    let vc = SecondView()
                    //                    self.present(vc, animated: true)
//                }
            }
        } else {
            print("AddNAme AddEmail has some text")
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                //            self.btn.stopAnimation(animationStyle: .normal, revertAfterDelay: 1){
                //            self.btn.stopAnimation(animationStyle: .expand, revertAfterDelay: 1){
                //                self.Codebtn.stopAnimation(animationStyle: .shake, revertAfterDelay: 1){
                //                    self.Codebtn.layer.cornerRadius = 12
                //                    self.shwoAlertTime()
                
                
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "sss") as! MainViewController
                self.present(newViewController, animated: true, completion: nil)
            }
        }
    }

}
