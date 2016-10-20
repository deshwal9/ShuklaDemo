//
//  AlertExtension.swift
//  VGM-EEC
//
//  Created by Chetu-mac-Mini25 on 8/31/16.
//  Copyright © 2016 VGM Forbin. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
  
  /*****************************************************************************************
   <Name>  -  func showTheAlertViewWith(title:String, withMessage message:String)
   <Purpose>Show alert </Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
func showTheAlertViewWith(title:String, withMessage message:String){
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(defaultAction)
    self.presentViewController(alertController, animated: true, completion: nil)
}
}