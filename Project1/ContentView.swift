//
//  ContentView.swift
//  Project1
//
//  Created by s15 on 01/10/24.
//

import SwiftUI
import RadioButton



struct ContentView: View {
	
    
	
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.orange.opacity(0.4).edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    NavigationLink(destination: Flags()) {
                        Text("Easy Version")
                            .font(.title)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                            .foregroundColor(.white)
                    }
                    
                    NavigationLink(destination: FlagsHard()) {
                        Text("Difficult Version")
                            .font(.title)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                            .foregroundColor(.white)
                    }
                }
                .navigationTitle("GUESS THE FLAG")
                .padding()
            }
        }
    }
}




#Preview {
    ContentView()
}
