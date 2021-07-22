//
//  RulesView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 17/05/2021.
//

import SwiftUI

struct RulesView: View {
    
    @Binding var showBis : Bool
    
    var body: some View {
        ZStack
        {
            VStack{
                Text("Les règles")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                
                Text("Chaque joueur reçoit une carte avec un gage qu'il doit faire réaliser à la personne désignée, le tout, sans que cette dernière s'en rende compte.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Text("")
                Text("Dès que le joueur a réussi, la personne désignée est éliminée et le joueur récupère son gage.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
            }
            .frame(width: 215)
            .padding()
//            .background(Color("Color Secondary"))
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 4)
            )
        }
    }
}
