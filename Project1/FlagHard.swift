import SwiftUI



struct FlagsHard: View {
    @State private var flags: [Flag] = [
        Flag(name: "Alaska", code: "ak"),
        Flag(name: "Albania", code: "al"),
        Flag(name: "American Samoa", code: "as"),
        Flag(name: "Andorra", code: "ad"),
        Flag(name: "Argentina", code: "ar"),
        Flag(name: "Australia", code: "au"),
        Flag(name: "Austria", code: "at"),
        Flag(name: "Azores", code: "az"),
        Flag(name: "Bangladesh", code: "bd"),
        Flag(name: "Belarus", code: "by"),
        Flag(name: "Belgium", code: "be"),
        Flag(name: "Bermuda", code: "bm"),
        Flag(name: "Bhutan", code: "bt"),
        Flag(name: "Bolivia", code: "bo"),
        Flag(name: "Brazil", code: "br"),
        Flag(name: "British Indian Ocean Territory", code: "io"),
        Flag(name: "Bulgaria", code: "bg"),
        Flag(name: "Cambodia", code: "kh"),
        Flag(name: "Canada", code: "ca"),
        Flag(name: "Chile", code: "cl"),
        Flag(name: "China", code: "cn"),
        Flag(name: "Christmas Island", code: "cx"),
        Flag(name: "Cocos Islands", code: "cc"),
        Flag(name: "Colombia", code: "co"),
        Flag(name: "Costa Rica", code: "cr"),
        Flag(name: "Croatia", code: "hr"),
        Flag(name: "Cuba", code: "cu"),
        Flag(name: "Curaçao", code: "cw"),
        Flag(name: "Czechia", code: "cz"),
        Flag(name: "Denmark", code: "dk"),
        Flag(name: "Dominican Republic", code: "do"),
        Flag(name: "Ecuador", code: "ec"),
        Flag(name: "Estonia", code: "ee"),
        Flag(name: "Faroe Islands", code: "fo"),
        Flag(name: "Falkland Islands", code: "fk"),
        Flag(name: "Finland", code: "fi"),
        Flag(name: "France", code: "fr"),
        Flag(name: "Germany", code: "de"),
        Flag(name: "Gibraltar", code: "gi"),
        Flag(name: "Greece", code: "gr"),
        Flag(name: "Greenland", code: "gl"),
        Flag(name: "Guam", code: "gu"),
        Flag(name: "Guatemala", code: "gt"),
        Flag(name: "Hawaii", code: "hi"),
        Flag(name: "Hong Kong", code: "hk"),
        Flag(name: "Hungary", code: "hu"),
        Flag(name: "Iceland", code: "is"),
        Flag(name: "India", code: "in"),
        Flag(name: "Indonesia", code: "id"),
        Flag(name: "Iraq", code: "iq"),
        Flag(name: "Ireland", code: "ie"),
        Flag(name: "Israel & the West Bank", code: "il"),
        Flag(name: "Isle of Man", code: "im"),
        Flag(name: "Italy", code: "it"),
        Flag(name: "Japan", code: "jp"),
        Flag(name: "Jersey", code: "je"),
        Flag(name: "Jordan", code: "jo"),
        Flag(name: "Kazakhstan", code: "kz"),
        Flag(name: "Kyrgyzstan", code: "kg"),
        Flag(name: "Laos", code: "la"),
        Flag(name: "Latvia", code: "lv"),
        Flag(name: "Lebanon", code: "lb"),
        Flag(name: "Liechtenstein", code: "li"),
        Flag(name: "Lithuania", code: "lt"),
        Flag(name: "Luxembourg", code: "lu"),
        Flag(name: "Macau", code: "mo"),
        Flag(name: "Madeira", code: "mad"),
        Flag(name: "Malaysia", code: "my"),
        Flag(name: "Malta", code: "mt"),
        Flag(name: "Mexico", code: "mx"),
        Flag(name: "Monaco", code: "mc"),
        Flag(name: "Mongolia", code: "mn"),
        Flag(name: "Montenegro", code: "me"),
        Flag(name: "Netherlands", code: "nl"),
        Flag(name: "New Zealand", code: "nz"),
        Flag(name: "North Macedonia", code: "mk"),
        Flag(name: "Northern Mariana Islands", code: "mp"),
        Flag(name: "Norway", code: "no"),
        Flag(name: "Panama", code: "pa"),
        Flag(name: "Pakistan", code: "pk"),
        Flag(name: "Peru", code: "pe"),
        Flag(name: "Philippines", code: "ph"),
        Flag(name: "Pitcairn Islands", code: "pn"),
        Flag(name: "Poland", code: "pl"),
        Flag(name: "Portugal", code: "pt"),
        Flag(name: "Puerto Rico", code: "pr"),
        Flag(name: "Qatar", code: "qa"),
        Flag(name: "Romania", code: "ro"),
        Flag(name: "Russia", code: "ru"),
        Flag(name: "San Marino", code: "sm"),
        Flag(name: "Saint Pierre and Miquelon", code: "pm"),
        Flag(name: "Serbia", code: "rs"),
        Flag(name: "Singapore", code: "sg"),
        Flag(name: "Slovakia", code: "sk"),
        Flag(name: "Slovenia", code: "si"),
        Flag(name: "South Georgia and the South Sandwich Islands", code: "gs"),
        Flag(name: "South Korea", code: "kr"),
        Flag(name: "Spain", code: "es"),
        Flag(name: "Sri Lanka", code: "lk"),
        Flag(name: "Svalbard", code: "sj"),
        Flag(name: "Sweden", code: "se"),
        Flag(name: "Switzerland", code: "ch"),
        Flag(name: "Taiwan", code: "tw"),
        Flag(name: "Thailand", code: "th"),
        Flag(name: "Turkey", code: "tr"),
        Flag(name: "U.A.E", code: "ae"),
        Flag(name: "Ukraine", code: "ua"),
        Flag(name: "United Kingdom", code: "gb"),
        Flag(name: "United States", code: "us"),
        Flag(name: "Uruguay", code: "uy"),
        Flag(name: "US Minor Outlying Islands", code: "um"),
        Flag(name: "US Virgin Islands", code: "vi"),
        Flag(name: "Vanuatu", code: "vu")
    ]
    
