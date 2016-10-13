//
//  PageMenuViewController.swift
//  VGM-EEC
//
//  Created by Chetu-mac-Mini25 on 9/7/16.

//

import UIKit

class PageMenuViewController: BaseViewController {
  
  var pageMenu : CAPSPageMenu?
  
  // MARK: - Class Delegate Method
  
  /*****************************************************************************************
   <Name>  - func viewDidLoad()
   <Purpose>Class Delegate Method</Purpose>
   <History>
   <Header> Version 1.3 </Header>
   </History>
   *****************************************************************************************/
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.addSlideMenuButton()
    
    
    // self.title = "ATTENDEE AGENDA"
    
    let button = UIButton(type: .System)
    
    button.setTitle("Today", forState: UIControlState.Normal)
    button.frame = CGRectMake(0, 0, 200, 50)
    //button.backgroundColor = UIColor.redColor()
    button.titleEdgeInsets.right = -7
    
    button.titleLabel!.font = UIFont.boldSystemFontOfSize(16.0)
    
//    button.setImage(UIImage(named: "Attendee-Agenda-Icon"), forState: .Normal)
    button.sizeToFit()
    button.tintColor = UIColor.whiteColor()
    let customBarItem = UIBarButtonItem(customView: button)
    
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    navigationController!.navigationBar.barTintColor = UIColor.grayColor()
    let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
    // Initialize view controllers to display and place in array
    
    var controllerArray : [UIViewController] = []
    
    
    let storyboardName: String = "Main"
    let storyboard = UIStoryboard(name:storyboardName, bundle: nil)
    let controller1  = storyboard.instantiateViewControllerWithIdentifier("Today'sWorkout")
    controller1.title = "Circuit 1"
    controllerArray.append(controller1)
    let controller2  = storyboard.instantiateViewControllerWithIdentifier("Today'sWorkout")
    controller2.title = "Circuit 2"
    controllerArray.append(controller2)
    
    let controller3 = storyboard.instantiateViewControllerWithIdentifier("Today'sWorkout")
    controller3.title = "Circuit 3"
    controllerArray.append(controller3)
    
    // Customize menu (Optional)
    let parameters: [CAPSPageMenuOption] = [
      .ScrollMenuBackgroundColor(UIColor.grayColor()),
      .ViewBackgroundColor(UIColor.lightGrayColor()),
      .SelectedMenuItemLabelColor(UIColor.blueColor()),
      .UnselectedMenuItemLabelColor(UIColor.darkGrayColor()),
      .MenuItemFont(UIFont(name: "HelveticaNeue", size: 17.0)!),
      .MenuHeight(40.0),
      .MenuItemWidth(90.0),
      .CenterMenuItems(true)
    ]
    
    // Initialize scroll menu
    pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
    
    self.addChildViewController(pageMenu!)
    self.view.addSubview(pageMenu!.view)
    
    pageMenu!.didMoveToParentViewController(self)
    
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
