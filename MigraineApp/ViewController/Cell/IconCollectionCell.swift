//
//  IconCollectionCell.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class IconCollectionCell: UICollectionViewCell {
    var imgButton: UIButton?
    var lbText: UILabel?
    
    var image: UIImage?
    var selectedImage: UIImage?
    
    var isSelect: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        self.backgroundColor = .white
        imgButton = UIButton()
        imgButton?.translatesAutoresizingMaskIntoConstraints = false
        imgButton?.addTarget(self, action: #selector(pressButton(_:)), for: .touchUpInside)
        imgButton?.imageView?.contentMode = .scaleAspectFit
        self.addSubview(imgButton!)
        
        lbText = UILabel()
        lbText?.textAlignment = .center
        lbText?.translatesAutoresizingMaskIntoConstraints = false
        lbText?.numberOfLines = 0
        lbText?.font = lbText?.font.withSize(14)
        self.addSubview(lbText!)
        
        let viewsDict = [
            "imgButton": imgButton!,
            "lbText": lbText!
            ] as [String : Any]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imgButton]|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lbText]|", options: [], metrics: nil, views: viewsDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imgButton][lbText]|", options: [], metrics: nil, views: viewsDict))
    }
    
    func setData(_ img: UIImage, imgSelected: UIImage, text: String){
        
        lbText?.text = text
        image = img
        selectedImage = imgSelected
        if isSelect {
            imgButton?.setImage(imgSelected, for: .normal)
        } else {
            imgButton?.setImage(img, for: .normal)
        }
    }
    
    func pressButton(_ button: UIButton) {
        if isSelect {
        imgButton?.setImage(image, for: .normal)
        } else {
            imgButton?.setImage(selectedImage, for: .normal)
        }
        isSelect = !isSelect
    }
}
