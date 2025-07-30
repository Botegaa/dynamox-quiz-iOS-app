//
//  Question.swift
//  DynamoxQuiz
//
//  Created by Pedro Botega on 30/07/25.
//

import Foundation

struct Question: Decodable {
    let id: String
    let statement: String
    let options: [String]
}
