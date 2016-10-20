//
//  LoginViewController.swift
//  SportFit
//
//  Created by Anil Shukla on 9/23/16.
//
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: BaseViewController {
  
  
  @IBOutlet weak var txtUserName: UITextField!
  
  
  @IBOutlet weak var txtPassword: UITextField!
  
  
  @IBAction func btnForgotPassword(sender: AnyObject) {
    
  }
  
  
  
  @IBAction func btnSignup(sender: AnyObject) {
    
  }
  
  
  
// MARK: controller lyfe cycle
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLeftImageOnNavigationBar()
        setUpRightImageOnNavigationBar()
        // Do any additional setup after loading the view.
      
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
      NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.navigationBarHidden = true
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  // MARK: - Keyboard Delegate Method
  
  /*****************************************************************************************
   <Name>  - func keyboardWillShow(notification: NSNotification)
   <Purpose>Keyboard will show and Hide</Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
  func keyboardWillShow(notification: NSNotification) {
    
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
      if view.frame.origin.y == 0{
        self.view.frame.origin.y -= keyboardSize.height - 100.0
      }
      else {
        
      }
    }
    
  }
  
  // MARK: - Web Api calling
  /*****************************************************************************************
   <Name>  - keyboardWillHide(notification: NSNotification)
   <Purpose>Web Api calling</Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
  func keyboardWillHide(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
      if view.frame.origin.y != 0 {
        self.view.frame.origin.y += keyboardSize.height - 100.0
      }
      else {
        
      }
    }
  }
  
  // MARK: - User define methods
  /*****************************************************************************************
   <Name>  - func loginActionBttonTapped(sender: AnyObject)
   <Purpose>Keyboard will show and Hide</Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
    @IBAction func loginActionBttonTapped(sender: AnyObject) {
      
      self.view.endEditing(true)
      
      
      if txtUserName.text == ""
      {
        
        dispatch_async(dispatch_get_main_queue(), {
          SwiftLoader.hide()
          self.showTheAlertViewWith(NSLocalizedString("Error", comment: ""), withMessage: NSLocalizedString("EnterEmail", comment: ""))
        })
        
      }
      else if  txtPassword.text == ""
      {
        
        dispatch_async(dispatch_get_main_queue(), {
          SwiftLoader.hide()
          self.showTheAlertViewWith(NSLocalizedString("Error", comment: ""), withMessage: NSLocalizedString("EnterPassword", comment: ""))
        })
        
      }
      else
      {
        
        var dict = [String:AnyObject]()
        dict["email"] = "vipul.sharda00087@gmail.com"
        dict["password"] = "123456"
        
        webServiceCalling(kUrlKey_Login, withParameters:dict)
        
        
      }
      
    }
  
  
  func webServiceCalling(urlType:String, withParameters param:[String:AnyObject]){
    let finalUrl = "\(kBaseUrl)\(urlType)"
    Alamofire.request(.POST, finalUrl, parameters:param)
      .response { request, response, data, error in
        print(request)
        print(response)
        print(error)
        let json = JSON(data: data!)
        print(json)
        if  json["status_code"].intValue == 200{
          self.performSegueWithIdentifier(kSegue_HomeView, sender: self)
        }
    }
  }
  
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
