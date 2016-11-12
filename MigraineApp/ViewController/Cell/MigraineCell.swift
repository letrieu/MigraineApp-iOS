//
//  MigraineCell.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class MigraineCell: UITableViewCell {

    var imgView: UIImageView?
    var lbDate: UILabel?
    var lbInten: UILabel?
    var lbDuration: UILabel?
    
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
        imgView?.image = UIImage(named: "ic_migraine")
        imgView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgView!)
        
        lbDate = UILabel()
        lbDate?.translatesAutoresizingMaskIntoConstraints = false
        lbDate?.font = lbDate?.font.withSize(16)
        lbDate?.textAlignment = .center
        self.addSubview(lbDate!)
        
        lbInten = UILabel()
        lbInten?.translatesAutoresizingMaskIntoConstraints = false
        lbInten?.font = lbInten?.font.withSize(16)
        lbInten?.textAlignment = .center
        self.addSubview(lbInten!)
        
        lbDuration = UILabel()
        lbDuration?.translatesAutoresizingMaskIntoConstraints = false
        lbDuration?.font = lbDuration?.font.withSize(16)
        lbDuration?.textAlignment = .center
        self.addSubview(lbDuration!)
        
        
        
        let viewsDict = [
            "imgView": imgView!,
            "lbDate": lbDate!,
            "lbInten": lbInten!,
            "lbDuration": lbDuration!,
            ] as [String : Any]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[imgView(20)]-4-[lbDate(>=0)][lbInten(==lbDate)][lbDuration(==lbDate)]-4-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[imgView(20)]-8-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[lbDate]-8-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[lbInten]-8-|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[lbDuration]-8-|", options: [], metrics: nil, views: viewsDict))
        
        lbDate?.text = "Th 2 7"
        lbInten?.text = "6/10"
        lbDuration?.text = "0h30m"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
