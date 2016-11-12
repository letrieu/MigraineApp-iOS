//
//  SymptomViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/10/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class SymptomViewController: UIViewController {

    var collectionView: UICollectionView?
    
    var topView: UIView?
    var lbTitle: UILabel?
    var btnWarning: UIButton?
    var btnQuestion: UIButton?
    
    var btnConfirm: UIButton?
    var btnNext: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        topView = UIView()
        topView?.translatesAutoresizingMaskIntoConstraints = false
        topView?.backgroundColor = UIColor(red: 51.0/255, green: 78.0/255, blue: 99.0/255, alpha: 1)
        view.addSubview(topView!)
        
        
        lbTitle = UILabel()
        lbTitle?.textColor = .white
        lbTitle?.text = "Select symptom"
        lbTitle?.translatesAutoresizingMaskIntoConstraints = false
        topView?.addSubview(lbTitle!)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = .white
        self.view.addSubview(collectionView!)
        
        
        collectionView?.register(IconCollectionCell.self, forCellWithReuseIdentifier: "IconCollectionCell")
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        
        btnConfirm = UIButton()
        btnConfirm?.translatesAutoresizingMaskIntoConstraints = false
        btnConfirm?.setTitleColor(.white, for: .normal)
        btnConfirm?.setTitle("BACK", for: .normal)
        btnConfirm?.addTarget(self, action: #selector(btnConfirmTapped(_:)), for: .touchUpInside)
        btnConfirm?.backgroundColor = UIColor(red: 51.0/255, green: 78.0/255, blue: 99.0/255, alpha: 1)
        view.addSubview(btnConfirm!)
        
        btnNext = UIButton()
        btnNext?.translatesAutoresizingMaskIntoConstraints = false
        btnNext?.setTitleColor(.white, for: .normal)
        btnNext?.setTitle("NEXT", for: .normal)
        btnNext?.addTarget(self, action: #selector(btnConfirmTapped(_:)), for: .touchUpInside)
        btnNext?.backgroundColor = UIColor(red: 51.0/255, green: 99.0/255, blue: 99.0/255, alpha: 1)
        view.addSubview(btnNext!)
        
        let viewsDict = [
            "topView": topView!,
            "collectionView": collectionView!,
            "btnConfirm": btnConfirm!,
            "lbTitle": lbTitle!,
            "btnNext": btnNext!,
            ] as [String : Any]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[collectionView]-10-|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[topView(50)][collectionView][btnConfirm(50)]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[btnNext(50)]|", options: [], metrics: nil, views: viewsDict))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btnConfirm(100)][btnNext]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[topView]|", options: [], metrics: nil, views: viewsDict))
        
        topView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-24-[lbTitle]|", options: [], metrics: nil, views: viewsDict))
        topView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[lbTitle]", options: [], metrics: nil, views: viewsDict))
        
        // Do any additional setup after loading the view.
    }
    
    func btnConfirmTapped(_ sender: AnyObject){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SymptomViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionCell",
                                                      for: indexPath) as! IconCollectionCell
        cell.setData(UIImage(named: "ic_body")!,imgSelected: UIImage(named: "ic_body_pressed")!, text: "Body")
        return cell
    }
}

extension SymptomViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: screenSize.width/3 - 25, height: screenSize.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
