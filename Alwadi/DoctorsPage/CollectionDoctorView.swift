//
//  CollectionDoctorView.swift
//  Alwadi
//
//  Created by MacBookPro on 11/28/21.
//

import UIKit

class CollectionDoctorView: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //   https://www.youtube.com/watch?v=tqhDfqHsLWs {
    var imgArrayA = [UIImage(named: "heart"), UIImage(named: "digestive_doc")
                     , UIImage(named: "dermatology_doc"), UIImage(named: "plasticsurgery_doc")
                     , UIImage(named: "generalsurgery_doc"), UIImage(named: "urologist_doc")
                     , UIImage(named: "nutrition_doc"), UIImage(named: "kidney_doc")
                     , UIImage(named: "endocrinologist_doc"), UIImage(named: "gynecologist_doc")
                     , UIImage(named: "pediatrician_doc"), UIImage(named: "pediatrician_docc")
                     , UIImage(named: "thephysical_treatment_doc"), UIImage(named: "interior_doc")
                     , UIImage(named: "nose_doc"), UIImage(named: "angiologist_doc")
                     , UIImage(named: "radiology_doc"), UIImage(named: "osteophytes_doc")
                     , UIImage(named: "chest_doc"), UIImage(named: "chronic_pain_doc")
                     , UIImage(named: "anesthetization_doc")
    ]
    
    //        var labeA =  ["ثطوفaaaaa","حبيبي","عمري","حياتشي","تؤبزني"," تيزو"]
    var labeA =  ["القلبية","الهضمية","الجلدية والتجميل","الجراحة التجميلية","الجراحة العامة","البولية","التغذية","الكلية","الغدد","النسائية","الأطفال","الجراحة العصبية","العلاج الفيزيائي","الداخلية","انف اذن حنجرة","الأوعية","الأشعة","العظمية","الصدرية والتنفسية","الألم المزمن","التخدير والانعاش"]
    
    @IBOutlet weak var collectionViewA: UICollectionView!
    
    @IBAction func hamburgerBtnAction(_ sender: UIBarButtonItem) {
        HamburgerMenu().triggerSideMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ddddoctor")
        collectionViewA.reloadData()
        collectionViewA.layoutIfNeeded()
//        collectionViewA.selectItem(at: 0, animated: true, scrollPosition: .right)
        collectionViewA.contentOffset.y = 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        https://stackoverflow.com/questions/49573790/how-to-show-two-columns-in-a-collectionview-using-swift4-in-all-devices
        //        https://stackoverflow.com/questions/38394810/display-just-two-columns-with-multiple-rows-in-a-collectionview-using-storyboar
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        //                return CGSize(width:widthPerItem, height:90)
        return CGSize(width:widthPerItem, height: 80)
        //    بيطلعو بس ٢
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewA {
            return imgArrayA.count
        }
        return imgArrayA.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        print("sss")

        //        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionDoctor", for:indexPath) as! CollectionDoctor
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionDoctor
        if collectionView == self.collectionViewA {
            cellA.imgAAA.image = imgArrayA[indexPath.row]
            cellA.labAAA.text = labeA[indexPath.row]
            //            cellA.backgroundColor = .red
            //            cellA.labAAA.textColor = .white
            //            cellA.labAAA.lineBreakMode = .byWordWrapping
            //            cellA.labAAA.numberOfLines = 0
            return cellA
        }
        
        
        
        
        return cellA
    }
    
    func collectionView(_ collectionView: UICollectionView,didSelectItemAt indexPath: IndexPath) {
                print("You selected cell #\(indexPath.item)!")
        
        
        //        let select2VC = UIViewController()
        //         navigationController?.navigationBar.tintColor = UIColor.white
        //         navigationController?.pushViewController(select2VC, animated: true)
        //
        //        print("selcected")
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorsBySpecialt") as? DoctorsBySpecialt {
            vc.specialty = labeA[indexPath.row]
            print("111", vc.specialty)
            self.navigationController?.pushViewController(vc, animated: true)
            //        }
        }
    }
    
    // change background color when user touches cell
    //    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.backgroundColor = UIColor.red
    //    }
    
    // change background color back when user releases touch
    //    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.backgroundColor = UIColor.gray
    //    }
    
}

