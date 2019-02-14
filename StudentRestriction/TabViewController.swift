
//
//  TabViewController.swift
//  Student Web
//
//  Created by 김준우 on 2016. 3. 15..
//  Copyright © 2016년 김준우. All rights reserved.
//

import UIKit

class tabs: UITableViewController {
    
    @IBOutlet var URLLabel: UILabel!
    
    @IBOutlet var URLTab1Title: UILabel!
    @IBOutlet var URLLabel2: UILabel!
    
    @IBOutlet var URLTab2Title: UILabel!
    @IBOutlet var URLLabel3: UILabel!
    
    @IBOutlet var URLTab3Title: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor.black
        let defaults: UserDefaults = UserDefaults.standard
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        URLLabel.text = defaults.object(forKey: "URLTab1") as? String
        
        URLTab1Title.text = defaults.object(forKey: "URLTitleTab1") as? String
        URLLabel2.text = defaults.object(forKey: "URLTab2") as? String
        
        URLTab2Title.text = defaults.object(forKey: "URLTitleTab2") as? String
        
        URLLabel3.text = defaults.object(forKey: "URLTab3") as? String
        
        URLTab3Title.text = defaults.object(forKey: "URLTitleTab3") as? String
UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)

         NotificationCenter.default.addObserver(self, selector: "copyURL", name: NSNotification.Name(rawValue: "grabURL"), object: nil)
        NotificationCenter.default.addObserver(self, selector: "copyURL2", name: NSNotification.Name(rawValue: "grabURL2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: "copyURL3", name: NSNotification.Name(rawValue: "grabURL3"), object: nil)

    }
    
    @IBAction func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
    }
    

    func copyURL(){
        let defaults: UserDefaults = UserDefaults.standard
        print("gotnotification")
        URLLabel.text = defaults.object(forKey: "URLTab1") as? String
        URLTab1Title.text = defaults.object(forKey: "URLTitleTab1") as? String

    }
    func copyURL2(){
        let defaults: UserDefaults = UserDefaults.standard
        print("gotnotification2")
        URLLabel2.text = defaults.object(forKey: "URLTab2") as? String
        URLTab2Title.text = defaults.object(forKey: "URLTitleTab2") as? String
        
    }
    func copyURL3(){
        let defaults: UserDefaults = UserDefaults.standard
        print("gotnotification3")
        URLLabel2.text = defaults.object(forKey: "URLTab3") as? String
        URLTab2Title.text = defaults.object(forKey: "URLTitleTab3") as? String
        
    }

    
}
