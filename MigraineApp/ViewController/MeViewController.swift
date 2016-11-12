//
//  MeViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBAction func dailyTrackerTapped(_ sender: AnyObject) {
        appDelegate.getTopViewController().navigationController?.pushViewController(DailyTrackerViewController(), animated: true)
    }
    
    @IBAction func btnRecordTapped(_ sender: AnyObject) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecordViewController") as! RecordViewController
        appDelegate.getTopViewController().navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func migraineTapped(_ sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimeChoiceViewController") as! TimeChoiceViewController
        appDelegate.getTopViewController().navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myView.layer.cornerRadius = 110
        myView.layer.borderWidth = 2
        myView.layer.borderColor = UIColor.red.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
