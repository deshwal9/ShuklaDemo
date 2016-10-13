//
//  ViewController.swift
//  SportFit
//
//  Created by pragya on 20/09/16.
//
//

import UIKit
//import CAPSPageMenu

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //var pageMenu : CAPSPageMenu?
    var exerciseArr = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict1 = ["exercise":"Calf Stretch", "set":"2 sets @ 1Min", "number":"2", "timer":"00:00:00", "status":"completed"]
        let dict2 = ["exercise":"Hamstring Stretch", "set":"2 sets @ 1Min", "number":"2", "timer":"00:00:00", "status":"running"]
        let dict3 = ["exercise":"Quad Stretch", "set":"1 sets @ 1Min", "number":"1", "timer":"00:00:00", "status":"next"]
        exerciseArr = [dict1, dict2, dict3]
        // Do any additional setup after loading the view, typically from a nib.
        
//        // Optional delegate
//        pageMenu!.delegate = self
        
//        // Array to keep track of controllers in page menu
//        var controllerArray : [UIViewController] = []
//        
//        // Create variables for all view controllers you want to put in the
//        // page menu, initialize them, and add each to the controller array.
//        // (Can be any UIViewController subclass)
//        // Make sure the title property of all view controllers is set
//        // Example:
//        var controller : UIViewController = UIViewController(nibName: "controllerNibName", bundle: nil)
//        controller.title = "SAMPLE TITLE"
//        controllerArray.append(controller)
//        
//        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
//        // Example:
//        var parameters: [CAPSPageMenuOption] = [
//            .MenuItemSeparatorWidth(4.3),
//            .UseMenuLikeSegmentedControl(true),
//            .MenuItemSeparatorPercentageHeight(0.1)
//        ]
//        
//        // Initialize page menu with controller array, frame, and optional parameters
//        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
//        
//        // Lastly add page menu as subview of base view controller view
//        // or use pageMenu controller in you view hierachy as desired
//        self.view.addSubview(pageMenu!.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseArr.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! WorkoutTableViewCell
        
        var dict = [String:String]()
        dict = exerciseArr[indexPath.row] 
        cell.exerciseLbl.text = dict["exercise"]
        cell.setLbl.text = dict["set"]
        cell.number.text = dict["number"]
        cell.timeLbl.text = dict["timer"]
        
        if dict["status"] == "completed" {
            cell.statusBtn.setTitle("Done", forState: UIControlState.Normal)
            cell.statusBtn.backgroundColor = UIColor(red: 31/255, green: 150/255, blue: 211/255, alpha: 1.0)
            cell.statusBtn.titleLabel?.textColor = UIColor.whiteColor()
        }
        else if dict["status"] == "running" {
            cell.statusBtn.setTitle("Begin", forState: UIControlState.Normal)
            cell.statusBtn.backgroundColor = UIColor(red: 54/255, green: 223/255, blue: 2/255, alpha: 1.0)
            cell.statusBtn.titleLabel?.textColor = UIColor.blackColor()
        }
        if dict["status"] == "next" {
            cell.statusBtn.setTitle("Next", forState: UIControlState.Normal)
            cell.statusBtn.backgroundColor = UIColor.darkGrayColor()
            cell.statusBtn.titleLabel?.textColor = UIColor.whiteColor()
        }
        
        cell.statusBtn.layer.borderWidth = 1
        cell.statusBtn.layer.borderColor = UIColor.blackColor().CGColor
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Warmup"
//    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! WorkoutTableViewHeaderCell
        
        headerCell.headingLbl.text = "Warmup"
        headerCell.headingLbl.layer.borderWidth = 1
        headerCell.headingLbl.layer.borderColor = UIColor.blackColor().CGColor
        return headerCell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let  footerCell = tableView.dequeueReusableCellWithIdentifier("FooterCell") as! WorkoutTableViewFooterCell
        
//        footerCell.headingLbl.text = "Warmup"
//        footerCell.headingLbl.layer.borderWidth = 1
//        footerCell.headingLbl.layer.borderColor = UIColor.blackColor().CGColor
        return footerCell
    }
}

