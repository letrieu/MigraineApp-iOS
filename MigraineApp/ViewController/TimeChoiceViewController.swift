//
//  TimeChoiceViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/10/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class TimeChoiceViewController: UIViewController {

    @IBAction func backAction(_ sender: AnyObject) {
        _ = appDelegate.getTopViewController().navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextAction(_ sender: AnyObject) {
        self.navigationController?.pushViewController(SymptomViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
