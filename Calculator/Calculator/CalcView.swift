//
//  ContentView.swift
//  Calculator
//
//  Created by Yash Patil on 24/09/22.
//

import SwiftUI

struct CalcView: View {
    
    @EnvironmentObject private var vm : LogicModel

    var body: some View  {
        
        VStack(spacing:15) {
            
            Spacer()
            
            LazyVStackView
            allButtonsView
            
          }
            
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalcView()
            .preferredColorScheme(.dark)
            .environmentObject(LogicModel())
            
            
    }
}


extension CalcView {

    
    private var LazyVStackView : some View {
        
        LazyVStack(alignment: .trailing)  {
            TextField("", text: $vm.DisplayText)
                .font(.custom("N", size: 70))
                .fontWeight(.thin)
        }
    }
    
    private var allButtonsView : some View {
        
        ForEach(vm.allOperators,id:\.self) { column in
            HStack(spacing:15) {
                ForEach(column,id:\.self) { row in
                    Button {
                        vm.Calculation(item: row)
                    } label: {
                        
                        if let IntVariable: Int = Int(row.rawValue) {
                            
                            NumbersView(number: String(IntVariable),backgroundColor: Color( #colorLiteral(red: 0.385748744, green: 0.41628021, blue: 0.3742245734, alpha: 1)))
                        }
                        else {
                            NumbersView(number: row.rawValue,backgroundColor: Color(#colorLiteral(red: 0.9131908417, green: 0.6342167854, blue: 0, alpha: 1)))
                        }
                    }
                   
                    
                }
            }
        }
    }
        
        
    
    
    
}
