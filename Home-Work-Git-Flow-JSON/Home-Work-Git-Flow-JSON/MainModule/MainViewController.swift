//
//  MainViewController.swift
//  Home-Work-Git-Flow-JSON
//
//  Created by Bandit on 16.05.2022.
//

import UIKit

class MainViewController: UITabBarController {

   override func viewDidLoad() {
    super.viewDidLoad()
    self.setupTabBar()
}

    private enum TabBarItem: Int {
        case film
        case post
        case comment
        
        var title: String {
                switch self {
                    case .film:
                        return "Фильмы"
                    case .post:
                        return "POST"
                    case .comment:
                        return "Комментарии"
                    }
        }
        
        var iconName: String {
                    switch self {
                    case .film:
                        return "film"
                    case .post:
                        return "signpost.right"
                    case .comment:
                        return "theatermasks"
                    }
        }
    }
    
    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.film, .post, .comment]
        self.viewControllers = dataSource.map {
            switch $0 {
                case .film:
                    let feedViewController = FirstViewController()
                    return self.wrappedInNavigationController(with: feedViewController, title: $0.title)
                case .post:
                    let profileViewController = SecondViewController()
                    return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
                case .comment:
                    let profileViewController = ThirdViewController()
                    return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
            }
        }
            self.viewControllers?.enumerated().forEach {
                $1.tabBarItem.title = dataSource[$0].title
                $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
                $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: -5, right: .zero)
                $1.tabBarController?.tabBar.tintColor = Constans.Color.costomBarItem
                $1.tabBarController?.tabBar.unselectedItemTintColor = Constans.Color.costomBarUnselectedItem
                $1.tabBarController?.tabBar.backgroundColor = Constans.Color.costomBar
            }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
            return UINavigationController(rootViewController: with)
        }
}




