//
//  ResultVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit
import RxSwift

var resultScreen : ResultScreen?

class ResultVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resultScreen = ResultScreen()
        view = resultScreen
    }
}
    



