//
//  SuccessView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 18/05/2021.
//

import SwiftUI

struct SuccessView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var tabAdvers : [[String]]
    
    var body: some View {
        
        ZStack() {
            
            VStack{
                
                HStack{
                    Spacer()
                    Button(action: {
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    },label: {
                        Image(systemName:"xmark")
                            .font(.system(size: 20))
                            .padding(.top,15)
                            .padding(.trailing,15)
                            .foregroundColor(Color.white)
                    })
                    
                }
                
                Text("Bravo \(tabAdvers[0][0])")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("Tu gagnes tout le respect du développeur.")
                    .padding()
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    
                
                Spacer()
            }
            .frame(width:300,height:200)
            
        }
        .frame(width:300,height:200)
        //.background(Color("Color Secondary"))
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 4)
        )
        
    }
}

