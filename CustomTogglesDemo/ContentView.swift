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
            
            CustomToggle()
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


struct CustomToggle: View {
    @State private var isChecked : Bool = false
    var body: some View {
        Toggle(isOn: $isChecked) {
            Text("Airplane mode")
        }
        .toggleStyle(CustomToggleStyle(systemImage: "airplane", activeColor: .purple))
    }
}

struct CustomToggleStyle: ToggleStyle {
    
    var systemImage: String = "checkmark"
    var activeColor: Color = .green
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? activeColor : Color(.systemGray))
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .overlay {
                            Image(systemName: systemImage)
                                .foregroundColor(configuration.isOn ? activeColor : .red)
                        }
                        .offset(x: configuration.isOn ? 10 : -10)
                }
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
                        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
