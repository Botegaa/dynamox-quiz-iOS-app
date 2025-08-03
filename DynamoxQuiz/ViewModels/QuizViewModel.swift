//
//  QuizViewModel.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 01/08/25.
//

import Foundation
import RxSwift

class QuizViewModel {
    private let service = APIService()
    private let disposeBag = DisposeBag()
    var currentQuestion: Question?
    let question = PublishSubject<Question>()
    let answerResult = PublishSubject<Bool>()
    let options = PublishSubject<[String]>()
    var questionCount = 0
    let maxQuestions = 10
    var correctCount = 0
    var wrongCount = 0
    let quizFinished = PublishSubject<Void>()

    func loadQuestion() {
        guard questionCount < maxQuestions else {
            quizFinished.onNext(())
            return
        }

        service.fetchQuestion()
            .subscribe(onSuccess: { [weak self] question in
                self?.currentQuestion = question
                self?.question.onNext(question)
                self?.options.onNext(question.options)
                self?.questionCount += 1
            }, onFailure: { error in
                print("Erro ao buscar pergunta:", error)
            })
            .disposed(by: disposeBag)
    }

    func submitAnswer(questionId: String, answer: String) {
        service.submitAnswer(questionId: questionId, answer: answer)
            .subscribe(onSuccess: { [weak self] response in
                if response.result {
                    self?.correctCount += 1
                } else {
                    self?.wrongCount += 1
                }
                self?.answerResult.onNext(response.result)
            }, onFailure: { error in
                print("Erro ao enviar resposta:", error)
            })
            .disposed(by: disposeBag)
    }
}
