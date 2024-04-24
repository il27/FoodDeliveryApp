//
//  AddCoordinator.swift
//  FoodDeliveryAdd
//
//  Created by Ильяс on 24.04.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOndoardingFlow()
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
