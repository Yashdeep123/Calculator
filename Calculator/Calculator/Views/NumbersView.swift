//
//  NumbersView.swift
//  Calculator
//
//  Created by Yash Patil on 24/09/22.
//

import SwiftUI

struct NumbersView: View {
    
    let number : String
    let backgroundColor : Color
   
    var body: some View {
        
        VStack {
           
            Text(number)
                .font(.custom("Scaled number", fixedSize: 40))
                .frame(width: 50,height: 50)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(
                    Circle().foregroundColor(backgroundColor)
                )
        }
            
            
            
    }
}

struct NumbersView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersView(number: "9",backgroundColor: .yellow)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
