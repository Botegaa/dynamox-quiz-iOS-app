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
    private var selectedAnswer: String?
    private let userName: String
    private var didAnswerCurrentQuestion = false

        init(userName: String) {
            self.userName = userName
            super.init(nibName: nil, bundle: nil)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadQuestion()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = quizScreen
        navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
           self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        viewModel.question
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] question in
                self?.didAnswerCurrentQuestion = false
                self?.currentQuestion = question
                self?.quizScreen.updateQuestion(with: question)

                self?.quizScreen.updateQuestionCounter(
                    current: self?.viewModel.questionCount ?? 0,
                    total: self?.viewModel.maxQuestions ?? 10
                )
            })
            .disposed(by: disposeBag)
        
        viewModel.options
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] options in
                guard let self = self,
                      let questionId = self.currentQuestion?.id else { return }

                self.quizScreen.updateOptions(
                    with: options,
                    questionId: questionId,
                    submitAction: { selected in
                        guard self.didAnswerCurrentQuestion == false else { return }
                        self.didAnswerCurrentQuestion = true
                        self.selectedAnswer = selected
                        self.viewModel.submitAnswer(questionId: questionId, answer: selected)
                    }
                )
            })
            .disposed(by: disposeBag)
        
        viewModel.answerResult
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isCorrect in
                guard let self = self,
                      let selected = self.selectedAnswer,
                      let correct = self.currentQuestion?.options.first(where: { isCorrect ? $0 == selected : $0 != selected }) else { return }

                self.quizScreen.highlightButtons(
                    selectedAnswer: selected,
                   
                    isCorrect: isCorrect
                )

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.viewModel.loadQuestion()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.quizFinished
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }

                let resultVC = ResultVC(
                    correctAnswers: viewModel.correctCount,
                    wrongAnswers: viewModel.wrongCount,
                    userName: userName
                )
                self.navigationController?.pushViewController(resultVC, animated: true)
            })
            .disposed(by: disposeBag)

        
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
    
    
}
