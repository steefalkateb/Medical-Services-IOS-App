//
//  DoctorDetails.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class DoctorDetails: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var desclbl: UILabel!
    
    
    
    //    @IBOutlet weak var desctwo: UITextView!
    @IBOutlet weak var desctwo: UILabel!
    @IBOutlet weak var specialtylable: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    var arr = [arrbinding_doctor]()
    @IBOutlet weak var tableview:UITableView!
    
    
    var get_img_view = ""
    var get_name = ""
    var get_desc = ""
    var get_desc2 = ""
    var get_specialty = ""
    
    @IBOutlet var spinner: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .systemGreen
        //        lbl.text = ",kjkjkjksdkfergrotp"
        tableview.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableview.delegate = self
        tableview.dataSource = self
        
        namelbl.text = get_name
        desclbl.text = get_desc
        desctwo.text = get_desc2
        //        specialtylable.text = get_specialty
        //        img.image = get_img_view()
        
//        print("MM",get_img_view)

        
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
        
        readspecialty(code:get_name)
        
    }
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
    }
    
    func readspecialty(code: String){
    
        print(code, "555")
        
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/binding_doctor.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        urlRequest.httpMethod = "POST"
        let postString = "doctor=\(code)"
        
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                print(outPutArr.count)
                
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    
                    //                    let name = teamName["name"] as! String
                    //                                        print(teamName["name"])
                    let loc = arrbinding_doctor(
                        name: teamName["name"] as! String,
                        image: teamName["image"] as! String,
                        desc1: teamName["desc1"] as! String,
                        desc2: teamName["desc2"] as! String,
                        time: teamName["time"] as! String,
                        price: teamName["price"] as! String
                    )
                    self.arr.append(loc)
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)'
//        self.StartLoadding()
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell") as?
                CustTableViewCell else {
            return UITableViewCell()
        }

        cell.namelable.text = arr[indexPath.row].name
        //        cell.desclable.text = arr[indexPath.row].desc1
        //        cell.desctwo.text = arr[indexPath.row].desc2
        //        cell.specialtylable.text = arr[indexPath.row].specialty
        cell.layer.cornerRadius = 10.0
        cell.layer.shadowColor = UIColor.gray.cgColor

        if let imageURL = URL(string: arr[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        cell.imgview.image=image
                        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)

                    }
                }
            }
        }
//        StopLoadding()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        //        https://www.youtube.com/watch?v=v0Hx7q26Hoo
        //        performSegue(withIdentifier: "makingtransition", sender: self)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ServiceDetails") as? ServiceDetails {
            
            print(arr[indexPath.row])

//                   https://www.youtube.com/watch?v=Xk2JVTIQGkk
            vc.get_name = arr[indexPath.row].name
            vc.get_img_view = arr[indexPath.row].image
            vc.get_desc = arr[indexPath.row].desc1
            vc.get_desc2 = arr[indexPath.row].desc2
            vc.get_time = arr[indexPath.row].time
            vc.get_price = arr[indexPath.row].price

            print(vc.get_desc)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
