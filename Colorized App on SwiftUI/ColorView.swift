//
//  ColorView.swift
//  Colorized App on SwiftUI
//
//  Created by Сергей Кудинов on 12.09.2021.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let blue: Double
    let green: Double
    let opacity: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 150)
            .foregroundColor(Color(red: red, green: green, blue: blue))
            .opacity(opacity)
            .cornerRadius(15)
            .shadow(color: .black, radius: 23)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 0.33, blue: 0.73, green: 0.12, opacity: 12)
    }
}
