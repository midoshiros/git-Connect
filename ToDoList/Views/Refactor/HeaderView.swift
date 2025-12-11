//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ahmad Hamdy on 17/11/2025.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var subtitle: String
    var angle: Double
    var background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                          
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .bold()
                    
            }
            .padding(.top, 30)
            
          
        }
        .frame(width:  2500, height: 350)
        .offset(y: -120)
    }
}

#Preview {
    HeaderView(title: "To Do List",
               subtitle: "Get Things Done",
               angle: 15,
               background: .indigo)
}
