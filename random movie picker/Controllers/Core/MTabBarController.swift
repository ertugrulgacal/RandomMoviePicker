//
//  ViewController.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 12.03.2023.
//

import UIKit

final class MTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupTabs()
    }
    
    private func setupTabs() {
        let watchlistVC = MWatchlistViewController()
        let randomVC = MRandomViewController()
        let settingsVC = MSettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: watchlistVC)
        let nav2 = UINavigationController(rootViewController: randomVC)
        let nav3 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(systemName: "list.bullet"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "shuffle"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }

}

