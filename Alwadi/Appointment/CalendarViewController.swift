//
//  CalendarViewController.swift
//  Alwadi
//
//  Created by MacBookPro on 12/10/21.
//

import UIKit

class CalendarViewController: UIViewController {
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var get_name_service = ""
    var get_name_doctor = ""
    var get_name_time = ""
    
    let refreshAlert = UIAlertController(title: "", message:"اليوم عطلة", preferredStyle: UIAlertController.Style.alert)
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datepic()
//        dateSelected()
//        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(get_name_doctor)
        

    }
    
    func  shwoAlertTime(){
        //                  refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
        //                        print("Handle Ok logic here")
        //                  }))
        
        refreshAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action: UIAlertAction!) in
            //            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func datepic() {
        datePicker.locale = .current
        datePicker.date = Date()
        
        datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        datePicker.minimumDate =  Date()
        //        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        datePicker.maximumDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())

        datePicker.preferredDatePickerStyle = .inline
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.tintColor = UIColor.init(named: "AlwadiColor")
        
        

       
    }
    @objc
    func dateSelected(){
        datePicker.tintColor = .systemPink
        datePicker.tintColor = UIColor.init(named: "AlwadiColor")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        //        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "cccc"
        //        dateFormatter.dateFormat =  "yyyy-MM-dd"
        
        let date = dateFormatter.string(from: datePicker.date)
        //        print( Calendar.current.component(.month, from: Date()) )
        lblDate.text = date
        //        print(date)s
        presentedViewController?.dismiss(animated: true, completion: nil)
        if date == "Sunday" {
            shwoAlertTime()
            datePicker.setValue(UIColor.blue, forKeyPath: "textColor")
            
        }else{
            if let vc = storyboard?.instantiateViewController(withIdentifier: "CollectionTimerView") as? CollectionTimerView {
                dateFormatter.dateFormat =  "yyyy-MM-dd"
                let date = dateFormatter.string(from: datePicker.date)
                vc.get_name_service = get_name_service
                vc.get_name_doctor = get_name_doctor
                vc.get_name_time = get_name_time
                
                vc.date = date
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    
}

