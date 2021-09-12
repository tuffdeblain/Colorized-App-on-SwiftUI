//
//  ColorView.swift
//  Colorized App on SwiftUI
//
//  Created by Сергей Кудинов on 12.09.2021.
//

import SwiftUI

struct ColorView: View {
    @Binding var red: Double
    @Binding var blue: Double
    @Binding var green: Double
    let opacity: Double
    
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 150)
            .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
            .opacity(opacity)
            .cornerRadius(15)
            .shadow(color: .black, radius: 23)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: .constant(0.33), blue: .constant(0.33), green: .constant(0.22), opacity: 12)
    }
}
