//
//  BadViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/10/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class BadViewController: UIViewController {

    var myTitle: UILabel?
    var btnQuestion: UIButton?
    var btn1: UIButton?
    var btn2: UIButton?
    var btn3: UIButton?
    var btn4: UIButton?
    var btn5: UIButton?
    var btn6: UIButton?
    var btn7: UIButton?
    var btn8: UIButton?
    var btn9: UIButton?
    var btn10: UIButton?
    
    var img1: UIImageView?
    var img2: UIImageView?
    var img3: UIImageView?
    var img4: UIImageView?
    var img5: UIImageView?
    
    var label1: UILabel?
    var label2: UILabel?
    var label3: UILabel?
    var label4: UILabel?
    var label5: UILabel?
    
    var mark1: UILabel?
    var mark2: UILabel?
    var mark3: UILabel?
    var mark4: UILabel?
    var mark5: UILabel?
    var mark6: UILabel?
    var mark7: UILabel?
    var mark8: UILabel?
    var mark9: UILabel?
    var mark10: UILabel?
    
    
    var btnBack: UIButton?
    var btnNext: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        myTitle = UILabel()
        myTitle?.translatesAutoresizingMaskIntoConstraints = false
        myTitle?.textAlignment = .center
        myTitle?.text = "How bad is it?"
        myTitle?.textColor = .gray
        view.addSubview(myTitle!)
        
        btnBack = UIButton()
        btnBack?.translatesAutoresizingMaskIntoConstraints = false
        btnBack?.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        view.addSubview(btnBack!)
        
        btnNext = UIButton()
        btnNext?.translatesAutoresizingMaskIntoConstraints = false
        btnNext?.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        view.addSubview(btnNext!)
        
        btn1 = UIButton()
        btn1?.translatesAutoresizingMaskIntoConstraints = false
        btn1?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn1!)
        
        btn2 = UIButton()
        btn2?.translatesAutoresizingMaskIntoConstraints = false
        btn2?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn2!)
        
        btn3 = UIButton()
        btn3?.translatesAutoresizingMaskIntoConstraints = false
        btn3?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn3!)
        
        btn4 = UIButton()
        btn4?.translatesAutoresizingMaskIntoConstraints = false
        btn4?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn4!)
        
        btn5 = UIButton()
        btn5?.translatesAutoresizingMaskIntoConstraints = false
        btn5?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn5!)
        
        btn6 = UIButton()
        btn6?.translatesAutoresizingMaskIntoConstraints = false
        btn6?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn6!)
        
        btn7 = UIButton()
        btn7?.translatesAutoresizingMaskIntoConstraints = false
        btn7?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn7!)
        
        btn8 = UIButton()
        btn8?.translatesAutoresizingMaskIntoConstraints = false
        btn8?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn8!)
        
        btn9 = UIButton()
        btn9?.translatesAutoresizingMaskIntoConstraints = false
        btn9?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn9!)
        
        btn10 = UIButton()
        btn10?.translatesAutoresizingMaskIntoConstraints = false
        btn10?.addTarget(self, action: #selector(btnTapped(_:)), for: [.touchDragEnter, .touchDown])
        view.addSubview(btn10!)
        
        
        btn1?.tag = 1
        btn2?.tag = 2
        btn3?.tag = 3
        btn4?.tag = 4
        btn5?.tag = 5
        btn6?.tag = 6
        btn7?.tag = 7
        btn8?.tag = 8
        btn9?.tag = 9
        btn10?.tag = 10
        
        
        let viewsDict = [
            "btn1": btn1!,
            "btn2": btn2!,
            "btn3": btn3!,
            "btn4": btn4!,
            "btn5": btn5!,
            "btn6": btn6!,
            "btn7": btn7!,
            "btn8": btn8!,
            "btn9": btn9!,
            "btn10": btn10!,
        ]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn1]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn2]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn3]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn4]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn5]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn6]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn7]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn8]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn9]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btn10]|", options: [], metrics: nil, views: viewsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[btn1(>=0)][btn2(==btn1)][btn3(==btn1)][btn4(==btn1)][btn5(==btn1)][btn6(==btn1)][btn7(==btn1)][btn8(==btn1)][btn9(==btn1)][btn10(==btn1)]|", options: [], metrics: nil, views: viewsDict))
        
        
        // Do any additional setup after loading the view.
    }

    func btnTapped(_ sender: AnyObject){
        print(sender)
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
