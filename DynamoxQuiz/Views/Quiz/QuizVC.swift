    //
    //  ViewVC.swift
    //  DynamoxQuiz
    //
    //  Created by Pedro Botega on 28/07/25.
    //

    import UIKit
    import RxSwift


    class QuizVC: UIViewController {
        
        
        let viewModel = QuizViewModel()
        let disposeBag = DisposeBag()
        private let quizScreen = QuizScreen()
        private var currentQuestion: Question?

        override func viewDidLoad() {
            super.viewDidLoad()
            view = quizScreen
            
            viewModel.question
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] question in
                    self?.currentQuestion = question
                    self?.quizScreen.updateQuestion(with: question)
                })
                .disposed(by: disposeBag)
            
                viewModel.options
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] options in
                    guard let questionId = self?.currentQuestion?.id else { return }
                    self?.quizScreen.updateOptions(
                        with: options,
                        questionId: questionId,
                        submitAction: { [weak self] selectedAnswer in
                            self?.viewModel.submitAnswer(questionId: questionId, answer: selectedAnswer)
                        }
                    )
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
    

