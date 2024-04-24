//
//  AddCoordinator.swift
//  FoodDeliveryAdd
//
//  Created by Ильяс on 24.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
//        showOndoardingFlow()
        showMainFlow() 
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - NAvigation metgods
private extension AppCoordinator {
    func showOndoardingFlow() {
        guard let navigationContoller = navigationController else { return }
        let ondoardingCoordinator = OndoardingCoordinator(type: .onboarding, navigationController: navigationContoller, finishDelegate: self)
        addChildCoordinator(ondoardingCoordinator)
        ondoardingCoordinator.start()
    }
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
    
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationContriller = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationContriller)
        orderNavigationContriller.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationContriller = UINavigationController()
        let listCoordinator = ListCoordinator(type: .order, navigationController: listNavigationContriller)
        listNavigationContriller.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationContriller = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .order, navigationController: profileNavigationContriller)
        profileNavigationContriller.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "swirl.circle.righthalf.filled"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationContriller, listNavigationContriller, profileNavigationContriller]
        let tabBarController = TabBarController(tabBarController: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
         
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    
    func coordinationDidFinish(childCoordinatro: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatro)
        
        switch childCoordinatro.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}
