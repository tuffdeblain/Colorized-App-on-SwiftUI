//
//  ContentView.swift
//  Colorized App on SwiftUI
//
//  Created by Сергей Кудинов on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue: Double = 0
    @State private var greenSliderValue: Double = 0
    @State private var blueSliderValue: Double = 0
    @State private var alertPresented = false
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                ColorView(red: $redSliderValue, blue: $greenSliderValue, green: $blueSliderValue, opacity: 2)
                    .padding()
                ColorSlider(value: $redSliderValue, alertPresented: $alertPresented, color: .red)
                ColorSlider(value: $greenSliderValue, alertPresented: $alertPresented, color: .green)
                ColorSlider(value: $blueSliderValue, alertPresented: $alertPresented, color: .blue)
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
    @Binding var alertPresented: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white)
                .frame(width: 40)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: {
                if 0...255 ~= value {
                    return
                } else {
                    alertPresented.toggle()
                    value = 0
                }
                })
            .bordered()
            .disableAutocorrection(true)
            .textContentType(.oneTimeCode)
            .multilineTextAlignment(TextAlignment.center)
            .background(Color.white)
            .frame(width: 63, height: 35, alignment: .center)
            .alert(isPresented: $alertPresented, content: {
                Alert(title: Text("Wrong Format"), message: Text("Please enter another"))
            })
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
