//
//  OnboardingCoordinator.swift
//  FoodDeliveryAdd
//
//  Created by Ильяс on 24.04.2024.
//

import UIKit

class OndoardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
