//
//  NotifyDetails.swift
//  Alwadi
//
//  Created by MacBookPro on 1/10/22.
//

import UIKit

class NotifyDetails: UIViewController {
    @IBOutlet weak var desctwolbl: UILabel!
    @IBOutlet weak var desclbl: UILabel!
    @IBOutlet weak var date_timelbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var get_desctwolbl = ""
    var get_desclbl = ""
    var get_date_timelbl = ""
    var get_img_view = ""

    
    @IBOutlet var spinner: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        StartLoadding()
        desctwolbl.text = get_desctwolbl
        desclbl.text = get_desclbl
        date_timelbl.text = get_date_timelbl

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
        }
        StopLoadding()
    }
    
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
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
