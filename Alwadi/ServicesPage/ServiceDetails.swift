//
//  ServiceDetails.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class ServiceDetails: UIViewController {
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var desctwo: UILabel!
    @IBOutlet weak var timelable: UILabel!
    @IBOutlet weak var pricelable: UILabel!
    @IBOutlet weak var img: UIImageView!
    //    @IBOutlet weak var btnStatus: UIButton!
    var get_name = ""

    var get_img_view = ""
    var get_desc = ""
    var get_desc2 = ""
    var get_time = ""
    var get_price = ""
    
    var arr = [ArrDoctorAppointment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "AlwadiColor")
        print("1",get_name)
        print("2",get_desc)
        print("3",get_desc2)
        print("4",get_time)
        print("5",get_price)
        namelbl.text = get_name
        desclbl.text = get_desc
        desctwo.text = get_desc2
        timelable.text = get_time
        pricelable.text = get_price
        if let imageURL = URL(string: get_img_view) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        self.img.image = image
                    }
                }
            }
        }
        
        
        
    }
    
    @IBAction func SelectDoctorByService(_ sender : Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorAppointment") as? DoctorAppointment {
            vc.get_name = get_name
            vc.get_time = get_time

          
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
}





