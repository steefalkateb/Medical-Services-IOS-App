//
//  Services.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class Services: UIViewController , UIScrollViewDelegate,UITableViewDataSource ,UITableViewDelegate{
    
    //    start rtl //https://stackoverflow.com/questions/33130331/uicollectionview-ios-9-issue-on-project-with-rtl-languages-support
    //    https://stackoverflow.com/questions/44095961/resizing-button-within-a-stackview
    //    https://newbedev.com/how-do-you-right-align-a-horizontal-uistackview
    //    https://www.youtube.com/watch?v=uIiA1hFf6sE
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scroll_View_Services: UIScrollView!

    @IBOutlet weak var tableview:UITableView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var namelbl: UILabel!
    
    var get_name = ""
    
    
    //    var arr = [locationServices]()
    var arr = [locationServices]()
    private var workItem: DispatchWorkItem? // Create a private DispatchWorkItem property
    
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
        HamburgerMenu().triggerSideMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableview.delegate = self
        tableview.dataSource = self
        
        
        scrollView.delegate = self
        self.scrollView.transform = CGAffineTransform(scaleX:-1,y: 1);
        
//                self.scrollView.translatesAutoresizingMaskIntoConstraints = true
//
//                self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width,
//                                                     height: 60.0 + 5 * (self.scrollView.frame.width / 16.0 * 5.0));
//
        
//        UIView.animate(withDuration: 0.2) {
//           self.scroll.setContentOffset(.zero, animated: false)
//        }
        
