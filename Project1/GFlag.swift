//
//  GFlag.swift
//  Project1
//
//  Created by s15 on 23/10/24.
//

import SwiftUI

struct Flag: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct GFlag: View {

    
    @State private var currentFlag: Flag?
    @State private var options: [Flag] = []
    @State private var isCorrect: Bool?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    
                    Text("Guess the Flag")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("#3B413C"))
                    
                    if let flag = currentFlag {
                        Image(flag.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .shadow(color: .gray, radius: 5, x: 0, y: 10)
                            .padding()
                        
                        if isCorrect == nil {
                            VStack(spacing: 15) {
                                ForEach(options) { option in
                                    Button(action: {
                                        checkAnswer(option)
                                    }) {
                                        Text(option.name)
                                            .font(.title3.bold())
                                            .foregroundColor(Color(red: 0.85, green: 0.94, blue: 0.93))
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color(red: 0.23, green: 0.25, blue: 0.24))
                                            )
                                    }
                                    .padding(.bottom, 10)
                                }
                            }
                            .padding(.horizontal)
                        } else {
                            VStack(spacing: 15) {
                                Text(isCorrect ?? false ? "Correct!" : "Try again!")
                                    .font(.title2.bold())
                                    .foregroundColor(isCorrect ?? false ? .green : .red)
                                
                                Text("The correct answer is: \(flag.name)")
                                    .font(.title3.bold())
                                
                                Button(action: generateNewGame) {
                                    Text("New Game")
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.blue)
                                        )
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .onAppear(perform: generateNewGame)
        }
    }
    
    private func generateNewGame() {
        let shuffledFlags = flags.shuffled()
        currentFlag = shuffledFlags[0]
        
        var newOptions = [currentFlag!]
        let remainingFlags = Array(shuffledFlags.dropFirst())
        newOptions.append(contentsOf: remainingFlags.prefix(3))
        
        options = newOptions.shuffled()
        isCorrect = nil
    }
    
    private func checkAnswer(_ selectedFlag: Flag) {
        isCorrect = selectedFlag.id == currentFlag?.id
    }
}


#Preview {
    GFlag()
}
