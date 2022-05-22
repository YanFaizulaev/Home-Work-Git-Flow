//
//  MainViewController.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }

    func setTabBarController () {
        
        let tabBarController = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        vc1.title = "First"
        vc2.title = "Second"
        vc3.title = "Third"
        
//        guard let items = tabBarController.tabBar.items else { return }
//        let images = ["square.and.arrow.up", "square.and.arrow.up", "square.and.arrow.up"]
//        for i in 0..<items.count {
//            items[i].image = UIImage(systemName: images[i])
//        }
        
        tabBarController.setViewControllers([vc1, vc2, vc3], animated: true)
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
    }
}
