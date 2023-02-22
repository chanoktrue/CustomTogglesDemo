//
//  ContentView.swift
//  CustomTogglesDemo
//
//  Created by Thongchai Subsaidee on 21/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            BasicToggle()
            
            ChangingTogleStyle()
        }
        .padding()
    }
}


struct BasicToggle: View {
    @State private var isEnabled = false
    var body: some View {
        
        
        Toggle("Airplane Mode", isOn: $isEnabled)
        
        Toggle(isOn: $isEnabled) {
            Text("Airplance mode")
                .font(.system(.title))
                .fontDesign(.rounded)
                .bold()
        }
        
        
        Toggle(isOn: $isEnabled) {
            HStack {
                Text("Airplane mode")
                Image(systemName: "airplane")
            }
            .font(.system(size: 20))
        }
    }
}


struct ChangingTogleStyle: View {
    @State private var isBookMarked = false
    var body: some View {
        Toggle(isOn: $isBookMarked) {
            Image(systemName: isBookMarked ? "bookmark.fill" : "bookmark")
                .font(.system(size: 50))
        }
        .tint(.green)
        .toggleStyle(.button)
        .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
