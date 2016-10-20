//
//  TodayWorkoutStartViewController.swift
//  SportFit
//
//  Created by Anil Shukla on 10/5/16.
//
//

import UIKit

class TodayWorkoutStartViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
  
  var cellIdentifierHeader = "TodayWorkoutHeader"
  var cellIdentifierSection = "TodayWorkoutSection"
  var cellIdentifierMainCell = "TodayWorkoutMainCell"
  
  var sectionTitle =  ["Warmup:","Jump:"]
  var headerTitleArr = ["Circuit 1","Circuit 2","Circuit 3"]

  @IBOutlet weak var tblTodayWorkout: UITableView!
  
  @IBOutlet weak var txtView: UITextView!
  
  @IBAction func startButtonTapped(sender: AnyObject) {
    
     performSegueWithIdentifier("ShowPagemenu", sender:self )
  }
    
  @IBOutlet weak var btnStart: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      btnStart.layer.cornerRadius = 5.0
      
      setUpLeftImageOnNavigationBar()
      setUpRightImageOnNavigationBar()
         
      tblTodayWorkout.registerNib(UINib(nibName: "TodayWorkoutHeaderViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifierHeader)
      
      tblTodayWorkout.registerNib(UINib(nibName: "TodayWorkotSectionViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifierSection)
      
      self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(animated: Bool) {
    
    
    self.navigationController?.navigationBarHidden = false
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  // MARK: Table view Datasourse and Delegate Method
  
  
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = tableView.dequeueReusableCellWithIdentifier(cellIdentifierHeader) as! TodayWorkoutHeaderViewCell
    
    headerView.lblCircuit.text = headerTitleArr[section]

    return headerView
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
//  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    
//    return headerTitleArr[section]
//  }
  
//   func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//    let footerView = tableView.dequeueReusableCellWithIdentifier(cellIdentifierHeader) as! TodayWorkoutHeaderViewCell
//    
//    return footerView
//  }
//  
//   func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//    return 40.0
//  }
  
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 16
    
  }
  
 
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.row == 0 || indexPath.row == 5  {
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierSection,
                                                             forIndexPath: indexPath) as! TodayWorkotSectionViewCell
      
      cell.lblSectionTitle.text = sectionTitle[indexPath.section]
      
      
       return cell
    }else{
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierMainCell,
                                                           forIndexPath: indexPath) as! TodayWorkoutMainTableViewCell
    
    
      cell.lblInfoDisplay.text = "Calf Stretch:"
      cell.lblInfoDisplayFull.text = "2 sets @ 1 "
    
    
    return cell
    }
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
