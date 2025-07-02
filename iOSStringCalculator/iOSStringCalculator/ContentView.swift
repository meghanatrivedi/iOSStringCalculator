//
//  ContentView.swift
//  iOSStringCalculator
//
//  Created by Meggi on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumbers: String = ""
        @State private var result: String = "0"
        @State private var errorMessage: String? = nil

        private let calculator = StringCalculator()
    var body: some View {
        VStack(spacing: 20) {
                    Spacer()

                    Text("String Calculator")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)

                    // Text field for user input
                    TextField("Enter numbers (e.g., 1,2\\n3 or //;\\n1;2)", text: $inputNumbers)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .keyboardType(.default) // Use default keyboard for mixed input
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                        .padding(.horizontal)

                    // Button to trigger calculation
                    Button(action: calculateSum) {
                        Text("Calculate Sum")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    .padding(.horizontal)

                    // Display the result
                    VStack {
                        Text("Result:")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                        Text(result)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.green)
                            .padding(.top, 5)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(radius: 3)
                    .padding(.horizontal)

                    // Display error message if any
                    if let error = errorMessage {
                        Text(error)
                            .font(.callout)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.vertical)
                .background(Color(.systemBackground).ignoresSafeArea())
            }

            /// Performs the sum calculation using the StringCalculator and updates the UI.
            private func calculateSum() {
                errorMessage = nil // Clear previous errors
                do {
                    let sum = try calculator.add(inputNumbers)
                    result = String(sum)
                } catch let error as StringCalculatorError {
                    errorMessage = error.localizedDescription
                    result = "Error!" // Indicate an error state in the result display
                } catch {
                    errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
                    result = "Error!"
                }
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
