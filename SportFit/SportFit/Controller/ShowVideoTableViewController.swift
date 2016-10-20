//
//  ShowVideoTableViewController.swift
//  SportFit
//
//  Created by Anil Shukla on 10/5/16.
//
//

import UIKit

class ShowVideoTableViewController: BaseViewController,UITableViewDataSource,UITabBarDelegate {

  var cellIdentifierHeader = "HeaderCell"
  var cellIdentifierFooter = "FooterCell"
  var cellIdentifierMainCell = "showVideoCell"
  
  var sectionTitle =  ["Warmup12345:","Jump:"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
//      var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(update), userInfo: nil, repeats: true)
//      print(timer)
      
      setUpLeftImageOnNavigationBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  func update()
  {
    
  
  
  }
  
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = tableView.dequeueReusableCellWithIdentifier(cellIdentifierHeader) as! WorkoutTableViewHeaderCell
    
    return headerView
  }
  
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    
    return sectionTitle[section]
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 20
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 4
    
  }
  
  
  // Day2Arr value is fetched to generate the table view rown and the data that we are showing for the table view.
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierMainCell,
                                                             forIndexPath: indexPath) as! WorkoutTableViewCell
    
    
      
      
//      cell.lblInfoDisplay.text = "Calf Stretch:"
//      cell.lblInfoDisplayFull.text = "2 sets @ 1 Min"
      
      
      
      return cell
    
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
