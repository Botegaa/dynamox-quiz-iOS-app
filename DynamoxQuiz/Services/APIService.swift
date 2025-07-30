//
//  APIService.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 30/07/25.
//

import Foundation

class APIService {
    private let baseURL = "https://quiz-api-bwi5hjqyaq-uc.a.run.app"

    func fetchQuestion(completion: @escaping (Result<Question, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/question") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error)); return
            }

            guard let data = data else { return }

            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                completion(.success(question))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func submitAnswer(option: String, completion: @escaping (Result<AnswerResult, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/answer") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let body = ["option": option]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error)); return
            }

            guard let data = data else { return }

            do {
                let result = try JSONDecoder().decode(AnswerResult.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
