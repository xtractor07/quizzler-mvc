//
//  QuizData.swift
//  Quizzler-iOS13
//
//  Created by Kumar Aman on 20/10/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

struct QuizModel {
    let swiftQuiz: [String: String] = [
        "Swift is a programming language developed by Apple.": "true",
        "Swift can only be used for iOS app development.": "false",  // Swift can also be used for macOS, watchOS, tvOS, and even server-side development.
        "The keyword 'let' in Swift is used to declare constants.": "true",
        "Arrays in Swift are zero-indexed.": "true",
        "In Swift, 'nil' can be assigned to any variable.": "false",  // Only optionals can be assigned 'nil'.
        "Swift was first introduced in 2010.": "false",  // Swift was introduced in 2014.
        "Tuples in Swift can hold multiple values of different types.": "true",
        "The 'Double' type in Swift can be used to store integer values.": "true",  // While Double is meant for floating point numbers, it can also represent whole numbers.
        "In Swift, all classes must inherit from a superclass.": "false",  // Swift supports standalone classes without inheritance.
        "Swift uses Automatic Reference Counting (ARC) for memory management.": "true"
    ]
    var currentQuestion: String? = nil
    var curIdx: Int = 0
    lazy var questions: Array<String> = Array(swiftQuiz.keys)
    lazy var totalCount = questions.count
    
    func checkUserInput(userAnswer: String) -> Bool {
        return userAnswer == swiftQuiz[currentQuestion!]
    }
    
    mutating func updateQuestion() -> String? {
        curIdx += 1
        currentQuestion = questions[curIdx]
        return currentQuestion
    }
    
    mutating func shouldUiUpdate() -> Bool{
        return curIdx < totalCount - 1
    }
    
    mutating func progress() -> Float {
        return Float(curIdx + 1) / Float(totalCount)
    }
}
