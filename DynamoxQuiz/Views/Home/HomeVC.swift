//
//  HomeVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 24/07/25.
//

import UIKit


var homeScreen : HomeScreen?

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen = HomeScreen()
        view = homeScreen
        
        for family in UIFont.familyNames {
            print("📦 Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("  🔤 Font: \(name)")
            }
        }
    }
    
    

}
 
