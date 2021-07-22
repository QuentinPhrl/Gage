//
//  ParameterView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 24/04/2021.
//

import SwiftUI

struct ParameterView: View {
    
    @Binding var show : Bool
    @Binding var showDelay : Bool
    
    var body: some View {
        
        Button(action: {
            
            //                withAnimation(Animation.easeOut(duration: 0.3).delay(0.2)){
            self.show.toggle()
            //                }
            
            //                withAnimation(Animation.easeOut(duration: 0.1)){
            self.showDelay.toggle()
            //                }
            
        },label: {
            Image(systemName: "gearshape.fill")
        })
        .foregroundColor(Color("Color Tree"))
        .font(.system(size: 25))
        
    }
}

//Menu Setting

struct MenuSetting : View {
    
    @State var showBis = false
    @Binding var enable : Bool 
    
    var body : some View{
        ZStack{
            VStack{
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Button(action: {
                        self.enable.toggle()
                        self.showBis.toggle()
                    }) {
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white)
                                .padding(.horizontal,4)
                            
                            Text("Les règles")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "flag.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white)
                                .padding(.leading,3)
                            
                            Text("Langue")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white)
                            
                            Text("Contactez-nous")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "star.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color.white).padding(1)
                            
                            Text("Noter Gage")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                    }
                    
                }
                .frame(width: 215)
                .padding()
                //.background(Color("Color Secondary"))
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 4)
                )
                
            }
            
            if self.showBis{
                
                GeometryReader{geometry in
                    RulesView(showBis: self.$showBis)
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2))
                }.background(
                    
                    Color.black.opacity(0.00000000000001)     //Obliger de mettre une opacité puisque une veleur ne permet ne fonctionne pas.
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            
                            withAnimation(Animation.easeOut(duration: 0.1)){
                                
                                self.showBis = false
                                
                                
                                
                            }
                            
                            
                        }
                )
                
                
            }
        }
        
        
    }
}


