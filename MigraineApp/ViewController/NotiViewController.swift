//
//  NotiViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class NotiViewController: UIViewController {

    var navView: UIView?
    var btnBack: UIButton?
    var lbNoti: UILabel?
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navView = UIView()
        navView?.backgroundColor = UIColor(red: 208.0/255, green: 150.0/255, blue: 54.0/255, alpha: 1)
        navView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(navView!)
        
        btnBack = UIButton()
        btnBack?.translatesAutoresizingMaskIntoConstraints = false
        btnBack?.setImage(UIImage(named: "ic_back"), for: .normal)
        btnBack?.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        navView?.addSubview(btnBack!)
        
        lbNoti = UILabel()
        lbNoti?.translatesAutoresizingMaskIntoConstraints = false
        lbNoti?.text = "Notifications"
        lbNoti?.textColor = .white
        navView?.addSubview(lbNoti!)
        
        tableView = UITableView()
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.register(NotiCell.self, forCellReuseIdentifier: "NotiCell")
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.dataSource = self
        tableView?.delegate = self
        view.addSubview(tableView!)
        
        let viewsDict = [
            "navView": navView!,
            "btnBack": btnBack!,
            "lbNoti": lbNoti!,
            "tableView": tableView!,
            ] as [String : Any]
        
        navView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-4-[btnBack(12)]-[lbNoti]", options: [], metrics: nil, views: viewsDict))
        navView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[btnBack]-20-|", options: [], metrics: nil, views: viewsDict))
        navView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lbNoti]-10-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[navView]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[navView(60)][tableView]|", options: [], metrics: nil, views: viewsDict))
        
    }
    
    func pressButton(_ sender: AnyObject){
        _ = self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NotiViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotiCell", for: indexPath) as! NotiCell
        
        return cell
    }
    
}

