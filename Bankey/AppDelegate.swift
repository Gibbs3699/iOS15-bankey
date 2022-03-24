//
//  AppDelegate.swift
//  Bankey
//
//  Created by TheGIZzz on 20/3/2565 BE.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.delegate = self
        
//        window?.rootViewController = dummyViewController
        window?.rootViewController = mainViewController
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        }else {
            setRootViewController(onboardingContainerViewController)
        }
        print("Did login")
    }
}

extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        setRootViewController(dummyViewController)
        print("Did onboard")
    }
}

extension AppDelegate: logoutDelegate {
    func didLogout() {
        LocalState.hasOnboarded = true
        setRootViewController(loginViewController)
        print("Did logout")
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
