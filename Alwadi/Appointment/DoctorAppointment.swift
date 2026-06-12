//
//  DoctorAppointment.swift
//  Alwadi
//
//  Created by MacBookPro on 12/9/21.
//

import UIKit

class DoctorAppointment: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    
    var get_name = ""
    var get_time = ""

    @IBOutlet var spinner: UIActivityIndicatorView!

    @IBOutlet weak var tableview:UITableView!
    var arr = [ArrDoctorAppointment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.StartLoadding()

        
        tableview.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableview.delegate = self
        tableview.dataSource = self
        
        print("QQQQQ", get_name,get_time)

        readDoctorByService(code: get_name)
        
    }
    
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
    }
    
    func readDoctorByService(code: String){
        
        
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/selectdoctorbyservice.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        urlRequest.httpMethod = "POST"
        let postString = "doctor=\(code)"
//        print("dssds",code)
        
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                //print(outPutArr[3])
                
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    let loc = ArrDoctorAppointment(
                        name: teamName["doctor"] as! String,
                        desc1: teamName["desc1"] as! String,
                        image: teamName["image"] as! String
                    )
//                    print(self.arr)r
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
        
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell") as?
                CustTableViewCell else {
            return UITableViewCell()
        }
        
        cell.namelable.text = arr[indexPath.row].name
        cell.desclable.text = arr[indexPath.row].desc1
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        //        https://www.youtube.com/watch?v=v0Hx7q26Hoo
        //        performSegue(withIdentifier: "makingtransition", sender: self)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as? CalendarViewController {
            vc.get_name_service = get_name
            vc.get_name_time = get_time

            vc.get_name_doctor = arr[indexPath.row].name
            
            
            print(vc.get_name_doctor)
            //            vc.get_name_doctor = namelable.text
            //        vc.img = UIImage named:  arr[indexPath.row].image
            //        vc.img = UIImage (named: arr[indexPath.row].image)
            //       https://www.youtube.com/watch?v=Xk2JVTIQGkk
            //            vc.get_name = arr[indexPath.row].name
            //            vc.get_desc = arr[indexPath.row].desc1
            ////            vc.get_desc2 = arr[indexPath.row].desc2
            ////            vc.get_specialty = arr[indexPath.row].specialty
            //            vc.get_img_view = arr[indexPath.row].image
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
