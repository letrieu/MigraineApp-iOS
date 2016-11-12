//
//  MainViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 11/5/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var pageView: UIView!
    @IBAction func btnNotiTapped(_ sender: AnyObject) {
        appDelegate.getTopViewController().navigationController?.pushViewController(NotiViewController(), animated: true)
    }
    
    
    
    @IBAction func btnReportTap(_ sender: AnyObject) {
        if let firstViewController = orderedViewControllers.first {
            pageController?.setViewControllers([firstViewController],
                                               direction: .reverse,
                                               animated: true,
                                               completion: nil)
        }
        currentIndex = 0
    }
    @IBAction func btnMeTap(_ sender: AnyObject) {
        
        if currentIndex == 0 {
            pageController?.setViewControllers([orderedViewControllers[1]],
                                               direction: .forward,
                                               animated: true,
                                               completion: nil)
        } else {
            pageController?.setViewControllers([orderedViewControllers[1]],
                                               direction: .reverse,
                                               animated: true,
                                               completion: nil)
        }
        currentIndex = 1
    }
    @IBAction func btnBuddiesTap(_ sender: AnyObject) {
            pageController?.setViewControllers([orderedViewControllers[2]],
                                               direction: .forward,
                                               animated: true,
                                               completion: nil)
        currentIndex = 2
    }
    var currentIndex:Int = 0
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.getViewControllerInPage(0),
                self.getViewControllerInPage(1),
                self.getViewControllerInPage(2)]
    }()
    
    var pageController: UIPageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController?.view.translatesAutoresizingMaskIntoConstraints = false
        pageView.addSubview((pageController?.view)!)
        
        pageController?.delegate = self
        pageController?.dataSource = self
        
            pageController?.setViewControllers([orderedViewControllers[1]],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        currentIndex = 1
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[page]|", options: [], metrics: nil, views: ["page": (pageController?.view)!]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[page]|", options: [], metrics: nil, views: ["page": (pageController?.view)!]))

        // Do any additional setup after loading the view.
    }
    
    fileprivate func getViewControllerInPage(_ index: Int) -> UIViewController {
        if index == 0 {
            let vc = ReportViewController()
            return vc
        } else if index == 1 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MeViewController") as! MeViewController
            return vc
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuddyViewController") as! BuddyViewController
        return vc
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

extension MainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
