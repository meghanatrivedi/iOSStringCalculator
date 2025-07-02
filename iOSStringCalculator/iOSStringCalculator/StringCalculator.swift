//
//  StringCalculator.swift
//  iOSStringCalculator
//
//  Created by Meggi on 02/07/25.
//

import Foundation

// Define a custom error type for the String Calculator
enum StringCalculatorError: Error, LocalizedError {
    case negativeNumbersNotAllowed(numbers: [Int])

    var errorDescription: String? {
        switch self {
        case .negativeNumbersNotAllowed(let numbers):
            let negativeNumbersString = numbers.map { String($0) }.joined(separator: ", ")
            return "Negative numbers not allowed: \(negativeNumbersString)"
        }
    }
}

// The StringCalculator class implementing the core logic
class StringCalculator {

    /// Calculates the sum of numbers in a given string.
    ///
    /// This method supports:
    /// - Empty string returning 0.
    /// - Single numbers.
    /// - Comma-separated numbers.
    /// - Newline characters (`\n`) as delimiters.
    /// - Custom delimiters defined by `//[delimiter]\n[numbers...]`.
    /// - Throws `StringCalculatorError.negativeNumbersNotAllowed` if negative numbers are present.
    ///
    /// - Parameter numbers: The input string containing numbers.
    /// - Throws: `StringCalculatorError` if negative numbers are found.
    /// - Returns: The sum of the numbers.
    func add(_ numbers: String) throws -> Int {
        // TDD Step 1: Handle empty string
        guard !numbers.isEmpty else {
            return 0
        }

        var inputString = numbers
        var delimiters: CharacterSet = CharacterSet(charactersIn: ",\n")

        // TDD Step 6: Support custom delimiters
        // Check if the input starts with a custom delimiter definition
        if inputString.hasPrefix("//") {
            let parts = inputString.components(separatedBy: "\n")
            if parts.count >= 2 {
                let delimiterDefinition = parts[0]
                // Extract the custom delimiter character
                if let customDelimiterChar = delimiterDefinition.dropFirst(2).first {
                    // FIX: Convert Character to String, then to CharacterSet, and then formUnion
                    delimiters.formUnion(CharacterSet(charactersIn: String(customDelimiterChar)))
                    // Update inputString to only contain the numbers part
                    inputString = String(inputString.dropFirst(delimiterDefinition.count + 1))
                }
            }
        }

        // Split the string by all allowed delimiters
        let numberStrings = inputString.components(separatedBy: delimiters)

        var sum = 0
        var negativeNumbers: [Int] = []

        for numStr in numberStrings {
            // Trim whitespace and ensure the string is not empty after splitting
            let trimmedNumStr = numStr.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmedNumStr.isEmpty else { continue }

            // Convert string to Int
            if let number = Int(trimmedNumStr) {
                // TDD Step 7: Handle negative numbers
                if number < 0 {
                    negativeNumbers.append(number)
                }
                sum += number
            } else {
                // Handle cases where a part is not a valid number (e.g., "1,,2")
                // For this kata, we assume valid number formats, but in a real app,
                // you might want to throw an error or log a warning here.
                print("Warning: '\(trimmedNumStr)' is not a valid number and will be ignored.")
            }
        }

        // TDD Step 7: Throw exception if negative numbers are found
        if !negativeNumbers.isEmpty {
            throw StringCalculatorError.negativeNumbersNotAllowed(numbers: negativeNumbers)
        }

        return sum
    }
}
