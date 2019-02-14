//
//  Web.swift
//  StudentRestriction
//
//  Created by 김준우 on 2016. 3. 11..
//  Copyright © 2016년 김준우. All rights reserved.
//

import UIKit

import WebKit

class RestrictedWebApp: UIViewController, WKNavigationDelegate, UITextFieldDelegate {
    
    @IBOutlet var WebViewUIView: UIView!
    
    @IBOutlet var progress: UIProgressView!
    
    @IBOutlet var URL: UITextField!
    
    @IBOutlet var hiddenCounterbutton : UIBarButtonItem!

    var webView: WKWebView!
    
    var counter = 0
    
    var webDatas = ["tube","9gag","snapchat","osu","facebook","piratebay","messenger","twitter","tumblr","pinterest","googlereads","dailymotion","tv","google+","plus.google","instagram","wechat","weibo","flickr","comic.naver","roblox","valve","steam","bandicam","fox","betheseda","lego","alibaba","aliexpress","xxx","porn","sex","vessel","kappa","torrent","simpson","imgur","shit","fuck","proxy","manga","twitch","anime"]

    
    required init?(coder aDecoder: NSCoder) {
        self.webView = WKWebView(frame: CGRect.zero)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    let defaults: UserDefaults = UserDefaults.standard
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(webView, belowSubview: progress)
        
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
        
        let hiddencounter = UILongPressGestureRecognizer(target: hiddenCounterbutton, action: #selector(RestrictedWebApp.action))
        
        hiddencounter.minimumPressDuration = 2.0
        
        view.addGestureRecognizer(hiddencounter)
        
        if defaults.string(forKey: "URLTab1") == "https://www.google.com/" {
            
  
                
            }
            
        

        let url = NSURL(string: "\(defaults.object(forKey: "URLTab1") as! String)")!
        webView.load(NSURLRequest(url: url as URL) as URLRequest)
        webView.allowsBackForwardNavigationGestures = true
        self.navigationItem.title = "\(webView.url!)"
    }
 
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        print("\(counter)")
        
        let defaults: UserDefaults = UserDefaults.standard
        
        if counter == 0{
            
            let alertController = UIAlertController(title: nil, message: "\(defaults.object(forKey: "name") as! String) did not access to any inappropriate websites.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: nil, message: "\(defaults.object(forKey: "name") as! String) tried to access to inappropriate websites \(counter) times.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func handleGesture(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.began {
            print("\(counter)")
            
            let defaults: UserDefaults = UserDefaults.standard
            
            if counter == 0{
                
                let alertController = UIAlertController(title: nil, message: "\(defaults.object(forKey: "name") as! String) did not access to any inappropriate websites.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: nil, message: "\(defaults.object(forKey: "name") as! String) tried to access to inappropriate websites \(counter) times.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
    /*
    @IBAction func numberofTimesclicked() {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if counter == 0{
            
            let alertController = UIAlertController(title: nil, message: "\(defaults.objectForKey("name") as! String) did not access to any inappropriate websites.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            let alertController = UIAlertController(title: nil, message: "\(defaults.objectForKey("name") as! String) tried to access to inappropriate websites \(counter) times.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        }
    }

*/
    
    @IBAction func goGoogle()  {
        let url = NSURL(string: "https://www.google.com/")!
        webView.load(NSURLRequest(url: url as URL) as URLRequest)

    }

    func showAlertController(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.navigationItem.title = "\(webView.title!)"
        self.navigationController?.navigationItem.title = "\(webView.url!)"
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func webView(_ didCommitwebView: WKWebView, didCommit navigation: WKNavigation!) {
        

        for prohibitedWebs in webDatas {
            if ((self.navigationController?.navigationItem.title?.range(of: prohibitedWebs)) != nil)  {
                showAlertController(message: NSLocalizedString("NO_Access", comment: "You are not allowed to search or access this website. Focus on your work."))
                webView.goBack()
            }
            
        }

        self.navigationItem.title = "\(webView.title!)"
        self.navigationController?.navigationItem.title = "\(webView.url!)"

    }
    
    
    @IBAction func goback() {
    webView.goBack()

    }
    
    @IBAction func Refresh() {
        
        webView.reload()
        
        
    }
    
    @IBAction func anotherTab() {
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func goforward() {
        
        webView.goForward()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func share() {
        showAlertController(message: NSLocalizedString("COPIED", comment: "The website URL has been copied to the clipboard."))

        UIPasteboard.general.string = "\(webView.url!)"
    }


    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progress.setProgress(0.0, animated: false)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "grabURL"), object: self)
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set("\(webView.url!)", forKey: "URLTab1")
        defaults.set("\(webView.title!)", forKey: "URLTitleTab1")
        print("moved websites")
        defaults.synchronize()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.navigationItem.title = "\(webView.title!)"
    }
    
    
}





