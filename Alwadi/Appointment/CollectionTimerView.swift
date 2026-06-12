//
//  CollectionTimerView.swift
//  Alwadi
//
//  Created by MacBookPro on 12/10/21.
//

import UIKit

class CollectionTimerView: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //    let URL_SAVE_TEAM = "https://kalansarigroup.com/ALWADI_2021/iphone/regist_date_time.php"
    //    let URL_GETDATE = "https://kalansarigroup.com/ALWADI_2021/iphone/get_time_by_date.php"
    
    @IBOutlet weak var viewww_date: GradientViewToTimerView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var get_name_service = ""
    var get_name_doctor = ""
    var date = ""
    var get_name_time = ""
    
    var m = 0
    let x = 9        //ساعات العمل
    let y = 10      //بدء العمل
    var q = ""
    var k = ":"
    var s : String?
    var appoint : String?
    
    var funcboll : DarwinBoolean = false
    var labeA : Array<Any> = []
    @IBOutlet weak var lbl2: UILabel!
    var arr = [locationtimer]()
    
    var mTime = ""
    var doctor = ""
//    @IBOutlet weak var spinning_Loading_view : SpinnerView!
    
    class CTest
    {
        var q : String = ""
    }
    let newTime = CTest()
    
    var check : DarwinBoolean  = false
    @IBOutlet weak var num_date : UILabel!
    let refreshAlert = UIAlertController(title: "", message: "يجب ادخال الاسم والايميل", preferredStyle: UIAlertController.Style.alert)
    @IBOutlet weak var collectionViewA: UICollectionView!
    
    var Time_Work_Resualt = 0;
    var ArrTimeSend : Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        spinner.hidesWhenStopped = true
