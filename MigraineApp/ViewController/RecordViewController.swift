//
//  RecordViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/7/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    
    @IBOutlet weak var myView: UIView!
    
    
    @IBOutlet weak var backTapped: UIButton!
    
    @IBAction func btnBackTapped(_ sender: AnyObject) {
        _ = appDelegate.getTopViewController().navigationController?.popViewController(animated: true)
    }
    @IBAction func migraineTapped(_ sender: AnyObject) {
        pageController?.setViewControllers([orderedViewControllers.first!],
                                           direction: .reverse,
                                           animated: true,
                                           completion: nil)
    }
    
    @IBAction func sleepTapped(_ sender: AnyObject) {
        pageController?.setViewControllers([orderedViewControllers[1]],
                                           direction: .forward,
                                           animated: true,
                                           completion: nil)
    }
    
    
    
    @IBOutlet weak var btnExport: UIImageView!
    
    var currentIndex:Int = 0 {
        didSet {
            if currentIndex == 0 {
                btnExport.isHidden = false
            } else {
                btnExport.isHidden = true
            }
        }
    }
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.getViewControllerInPage(0),
                self.getViewControllerInPage(1)]
    }()
    
    var pageController: UIPageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.view.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview((pageController?.view)!)
        
        pageController?.delegate = self
        pageController?.dataSource = self
        
        pageController?.setViewControllers([orderedViewControllers.first!],
                                           direction: .forward,
                                           animated: true,
                                           completion: nil)
        currentIndex = 0
        
        myView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[page]|", options: [], metrics: nil, views: ["page": (pageController?.view)!]))
        myView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[page]|", options: [], metrics: nil, views: ["page": (pageController?.view)!]))
        
        // Do any additional setup after loading the view.
    }
    
    fileprivate func getViewControllerInPage(_ index: Int) -> UIViewController {
        if index == 0 {
            let vc = MigraineRecordViewController()
            return vc
        }
        return SleepRecordViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RecordViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        if let viewControllerIndex = orderedViewControllers.index(of: pageViewController.viewControllers!.first!) {
            currentIndex = viewControllerIndex
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
}

