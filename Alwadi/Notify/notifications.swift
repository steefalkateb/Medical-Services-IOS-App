//
//  notifications.swift
//  Alwadi
//
//  Created by MacBookPro on 1/10/22.
//

import UIKit

class notifications: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    @IBOutlet weak var tableview:UITableView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var arr = [locationNotify]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "AlwadiColor")
        tableview.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableview.delegate = self
        tableview.dataSource = self
        ServicesByType()
    }
    

    
    
    
    func ServicesByType(){
        self.StartLoadding()

        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/notifications.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        //        urlRequest.httpMethod = "POST"
        //        let postString = "\()"
        //
        //        //        print(postString,"mmmm")
        //        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                //                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    let loc = locationNotify(
                        image: teamName["image"] as! String,
                        date_time: teamName["date_time"] as! String,
                        desc1: teamName["desc1"] as! String,
                        desc2: teamName["desc2"] as! String
                    )
                    self.arr.append(loc)
                }
//                print(self.arr)

                DispatchQueue.main.async {
                    self.tableview.reloadData()
                    self.StopLoadding()


                }
            }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arr.count)
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell") as? NotifyCustomtTableViewCell else {
            return UITableViewCell()
            
        }
//        cell.date_timelable.text = arr[indexPath.row].date_time
        cell.desclable.text = arr[indexPath.row].desc1
//        cell.desctwolable.text = arr[indexPath.row].desc2
        
        cell.layer.cornerRadius = 10.0
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.imgview?.image = .init(named: "logo_ionic")
        
        
        if let imageURL = URL(string: arr[indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        cell.imgview.image=image
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "NotifyDetails") as? NotifyDetails {

            //       https://www.youtube.com/watch?v=Xk2JVTIQGkk
            vc.get_desclbl = arr[indexPath.row].desc1
            vc.get_desctwolbl = arr[indexPath.row].desc2
            vc.get_date_timelbl = arr[indexPath.row].date_time
            vc.get_img_view = arr[indexPath.row].image
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    func StopLoadding() {
        spinner.stopAnimating()
    }
    
}
