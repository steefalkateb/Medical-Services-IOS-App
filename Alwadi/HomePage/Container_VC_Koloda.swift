//
//  Container_VC_Koloda.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class Container_VC_Koloda: UIViewController {

//    let yourView = UIView()


    
    @IBOutlet var ivu: UIImageView!
    //    var image = UIImage?
    
    @IBOutlet  var lbl: UILabel!

    //    var image = UIImage(named:"cards_1")
    var image:UIImage? = nil
    var bb:String=""
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        
//        لفة الصورة بس
        ivu.layer.cornerRadius = 10
        ivu.layer.borderColor = UIColor.lightGray.cgColor
//        ivu.layer.borderWidth = 1
        ivu.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        

    }
    

    func resetContent() {
        DispatchQueue.main.async {
            self.ivu.image = self.image
            self.lbl.text = self.bb
        }
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
