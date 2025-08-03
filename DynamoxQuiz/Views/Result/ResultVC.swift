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
    
    init(correctAnswers: Int, wrongAnswers: Int) {
        self.correctAnswers = correctAnswers
        self.wrongAnswers = wrongAnswers
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultScreen = ResultScreen()
        view = resultScreen
        resultScreen?.configureResults(correct: correctAnswers, wrong: wrongAnswers, total: correctAnswers + wrongAnswers)



    }
        private let correctAnswers: Int
        private let wrongAnswers: Int

       
        
        

    }

    



