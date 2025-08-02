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

    func loadQuestion() {
        service.fetchQuestion()
            .subscribe(onSuccess: { [weak self] question in
                self?.question.onNext(question)
                self?.options.onNext(question.options)
                self?.currentQuestion = question
            }, onFailure: { error in
                print("Erro ao buscar pergunta:", error)
            })
            .disposed(by: disposeBag)
    }

    func submitAnswer(questionId: String, answer: String) {
        service.submitAnswer(questionId: questionId, answer: answer)
            .subscribe(onSuccess: { [weak self] response in
                self?.answerResult.onNext(response.result)
            }, onFailure: { error in
                print("Erro ao enviar resposta:", error)
            })
            .disposed(by: disposeBag)
    }
}
