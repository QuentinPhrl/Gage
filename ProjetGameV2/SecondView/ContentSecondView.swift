//
//  ContentSecondView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 27/04/2021.
//

import SwiftUI

struct ContentSecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var closeView = false
    @Binding var tabAdvers : [[String]]
    @State var show = false
    @State var buffer : Int?
    
    var body: some View {
        ZStack{
            ScrollView{
                
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {closeView = true})
                        {
                            Image(systemName:"xmark")
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .padding(.trailing,20)
                        }
                    }
                    .padding(10)
                    
                    CardView(tabAdvers: self.$tabAdvers, show: self.$show,buffer: self.$buffer)
                    
                }
            }
            .background(Image("back2").resizable().edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            //Affiche une alerte avant de quitter
            .alert(isPresented: $closeView) {
                Alert(title: Text("Êtes-vous sûr de vouloir quitter la partie ?"), message: Text("Tout les gages attribué seront perdu") , primaryButton: .destructive(Text("Oui")){
                    self.presentationMode.wrappedValue.dismiss()        //ferme la view
                }, secondaryButton: .cancel(Text("Non")))
            }
            
            //_________________________________________
            if self.show{
                
                GeometryReader{geometry in
                    CardDisplay(buffer: self.$buffer, tabAdvers: self.$tabAdvers,show: self.$show)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }.background(
                    
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            
                            withAnimation(){
                        
                                self.show.toggle()
                            }
                            
                        }
                )
            }
            
            //_________________________________________
            
            if tabAdvers.count == 1{
                
                GeometryReader{geometry in
                    SuccessView(tabAdvers: self.$tabAdvers)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }.background(
                    
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                )
            }
            
        }
        
    }
}

