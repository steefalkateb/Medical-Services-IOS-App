//
//  ProfileViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class ProfileViewController: UIViewController  ,UITableViewDataSource ,UITableViewDelegate{

    var get_name_service = ""
    var get_name_doctor =  ""
    var date = ""
    var time = ""
    
    
    var customer_email = ""
    
    @IBOutlet weak var tableview:UITableView!
    var arr = [MyAppointmentsArr]()
    @IBOutlet var spinner: UIActivityIndicatorView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(get_name_service,get_name_doctor,date,time)
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "AlwadiColor")

        tableview.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableview.delegate = self
        tableview.dataSource = self
        
        myAppointments(code: "mmmmm")

    }
    
    func StopLoadding() {
        spinner.stopAnimating()
    }
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }

    
    func myAppointments(code: String){
        StartLoadding()
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/all_my_appointments.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        urlRequest.httpMethod = "POST"
        let postString = "customer_email=\(code)"
        
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                print(outPutArr)
                
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    let loc = MyAppointmentsArr (
                        date: teamName["date"] as! String,
                        time: teamName["time"] as! String,
                        service: teamName["service"] as! String,
                        doctor: teamName["doctor"] as! String
                    )
//                  print(self.arr)
                    self.arr.append(loc)
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                    self.StopLoadding()
                }

            }

        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell") as? AppointmentsTableViewCell else {
            return UITableViewCell()
        }
    
        cell.datelable.text = arr[indexPath.row].date

        cell.timelable.text = arr[indexPath.row].time
        cell.servicelable.text = arr[indexPath.row].service
        cell.doctorlable.text = arr[indexPath.row].doctor

        cell.layer.cornerRadius = 10.0
        cell.layer.shadowColor = UIColor.gray.cgColor
        //        cell.layer.shadowOffset = CGSize(width: 50.0, height: 50.0)
        //        cell.layer.shadowRadius = 50.0
        //        cell.layer.shadowOpacity = 2.0
        
        
//        if let imageURL = URL(string: arr[indexPath.row].image) {
//            DispatchQueue.global().async {
//                let data = try? Data(contentsOf: imageURL)
//                if let data = data {
//                    let image = UIImage(data:data)
//                    DispatchQueue.main.async {
//                        cell.imgview.image=image
//                    }
//                }
//            }
//        }
        return cell
    }
    
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableview.deselectRow(at: indexPath, animated: true)
//        //        https://www.youtube.com/watch?v=v0Hx7q26Hoo
//        //        performSegue(withIdentifier: "makingtransition", sender: self)
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorDetails") as? DoctorDetails {
//
//            //        vc.img = UIImage named:  arr[indexPath.row].image
//            //        vc.img = UIImage (named: arr[indexPath.row].image)
//            //       https://www.youtube.com/watch?v=Xk2JVTIQGkk
//            vc.get_name = arr[indexPath.row].name
//            vc.get_desc = arr[indexPath.row].desc1
//            vc.get_desc2 = arr[indexPath.row].desc2
//            vc.get_specialty = arr[indexPath.row].specialty
//            vc.get_img_view = arr[indexPath.row].image
//
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
    
    
    
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
        HamburgerMenu().triggerSideMenu()
    }
}