//        UIView.animate(withDuration: 0.1) {
//            self.scrollView.setContentOffset(CGPoint(x: 1900, y: 0), animated: true)
//            self.view.layoutIfNeeded()
//        }

   
        



        btn.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn2.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn3.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn4.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn5.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn6.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn7.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn8.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        btn.layer.cornerRadius = 12;
        btn.widthAnchor.constraint(equalToConstant: 110).isActive = true
        btn2.layer.cornerRadius = 12;
        btn2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        btn3.layer.cornerRadius = 12;
        btn3.widthAnchor.constraint(equalToConstant: 170).isActive = true
        btn4.layer.cornerRadius = 12;
        btn4.widthAnchor.constraint(equalToConstant: 170).isActive = true
        btn5.layer.cornerRadius = 12;
        btn5.widthAnchor.constraint(equalToConstant: 140).isActive = true
        btn6.layer.cornerRadius = 12;
        btn6.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn7.layer.cornerRadius = 12;
        btn7.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn8.layer.cornerRadius = 12;
        btn8.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear")
        print("Global variable111:\(SelectedServices.GlobalVariable)")
        self.StartLoadding()


        if SelectedServices.GlobalVariable == "dermatophytes" {
            print("STEEEEEEF111111111")
            print("Global variable:\(SelectedServices.GlobalVariable)")
            self.ServicesByType(mytype:"dermatophytes")
            self.unselect_btn()
            btn.isSelected = true
        }else if SelectedServices.GlobalVariable == "digestive" {
            print("222222222")
            self.ServicesByType(mytype:"digestive")
            self.unselect_btn()
            btn2.isSelected = true
        }else if SelectedServices.GlobalVariable == "glands_diabetes" {
            print("333333")
            self.ServicesByType(mytype:"glands_diabetes")
            self.unselect_btn()
            btn3.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 190
            
            //        https://stackoverflow.com/questions/54235317/uitableview-contentinset-and-contentoffset
            //                    scrollView.contentOffset.x = -900
            //                    scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else if SelectedServices.GlobalVariable == "thoracic_respiratory" {
            print("444444")
            self.ServicesByType(mytype:"thoracic_respiratory")
            self.unselect_btn()
            btn4.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 240
            
        }else if SelectedServices.GlobalVariable == "cardiovascular" {
            print("555555")
            self.ServicesByType(mytype:"cardiovascular")
            self.unselect_btn()
            btn5.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 350

        }else if SelectedServices.GlobalVariable == "plastic_surgery" {
            print("6666666")
            self.ServicesByType(mytype:"plastic_surgery")
            self.unselect_btn()
            btn6.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 450
            
        }else if SelectedServices.GlobalVariable == "inpatient" {
            print("777777")
            self.ServicesByType(mytype:"inpatient")
            self.unselect_btn()
            btn7.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 580
        }
        else if SelectedServices.GlobalVariable == "other" {
            print("888888")
            self.ServicesByType(mytype:"other")
            self.unselect_btn()
            btn8.isSelected = true
            
            view.layoutIfNeeded()
            self.scrollView.contentOffset.x = 660
            
        }else{
            self.ServicesByType(mytype:"dermatophytes")
            self.unselect_btn()
            btn.isSelected = true
        }

    }


   func unselect_btn(){
        btn.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
        btn5.isSelected = false
        btn6.isSelected = false
        btn7.isSelected = false
        btn8.isSelected = false
    }

    func ServicesByType(mytype:String){
        
        self.arr.removeAll()
        self.tableview.reloadData()
        print(mytype)
        
        let URLWebSite = URL(string: "https://kalansarigroup.com/ALWADI_2021/iphone/services.php")!
        var urlRequest = URLRequest(url: URLWebSite)
        
        urlRequest.httpMethod = "POST"
        let postString = "type=\(mytype)"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            
            if let outPutArr  = responseJSON?["result"] as? NSArray {
//                                print(outPutArr)
                for i in 0 ..< outPutArr.count{
                    let teamName:AnyObject = outPutArr[i] as AnyObject
                    
                    let loc = locationServices(
                        
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
  
    @IBAction func keyPressed(_ sender:UIButton){
        self.StartLoadding()
        //        print(sender.currentTitle!)
        btn.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
        btn5.isSelected = false
        btn6.isSelected = false
        btn7.isSelected = false
        btn8.isSelected = false
        //        sender.layer.backgroundColor = #colorLiteral(red: 0.6267678738, green: 0.2843194604, blue: 0.541264534, alpha: 1)
        //        sender.setTitleColor(#colorLiteral(red: 0.948936522, green: 0.9490728974, blue: 0.9489069581, alpha: 1), for: .normal)
        
        sender.isSelected = true
        if sender.currentTitle == "الجلدية والتجميل" {
            self.ServicesByType(mytype:"dermatophytes")
            print("derma")

        }else if sender.currentTitle == "الهضمية" {
            self.ServicesByType(mytype:"digestive")


            
        }else if sender.currentTitle == "أمراض الغدد والداء السكري"{
            self.ServicesByType(mytype:"glands_diabetes")
            
        }else if sender.currentTitle == "الأمراض الصدرية والتنفسية"{
            self.ServicesByType(mytype:"thoracic_respiratory")
            
        }else if sender.currentTitle == "أمراض القلب والأوعية"{
            self.ServicesByType(mytype:"cardiovascular")
            
        }else if sender.currentTitle == "الجراحة التجميلية"{
            self.ServicesByType(mytype:"plastic_surgery")
            
        }else if sender.currentTitle == "العيادة الداخلية"{
            self.ServicesByType(mytype:"inpatient")
            
        }else if sender.currentTitle == "عيادات أخرى"{
            self.ServicesByType(mytype:"other")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print(arr.count)
        print("MMMMMOOOOO")

        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "BasicCell") as? customtTableViewCellServices else {
            //reload to scrollview & tableview

            tableview.reloadData()
            tableview.layoutIfNeeded()
            tableview.setContentOffset(.zero, animated: true)

            return UITableViewCell()
            
        }
        
        cell.namelable.text = arr[indexPath.row].name
        
        
        //        cell.desclable.text = arr[indexPath.row].desc1
        //        cell.desctwo.text = arr[indexPath.row].desc2
        //        cell.specialtylable.text = arr[indexPath.row].specialty
        cell.layer.cornerRadius = 10.0
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.imgview?.image = .init(named: "logo_ionic")
        
        self.StopLoadding()
        
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
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ServiceDetails") as? ServiceDetails {
            
//            print("QQQQQQ",arr[indexPath.row])
//            locationServices(name: "استئصال بوليبات صغيرة ", image: "https://kalansarigroup.com/ALWADI_2021/digestive_clinic/digestive_img_1.jpg", desc1: "", desc2: "تَنشَأ البوليبات (الزوائد اللحمية) الرحمية في عنق الرحم (البوليبات العنقية) أو في بطانة تجويف الرحم (البوليبات البطانية). تُعتَبَر البوليبات الرحمية شائعة نسبياً وعادةً ما تكون حميدة ولا تَتَرافق بأعراض غالباً.", time: "20", price: "10000")
            //                   https://www.youtube.com/watch?v=Xk2JVTIQGkk
            vc.get_name = arr[indexPath.row].name
            vc.get_img_view = arr[indexPath.row].image
            vc.get_desc = arr[indexPath.row].desc1
            vc.get_desc2 = arr[indexPath.row].desc2
            
            
            vc.get_time = arr[indexPath.row].time
            vc.get_price = arr[indexPath.row].price
            
            print(vc.get_name,"kkkkk")
            
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
    
    //        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //           let lastSectionIndex = tableView.numberOfSections - 2
    //           let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 2
    //           if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
    //              // print("this is the last cell")
    //            let spinner = UIActivityIndicatorView(style: .gray)
    //               spinner.startAnimating()
    //               spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
    //    //
    //
    //
    //
    //               self.tableview.tableFooterView = spinner
    //    //        spinner.center = tableview.center;
    //            self.tableview.tableFooterView?.isHidden = false
    //           }
    //       }
}


