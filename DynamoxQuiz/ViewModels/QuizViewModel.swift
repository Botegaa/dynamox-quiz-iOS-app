//
//  QuizViewModel.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 30/07/25.
//

import Foundation

class QuizViewModel {
    private let apiService = APIService()

    private(set) var currentQuestion: Question?
    private(set) var score: Int = 0
    var onUpdate: (() -> Void)?
    var onFinish: (() -> Void)?

    func loadQuestion() {
        apiService.fetchQuestion { [weak self] result in
            switch result {
            case .success(let question):
                self?.currentQuestion = question
                DispatchQueue.main.async {
                    self?.onUpdate?()
                }
            case .failure(let error):
                print("Erro ao buscar pergunta:", error)
            }
        }
    }

    func submitAnswer(_ option: String) {
        apiService.submitAnswer(option: option) { [weak self] result in
            switch result {
            case .success(let answerResult):
                if answerResult.isCorrect {
                    self?.score += 1
                }
                DispatchQueue.main.async {
                    self?.loadQuestion() 
                }
            case .failure(let error):
                print("Erro ao enviar resposta:", error)
            }
        }
    }
}
