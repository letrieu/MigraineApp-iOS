//
//  NotiCell.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class NotiCell: UITableViewCell {

    var imgView: UIImageView?
    var lbTitle: UILabel?
    var lbInfo: UILabel?
    var lbTime: UILabel?
    var lbDay: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        setup()
    }
    
    func setup(){
        imgView = UIImageView()
        imgView?.image = UIImage(named: "ic_notification_info_table")
        imgView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgView!)
        
        lbTitle = UILabel()
        lbTitle?.translatesAutoresizingMaskIntoConstraints = false
        lbTitle?.font = lbTitle?.font.withSize(16)
        self.addSubview(lbTitle!)
        
        lbInfo = UILabel()
        lbInfo?.translatesAutoresizingMaskIntoConstraints = false
        lbInfo?.font = lbInfo?.font.withSize(16)
        self.addSubview(lbInfo!)
        
        lbTime = UILabel()
        lbTime?.translatesAutoresizingMaskIntoConstraints = false
        lbTime?.font = lbTime?.font.withSize(16)
        self.addSubview(lbTime!)
        
        lbDay = UILabel()
        lbDay?.translatesAutoresizingMaskIntoConstraints = false
        lbDay?.font = lbDay?.font.withSize(16)
        self.addSubview(lbDay!)
        
        
        let viewsDict = [
            "imgView": imgView!,
            "lbTitle": lbTitle!,
            "lbInfo": lbInfo!,
            "lbTime": lbTime!,
            "lbDay": lbDay!,
            ] as [String : Any]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[imgView(30)]-4-[lbTitle]-(>=0)-[lbTime]-4-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[imgView(30)]-4-[lbInfo]-(>=0)-[lbDay]-4-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[imgView(30)]-8-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[lbTitle][lbInfo]-8-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[lbTime][lbDay]-8-|", options: [], metrics: nil, views: viewsDict))
        
        lbTitle?.text = "Welcome!"
        lbInfo?.text = "Welcome to Migraine Buddy!"
        lbTime?.text = "19:53"
        lbDay?.text = "01/11/2016"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
