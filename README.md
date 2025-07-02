# iOSStringCalculator
This project implements a String Calculator with an iOS user interface, following a Test-Driven Development (TDD) approach. It's designed as an assignment to assess software development skills, particularly in Swift and iOS.

# Features

-> Empty String: Returns 0 for an empty input string.

-> Single Number: Returns the number itself for a single number input.

-> Comma-Separated Numbers: Calculates the sum of two or more numbers separated by commas (e.g., "1,5" returns 6).

-> Any Number of Inputs: Handles an arbitrary number of comma-separated inputs.

-> New Line Delimiters: Supports new lines (\n) as valid delimiters between numbers (e.g., "1\n2,3" returns 6).

-> Custom Delimiters: Allows specifying a custom single-character delimiter at the beginning of the string using the format "//[delimiter]\n[numbers...]". For example, "//;\n1;2" returns 3.

-> Negative Numbers Exception: Throws an exception with a message listing all negative numbers if any are found in the input (e.g., "Negative numbers not allowed: -2, -4").

## The iOS UI provides:

-> A text field for entering the input string.

-> A button to trigger the calculation.

-> Dynamic display of the result or an error message.

# Project Structure
The project is organized into the following key files:

-> iOSStringCalculatorApp.swift: The main entry point for the SwiftUI application.

-> ContentView.swift: Defines the SwiftUI user interface for the calculator.

-> StringCalculator.swift: Contains the core StringCalculator class and its add method, along with custom error handling.

-> iOSStringCalculatorAppTests.swift: Contains all the unit tests for the StringCalculator logic, demonstrating the TDD steps. (Initially, this was StringCalculatorTests.swift, but for simplicity, all tests were merged into the default test file.)

# Getting Started
Follow these instructions to get a copy of the project up and running on your local machine.

## Prerequisites
-> Xcode (version 13.0 or later recommended)

-> macOS (version 12.0 Monterey or later recommended)

## Installation

-> git clone <your-repository-url>
-> cd iOSStringCalculatorApp

## Open in Xcode:
-> Open the iOSStringCalculatorApp.xcodeproj file in Xcode.

## Running Tests

-> In Xcode, go to Product > Test (or use the shortcut ⌘U).

-> The tests are located in iOSStringCalculatorAppTests.swift. They cover all the requirements of the String Calculator.

## Using the App

-> Select a simulator (e.g., iPhone 15 Pro) or a connected iOS device from the scheme dropdown in Xcode.

-> Click the Run button (or use the shortcut ⌘R).

-> The app will launch, allowing you to:

-> Enter numbers in the text field (e.g., 1,2,3, 1\n2,3, //;\n1;2, 1,-2,3,-4).

-> Tap "Calculate Sum" to see the result or any error messages.

## TDD Approach
This project was developed using a Test-Driven Development (TDD) methodology. The iOSStringCalculatorAppTests.swift file reflects this process, with tests progressively added for each new requirement:

-> Empty string.

-> Single number.

-> Two comma-separated numbers.

-> Any number of inputs.

-> New lines as delimiters.

-> Custom delimiters.

-> Negative numbers exception.

-> Each test was written before the corresponding implementation in StringCalculator.swift, ensuring that the code meets the specified requirements and remains robust. Frequent commits (not shown in this single file output, but implied by the TDD process) would demonstrate this evolution.

## Error Handling
The StringCalculatorError enum is defined to handle specific error conditions, primarily negativeNumbersNotAllowed. This provides a clear and localized error message to the user when invalid input (negative numbers) is provided.

## Design Choices
-> SwiftUI: Used for the user interface for its declarative syntax and modern approach to iOS development.

-> Modularity: The core calculator logic is separated into StringCalculator.swift, making it reusable and testable independently of the UI.

-> Error Handling: Custom Error and LocalizedError types are used for clear and user-friendly error messages.

-> Responsive UI: The SwiftUI layout is designed to be responsive and adapt to different screen sizes.

## Contact
For any questions or feedback, please reach out meghanatrivedi92@gmail.com
