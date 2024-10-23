//
//  ContentView.swift
//  Project1
//
//  Created by s15 on 01/10/24.
//

import SwiftUI
import RadioButton



struct ContentView: View {
	
    private var elenco:[String] = [
        "andorra",
        "ua",
        "qualcosa",
        "testo4"
    ]
	
    enum City: String, CaseIterable, Identifiable {
        case milano
        case roma
        case palermo
        case napoli
        
        var id: RawValue {
            rawValue
        }
    }
    @State var selectedColor = ""
    
    @State private var city = City.milano
    
    
	var title = ""
	
    var body: some View {
        
        @State var imageURL = ""
        VStack(spacing: 16){
            Text("Guess The Flag").font(.largeTitle).padding(.bottom)
                
            Rectangle()
                .fill(.gray.opacity(0.1))
                .overlay(
                    AsyncImage(
                        url: URL(string: "https://flagcdn.com/h240/ua.png"))
                    
                )
                .frame(height: 240)
                .padding(.horizontal)
                .padding(.top, 30)
            Spacer()
            VStack(spacing: 12){
                RadioButton(title: title,
                            itemTitle: \.rawValue,
                            isSelected: $city)
            }.padding(.horizontal)
            Spacer()
            
        }
        
    }
}




#Preview {
    ContentView()
}
