//
//  APIService.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 30/07/25.
//

import Foundation
import RxSwift

class APIService {
    private let baseURL = "https://quiz-api-bwi5hjqyaq-uc.a.run.app"

    func fetchQuestion() -> Single<Question> {
        return Single.create { single in
            guard let url = URL(string: "\(self.baseURL)/question") else {
                single(.failure(NSError(domain: "URL inválida", code: 0)))
                return Disposables.create()
            }

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    single(.failure(error))
                    return
                }

                guard let data = data else {
                    single(.failure(NSError(domain: "Sem dados", code: 0)))
                    return
                }

                do {
                    let question = try JSONDecoder().decode(Question.self, from: data)
                    single(.success(question))
                } catch {
                    single(.failure(error))
                }
            }

            task.resume()
            return Disposables.create { task.cancel() }
        }
    }

    func submitAnswer(questionId: String, answer: String) -> Single<AnswerResult> {
        return Single.create { single in
            guard let url = URL(string: "\(self.baseURL)/answer?questionId=\(questionId)") else {
                single(.failure(NSError(domain: "URL inválida", code: 0)))
                return Disposables.create()
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let body = ["answer": answer]
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    single(.failure(error))
                    return
                }

                guard let data = data else {
                    single(.failure(NSError(domain: "Sem dados", code: 0)))
                    return
                }

                do {
                    let result = try JSONDecoder().decode(AnswerResult.self, from: data)
                    single(.success(result))
                } catch {
                    single(.failure(error))
                }
            }

            task.resume()
            return Disposables.create { task.cancel() }
        }
    }
}
