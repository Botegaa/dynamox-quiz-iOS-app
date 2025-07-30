//
//  ViewVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit

var quizScreen : QuizScreen?

class QuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        quizScreen = QuizScreen()
        view = quizScreen
    }
    
}
