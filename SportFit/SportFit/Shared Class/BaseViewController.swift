//
//  BaseViewController.swift
//  SportFit
//
//  Created by pragya on 20/09/16.
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let navigationBar = self.navigationController?.navigationBar
      navigationBar?.hidden = false
      navigationBar?.translucent = false
      navigationBar?.barStyle = UIBarStyle.Default
      navigationBar?.barTintColor = UIColor.blackColor()
      navigationBar?.tintColor = UIColor.whiteColor()
      navigationBar?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
      UIApplication.sharedApplication().statusBarHidden = false
      UIApplication.sharedApplication().statusBarStyle = .LightContent
     // SFUIDisplay-Semibold
      self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName :UIFont(name: "HelveticaNeue", size: 22)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  // MARK:- methods to modify navigation bar
  // method to add logo on left
  func setUpLeftImageOnNavigationBar(){
    let image = UIImage(named: "To Bar Ath link")
    let imageview:UIImageView = UIImageView.init(frame: kFrame_BarlogoIconSize)
    imageview.image = image
    let logoButton = UIBarButtonItem.init(customView: imageview)
   // ImageButton.tintColor = UIColor.clearColor()
    self.navigationItem.leftBarButtonItem = logoButton
  }
    func setUpRightImageOnNavigationBar(){
        let image = UIImage(named: "To Bar Ath link")
        let imageview:UIImageView = UIImageView.init(frame: kFrame_BarlogoIconSize)
        imageview.image = image
        let logoButton = UIBarButtonItem.init(customView: imageview)
        // ImageButton.tintColor = UIColor.clearColor()
        self.navigationItem.rightBarButtonItem = logoButton
    }
 
}
extension UIBarButtonItem {
  class func itemWith(colorfulImage: UIImage?, target: AnyObject, action: Selector) -> UIBarButtonItem {
    let button = UIButton(type: .Custom)
    button.setImage(colorfulImage, forState: .Normal)
    button.frame = CGRectMake(0, 0, 44.0, 44.0)
    button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    
    let barButtonItem = UIBarButtonItem(customView: button)
    return barButtonItem
  }
}
