//
//  PageViewController.swift
//  MigraineApp
//
//  Created by Trieu Le on 10/31/16.
//  Copyright © 2016 Trieu Le. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.getViewControllerInPage(0),
                self.getViewControllerInPage(1),
                self.getViewControllerInPage(2),
                self.getViewControllerInPage(3),
                self.getViewControllerInPage(4)]
    }()
    
    fileprivate func getViewControllerInPage(_ index: Int) -> UIViewController {
        if index == 0 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalkthroughViewController") as! WalkthroughViewController
            vc.image = UIImage(named: "introduction_slide_image_0.9")
            return vc
        } else if index == 1 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalkthroughViewController") as! WalkthroughViewController
            vc.image = UIImage(named: "introduction_slide_image_1.9")
            return vc
        } else if index ==  2{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalkthroughViewController") as! WalkthroughViewController
            vc.image = UIImage(named: "introduction_slide_image_2.9")
            return vc
        } else if index == 3 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WalkthroughViewController") as! WalkthroughViewController
            vc.image = UIImage(named: "introduction_slide_image_3.9")
            return vc
        }
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        delegate = self
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
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
