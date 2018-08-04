//
//  ViewController.swift
//  ContainerView-Example
//
//  Created by Shiju Varghese on 31/07/18.
//  Copyright © 2018 Shiju. All rights reserved.
//

// MARK: - Conatiner View

/*
  Both UITabBarControllers and UINavigationControllers are ContainerViewController
 
 ## Container view controller manages the
 
 -- View (Just like other ViewController subclass)
 
 -- In addition to managing a view, containerView controller also manages the One-or-more child view controllers.

 -- It acts as a Parent view contoller of one-or-more childView Controllers.
 
 -- The Parent View-Controller responsible for "Setting the Size and Position of View" of each Child View Controllers
 
 -- The View of child view controller, becomes the part of Parent View Controllers View Hierarchy
 
 -- The child view controller is continues to be responsible for "Own View Hierarchy"
 
 
 ## Benifits - Key management of containerview is
 
 -- Reusbaility
 
 */

import UIKit


class MainViewController: UIViewController {

  @IBOutlet var segmentControl: UISegmentedControl!
  
  lazy var firstController: FirstViewController = {
    
    var viewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
    self.addViewControllerAsChildViewController(childViewController: viewController)
    return viewController
    
  }()
  
  lazy var secondController: SecondViewController = {
    
    var viewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    self.addViewControllerAsChildViewController(childViewController: viewController)
    return viewController
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    segmentControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
    updateView()

  }
  
  @objc private func selectionDidChange() {
    
    updateView()
  }
  
  private func updateView() {
    firstController.view.isHidden = !(segmentControl.selectedSegmentIndex == 0)
    secondController.view.isHidden = (segmentControl.selectedSegmentIndex == 0)
  }
  
  // Helper: Method
  
  private func addViewControllerAsChildViewController(childViewController: UIViewController) {
    
    addChildViewController(childViewController)
    self.view.addSubview(childViewController.view)
    
    childViewController.view.frame = view.bounds
    childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    // Notify the childViewController, that you are going to add it into the Container-View -Controller
    childViewController.didMove(toParentViewController: self)
    
  }
  

}

