//
//  OfferDetails.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class OfferDetails: UIViewController {

    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    //    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet var spinner: UIActivityIndicatorView!

    var get_name = ""
    var get_img_view = ""
    var get_desc = ""

    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
    }
    

    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "AlwadiColor")

        
        super.viewDidLoad()
        print("OfferDetails")
        self.StartLoadding()

        namelbl.text = get_name
        desclbl.text = get_desc

        print(namelbl.text)
        if let imageURL = URL(string: get_img_view) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                
                if let data = data {
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        self.img.image = image
                        
                        print("lllll")
                        
                    }
                }
            }
//            self.StopLoadding()
        }
        
    }
    


}
