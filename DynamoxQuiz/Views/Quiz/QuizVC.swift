//
//  ViewVC.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 28/07/25.
//

import UIKit
import RxSwift

let viewModel = QuizViewModel()
let disposeBag = DisposeBag()

class QuizVC: UIViewController {
    
    private let quizScreen = QuizScreen()


    override func viewDidLoad() {
        super.viewDidLoad()
        view = quizScreen
        
        viewModel.options
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] options in
                self?.quizScreen.updateOptions(with: options)
            })
            .disposed(by: disposeBag)
        
        
        viewModel.question
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] question in
                self?.quizScreen.updateQuestion(with: question)
            })
            .disposed(by: disposeBag)

        viewModel.answerResult
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isCorrect in
                let message = isCorrect ? "Resposta correta!" : "Resposta errada"
                let alert = UIAlertController(title: "Resultado", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            })
            .disposed(by: disposeBag)

        viewModel.loadQuestion()
    }
        func showResult(isCorrect: Bool) {
        let alert = UIAlertController(
            title: isCorrect ? "Acertou!" : "Errou!",
            message: nil,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
    

