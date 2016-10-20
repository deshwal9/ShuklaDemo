//
//  activityIndicator.swift
//  VGM-EEC
//
//  Created by Chetu-mac-Mini25 on 8/31/16.
//  Copyright © 2016 VGM Forbin. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
  
  /*****************************************************************************************
   <Name>  - func actionShowLoader()
   <Purpose>Add action show loader </Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
  func actionShowLoader() {
    var config : SwiftLoader.Config = SwiftLoader.Config()
    config.size = 150
    config.backgroundColor = UIColor.whiteColor()
    config.spinnerColor = UIColor.redColor()
    config.titleTextColor = UIColor.blackColor()
    config.spinnerLineWidth = 3.0
    config.foregroundColor = UIColor.blackColor()
    config.foregroundAlpha = 0.5
    
    
    SwiftLoader.setConfig(config)
    SwiftLoader.show(true)
    
    
  }
  
  /*****************************************************************************************
   <Name>  -  func delay(seconds seconds: Double, completion:()->())
   <Purpose>Add delay in loader </Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
  
  func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
      completion()
    }
  }

}