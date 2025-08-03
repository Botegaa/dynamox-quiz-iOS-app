//
//  ResultVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit
import RxSwift

class ResultVC: UIViewController {

    private let userName: String
    private let correctAnswers: Int
    private let wrongAnswers: Int
    private let resultScreen = ResultScreen()

    init(correctAnswers: Int, wrongAnswers: Int, userName: String) {
        self.correctAnswers = correctAnswers
        self.wrongAnswers = wrongAnswers
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = resultScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        resultScreen.configureResults(
            correct: correctAnswers,
            wrong: wrongAnswers,
            total: correctAnswers + wrongAnswers
        )

        resultScreen.updatePointsCounter(correct: correctAnswers)
        resultScreen.congratsLabel.text = "Parabéns, \(userName)"

        resultScreen.restartBttn.addTarget(self, action: #selector(restartQuizTapped), for: .touchUpInside)
        resultScreen.goToHomeBttn.addTarget(self, action: #selector(goToHomeTapped), for: .touchUpInside)

        navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    @objc private func restartQuizTapped() {
        let quizVC = QuizVC(userName: userName)
        navigationController?.setViewControllers([quizVC], animated: true)
    }

    @objc private func goToHomeTapped() {
        let homeVC = HomeVC()
        navigationController?.setViewControllers([homeVC], animated: true)
    }
}
    



