//
//  MigraineRecordViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class MigraineRecordViewController: UIViewController {

    var titleDate: UILabel?
    var titleIntensity: UILabel?
    var titleDuration: UILabel?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        titleDate = UILabel()
        titleDate?.textAlignment = .center
        titleDate?.translatesAutoresizingMaskIntoConstraints = false
        titleDate?.font = titleDate?.font.withSize(14)
        titleDate?.text = "DATE"
        titleDate?.textColor = .white
        titleDate?.backgroundColor = .blue
        view.addSubview(titleDate!)
        
        titleIntensity = UILabel()
        titleIntensity?.textAlignment = .center
        titleIntensity?.translatesAutoresizingMaskIntoConstraints = false
        titleIntensity?.font = titleIntensity?.font.withSize(14)
        titleIntensity?.text = "INTENSITY"
        titleIntensity?.textColor = .white
        titleIntensity?.backgroundColor = .blue
        view.addSubview(titleIntensity!)
        
        titleDuration = UILabel()
        titleDuration?.textAlignment = .center
        titleDuration?.translatesAutoresizingMaskIntoConstraints = false
        titleDuration?.font = titleDuration?.font.withSize(14)
        titleDuration?.text = "DURATION"
        titleDuration?.textColor = .white
        titleDuration?.backgroundColor = .blue
        view.addSubview(titleDuration!)
        
        tableView = UITableView()
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.register(MigraineCell.self, forCellReuseIdentifier: "MigraineCell")
        tableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView?.dataSource = self
        tableView?.delegate = self
        view.addSubview(tableView!)
        
        let viewsDict = [
            "titleDate": titleDate!,
            "titleIntensity": titleIntensity!,
            "titleDuration": titleDuration!,
            "tableView": tableView!,
            ] as [String : Any]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[titleDate(>=0)][titleIntensity(==titleDate)][titleDuration(==titleDate)]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleDate(40)][tableView]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleIntensity(40)]", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[titleDuration(40)]", options: [], metrics: nil, views: viewsDict))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MigraineRecordViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MigraineCell", for: indexPath) as! MigraineCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "THIS MONTH"
        label.textAlignment = .center
        label.textColor = .white
        
        
        let views = ["label": label,"view": view]
        view.backgroundColor = .brown
        view.addSubview(label)
        
        let horizontallayoutContraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label]-10-|", options: .alignAllCenterY, metrics: nil, views: views)
        view.addConstraints(horizontallayoutContraints)
        
        let verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalLayoutContraint)
        
        return view
    }
}
