//
//  HomeTableViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 12/2/21.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    
    
    
    
    
    let titletems = [
        "العيادة الجلدية"
        ,
        "العيادة الهضمية"
        ,
        "أمراض الغدد والداء السكري"
        ,
        "الأمراض الصدرية والتنفسية"
        ,
        "عيادة أمراض القلب والأوعية"
        ,
        "عيادة الجراحة التجميلية"
        ,
        "العيادة الداخلية"
        ,
        "عيادة الأمراض البولية والتناسلية ومعالجة العقم"
        ,
        "عيادة الجراحة العامة"
        ,
        "عيادة العلاج الفيزيائي"
        ,
        "عيادة التغذية"
        ,
        "عيادة الأشعة ( ايكو - أشعة بسيطة - بانوراما )"
        ,
        "عيادة النسائية"
        ,
        "عيادة العظمية"
        ,
        "عيادة الأطفال"
        ,
        "عيادة الجراحة العصبية"
        ,
        "طب عام اسعاف"
        ,
        "عيادة جراحة الأوعية الدموية"
        ,
        "عيادة أمراض الأذن والأنف والحنجرة"
        ,
        "الكلية"
        
    ]
    var imgArrayA = [
        UIImage(named: "img_1"), UIImage(named: "img_2")
        ,UIImage(named: "img_3"), UIImage(named: "img_4")
        ,UIImage(named: "img_5"), UIImage(named: "img_6")
        ,UIImage(named: "img_7"), UIImage(named: "img_8")
        
        ,UIImage(named: "img_9"), UIImage(named: "img_10")
        ,UIImage(named: "img_11"), UIImage(named: "img_12")
        ,UIImage(named: "img_13"), UIImage(named: "img_14")
        
        ,UIImage(named: "img_15"), UIImage(named: "img_16")
        ,UIImage(named: "img_17"), UIImage(named: "img_18")
        
        ,UIImage(named: "img_19"), UIImage(named: "img_20")
        
        
    ]
    
    
    @IBOutlet weak var tableview:UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("nnnnn")
        tableview.setContentOffset(.zero, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print(titletems.count)
        return titletems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCustomTable

        let row = indexPath.row
        cell.nemelable.text = titletems[indexPath.row]
        cell.imgview.image = imgArrayA[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

        
        //        dermatophytes
        //        digestive
        //        glands_diabetes
        //        thoracic_respiratory
        //        cardiovascular
        //        plastic_surgery
        //        inpatient
        //        other
        
        
        //        tabBarController?.selectedIndex = 1
        
        if indexPath.row == 0 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "dermatophytes"
            //                print("Global variable:\(string)")
            tabBarController?.selectedIndex = 1
            tableview.setContentOffset(.zero, animated: true)

            //                vc.get_name = "dermatophytes"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
        }else if indexPath.row == 1 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "digestive"
            //               print("Global variable:\(string)")
            tabBarController?.selectedIndex = 1
            tableview.setContentOffset(.zero, animated: true)

            //                vc.get_name = "digestive"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            
            //            }
            
        }else if indexPath.row == 2 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "glands_diabetes"
            //               print("Global variable:\(string)")
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "glands_diabetes"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
            
        }else if indexPath.row == 3 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "thoracic_respiratory"
            //               print("Global variable:\(string)")
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "thoracic_respiratory"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
            
        }else if indexPath.row == 4 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "cardiovascular"
            
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "cardiovascular"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
            
        }else if indexPath.row == 5 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "plastic_surgery"
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "plastic_surgery"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
            
        }else if indexPath.row == 6 {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "inpatient"
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "inpatient"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
            //            }
        }else {
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Services") as? Services {
            SelectedServices.GlobalVariable =  "other"
            tabBarController?.selectedIndex = 1
            //                vc.get_name = "other"
            //                print(vc.get_name)
            //                print(titletems[indexPath.row])
            //                self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}
//}
