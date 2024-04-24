//
//  TabBarController.swift
//  FoodDeliveryAdd
//
//  Created by Ильяс on 24.04.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(tabBarController: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarController {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
    }
}