//        spinning_Loading_view.isHidden = true
        num_date.text = date
        
        doctor = get_name_doctor
                print(doctor,"CollectionTimerView")
        GetDate()
    }
    
    func StopLoadding() {
        spinner.stopAnimating()
        
    }
    func StartLoadding() {
        spinner.hidesWhenStopped=true
        spinner.startAnimating()
    }
    
    func Fill_Time(){
        for i in (0..<x) {
            m = i + y
            if (m > 12) {
                m = m - 12;
            }
            for l in (0..<3) {
                s = "\(m)\(k)\(l * 20)"
                if (l == 0) {
                    s = s! + "0"
                }
                for o in self.arr {
                    if o.time == s  {
                        check = true
                        //                        print(check)
                        //                        print(o.time)
                    }
                }
                if check != true {
                    labeA.append(s!)
                }
                check = false
            }
        }
        self.StopLoadding()
    }
    
    
    
    func GetDate(){
        self.StartLoadding()
        
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/get_time_by_date.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        urlRequest.httpMethod = "POST"
        let postString = "date=\(date)/&doctor=\(doctor)"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    let loc = locationtimer(
                        time: teamName["time"] as! String
                    )
                                        print(loc.time)
                    self.arr.append(loc)
                }
                DispatchQueue.main.async {
                    self.collectionViewA.reloadData()
                    self.Fill_Time()
                }
            }
            
        }
        task.resume()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        https://stackoverflow.com/questions/49573790/how-to-show-two-columns-in-a-collectionview-using-swift4-in-all-devices
        //        https://stackoverflow.com/questions/38394810/display-just-two-columns-with-multiple-rows-in-a-collectionview-using-storyboar
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 3 - lay.minimumInteritemSpacing
        //                return CGSize(width:widthPerItem, height:90)
        
        return CGSize(width:widthPerItem, height: 70)
        
        //    بيطلعو بس ٢
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewA {
            print(labeA)
            return labeA.count
            print("WWWWWW")
            
        }
        return labeA.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionDoctor
        if collectionView == self.collectionViewA {
            print(indexPath)
            cellA.labAAA.text = labeA[indexPath.row] as! String
            //            cellA.labAAA.text = s![indexPath.row]
            print("RRRRRRRR")
            return cellA
        }
        return cellA
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath) {
        //        get_time_by_date( code : num_date.text as! String)
        //        Save_Appointment( time : labeA[indexPath.row] as! String)
        
        mTime = labeA[indexPath.row] as! String
//        spinning_Loading_view.isHidden = false
        StartLoadding()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.doInBackground(mTime : self.mTime)
        }
        print("MMMMMMMM")
        
    }
    @IBAction func GetDateandtime(tim : String) {
        //        print(tim)
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/get_date_and_time.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        urlRequest.httpMethod = "POST"
        //        print(date)
        
        let postString = "date=\(date)&time=\(time)&doctor=\(doctor)"
                print(postString)
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [self] data, response, error in
            //            print("222")
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                        print(responseJSON,"333")
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
                
                
                
                if (outPutArr.count == 0) {
                    self.ArrTimeSend.append(tim)
                    
                    print(self.ArrTimeSend, "111")
                }
                
            }
        }
        task.resume()
        
    }
    @IBAction func doInBackground(mTime : String){
        
        
        
        let firstInput_time : Int? = Int(get_name_time)
        //                var Time_result = 0
        //                Time_result = Time_Work_Resualt / firstInput_time!
        //                print(Time_result,"00")
        
        Time_Work_Resualt = firstInput_time! / 20
        //                Time_Work_Resualt = firstInput_time! / 10
        
        newTime.q  = self.mTime
        
        print(newTime.q,"11")
        print(self.mTime,"22")
        print(Time_Work_Resualt,"33")
        
        for i in 1 ... Time_Work_Resualt {
            
            
            print( newTime.q ,"mTime")
            self.GetDateandtime(tim: newTime.q)
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            //let date = dateFormatter.date (from: "11:55")
            let date = dateFormatter.date (from: mTime)
            
            let current_date_time = dateFormatter.string(from: date!)
            //            print("before add time-->",current_date_time)
            
            //adding 20 miniuts
            let addminutes = date!.addingTimeInterval(20*60)
            dateFormatter.dateFormat = "HH:mm"
            let sss  = dateFormatter.string(from: addminutes)
            
            newTime.q = sss
            print(newTime.q,"addminutes.q")
            
            
            //            let deadline = Date().advanced(by: 3)
            //            Thread.sleep(until: deadline)
            
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //
            //
            //            }
            //            sleep(2)  //This is in place of your time-consuming synchronous code.
            Thread.sleep(forTimeInterval: 3.0)
            
//            spinning_Loading_view.isHidden = true
            StopLoadding()
            
            print("done")
            
            
        }
        
        Show_Alert()
        
    }
    
    @IBAction func Show_Alert() {
        if self.ArrTimeSend.count == Time_Work_Resualt {
            
            
            print(Time_Work_Resualt,"Time_Work_Resualt")
            print(self.ArrTimeSend.count,"self.ArrTimeSend.count")
            
            var refreshAlert =
                UIAlertController(title: "", message: "هل أنت متأكد من حجز الموعد الساعة \(self.ArrTimeSend)", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.view.tintColor  = UIColor.init(named: "AlwadiColor")
            
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
                self.Save_Appointment()
                self.StartLoadding()
                DispatchQueue.main.async  {
                    var refreshAlert = UIAlertController(title: "", message: "تم حجز الموعد", preferredStyle: UIAlertController.Style.alert)
                    self.showSecondViewController()
                }
                
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(refreshAlert, animated: true, completion: nil)
            
            
        }else{
            //                    no net
            let alert = UIAlertController(title: "", message: "لا يمكنك حجز الموعد", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            refreshAlert.view.tintColor  = UIColor.init(named: "AlwadiColor")
            
            print("NOOooooO")
        }
    }
    @IBAction func Save_Appointment() {
        print(newTime.q)
        print(date)
        print(self.ArrTimeSend.count,"self.ArrTimeSend.count")
        
        for i in 1 ... self.ArrTimeSend.count {
            print(self.ArrTimeSend[i-1],"00000")
            let customer_email = "mmmmm"
            
            let  name_service =  get_name_service
            let name_doctor = get_name_doctor
            
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/regist_date_time.php")! as URL)
            
            //        https://stackoverflow.com/questions/37400639/post-data-to-a-php-method-from-swift
            request.httpMethod = "POST"
            
            let postString = "a=\(date)&s=\(self.ArrTimeSend[i-1])&n=\(customer_email)&service=\(name_service)&doctor=\(name_doctor)"
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                return
                
            }
            
            task.resume()
        }
    }
    
    
    
    @IBAction func showSecondViewController() {
        self.StopLoadding()
        //        self.showToast(message: "Your Toast Message", font: .systemFont(ofSize: 12.0))
        //        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "sss") as! MainViewController
        self.present(newViewController, animated: true, completion: nil)
        //        }
        
        
        
    }
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    
    func shwoAlertTime(){
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            self.funcboll = true
            print(self.funcboll)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction!) in
            self.funcboll = false
            print(self.funcboll)
            print("Handle noooo logic here")
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