    @State private var HusedFlags: [Flag] = []
    @State private var HcurrentFlag: Flag?
    @State private var HuserInput: String = ""
    @State private var HisCorrect: Bool?
    @State private var Hscore: Int = 0
    @State private var Hround: Int = 0
    @State private var HscorePercentage: Double = 0.0
    
    @State private var filteredFlags: [Flag] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.purple.opacity(0.4).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Guess the Flag").padding(.top)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("Correct Answer: \(Hscore) out of \(Hround): \(HscorePercentage, specifier: "%.2f")%").padding(.top)
                    
                    if let flag = HcurrentFlag, let imageUrl = URL(string: flag.imageURL) {
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 300)
                                        .shadow(radius: 1)
                                        .padding()
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 300)
                                        .foregroundColor(.red)
                                        .padding()
                                case .empty:
                                    ProgressView()
                                        .frame(height: 300)
                                        .padding()
                                @unknown default:
                                    EmptyView()
                            }
                        }
                        
                        VStack(spacing: 15) {
                            TextField("Enter country name", text: $HuserInput)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                                .autocapitalization(.words)
                                .padding(.horizontal)
                            
                            Button(action: {
                                checkAnswer()
                            }) {
                                Text("Submit")
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .onChange(of: HuserInput) { newValue in
                                        filteredFlags = flags.filter { $0.name.lowercased().contains(newValue.lowercased()) }
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                                if !filteredFlags.isEmpty {
                                                                List(filteredFlags, id: \.code) { flag in
                                                                    Text(flag.name)
                                                                        .onTapGesture {
                                                                            HuserInput = flag.name // Set the input to the selected flag's name
                                                                            filteredFlags.removeAll() // Clear the suggestions
                                                                        }
                                                                }
                                                                .frame(height: 200) // Set a fixed height for the list
                                                                .background(Color.white)
                                                                .cornerRadius(10)
                                                                .padding(.horizontal)
                                                            }
                            }
                            .padding(.horizontal)
                        }
                        
                        if let isCorrect = HisCorrect {
                            VStack(spacing: 15) {
                                Text(isCorrect ? "Correct!" : "Try again!")
                                    .font(.title2.bold())
                                    .foregroundColor(isCorrect ? .green : .red)
                                
                                Text("The correct answer is: \(flag.name)")
                                    .font(.title3.bold())
                                
                                Button(action: generateNewGame) {
                                    Text("New Game")
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(isCorrect ? .green : .red))
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
        // Reset the game if all flags have been used
        if HusedFlags.count == flags.count {
            resetGame()
        }
        
        // Filter out used flags to find available options
        let availableFlags = flags.filter { flag in
            !HusedFlags.contains { $0.id == flag.id }
        }
        
        // Select a new random flag from the available options
        guard let newFlag = availableFlags.randomElement() else { return }
        
        // Set the new current flag and mark it as used
        HcurrentFlag = newFlag
        HusedFlags.append(newFlag)
        
        // Clear the user input for the new game
        HuserInput = ""
        
        // Reset the answer status
        HisCorrect = nil
    }
    
    
    private func checkAnswer() {
        if HuserInput.lowercased() == HcurrentFlag?.name.lowercased() {
            HisCorrect = true
            Hscore += 1
        } else {
            HisCorrect = false
        }
        Hround += 1
        HscorePercentage = Double(Hscore) / Double(Hround) * 100
        HuserInput = "" // Clear the input field after submitting
    }
    
    private func resetGame() {
        Hscore = 0
        Hround = 0
        HusedFlags.removeAll()
        generateNewGame()
    }
    
}

#Preview {
    FlagsHard()
}
