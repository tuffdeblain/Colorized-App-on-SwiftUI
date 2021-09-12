//
//  ContentView.swift
//  Colorized App on SwiftUI
//
//  Created by Сергей Кудинов on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                ColorView(red: 0.5, blue: 0.3, green: 0.2, opacity: 2)
                    .padding()
                ColorSlider(value: $redSliderValue, color: .red)
                ColorSlider(value: $greenSliderValue, color: .green)
                ColorSlider(value: $blueSliderValue, color: .blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ColorSlider: View {
    @Binding var value: Double
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", value: $value, formatter: NumberFormatter())
                .bordered()
                .multilineTextAlignment(TextAlignment.center)
                .background(Color.white)
                .frame(width: 63, height: 35, alignment: .center)
                
        }
        .padding(.horizontal)
    }
    
}
struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
