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
        
        Flags()
        
    }
}




#Preview {
    ContentView()
}
