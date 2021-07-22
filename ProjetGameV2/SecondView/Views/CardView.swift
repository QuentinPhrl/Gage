//
//  CardView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 29/04/2021.
//

import SwiftUI

struct CardView: View {
    
    @Binding var tabAdvers : [[String]]
    @Binding var show : Bool
    @Binding var buffer : Int?
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns,spacing: 40){
            ForEach(tabAdvers, id: \.self) { item in
                
                Button(action: {
                    
                    buffer = tabAdvers.firstIndex(of: item)
                    
                    withAnimation(Animation.easeOut(duration: 0.3).delay(0.2)){
                        self.show.toggle()
                    }
                    
                },label: {
                    
                    HStack{
                        Text(verbatim: item[0])
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                    }
                    .frame(width:140,height:80)
                    .padding(.horizontal,10)
                    .background(
                            LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    //.background(Color("Color Secondary"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
                })
                
            }
        }
        .padding(15)
        
    }
}

struct CardDisplay : View {
    
    @Binding var buffer : Int?
    @Binding var tabAdvers : [[String]]
    @Binding var show : Bool
    @State private var successGage = true
    
    var body : some View{
        
        ZStack() {
            
            VStack{
                
                HStack{
                    Spacer()
                    Button(action: {
                        //                        show.toggle()
                        //                        successChaleng()
                        successGage.toggle()
                    },label: {
                        Image(systemName:"checkmark.seal.fill")
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .padding(20)
                    })
                    
                }
                Spacer()
            }
            .frame(width:440,height:280)
            
            VStack{
                
                Text(tabAdvers[buffer!][0])
                    .font(.system(size: 55))
                    .foregroundColor(Color.white)
                    .padding(.bottom,10)
                //Spacer()
                Text("\(tabAdvers[buffer!][2])\(tabAdvers[buffer!][1])")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(20)
            
            //            Message de confirmation.
            
            VStack{
                Text(tabAdvers[buffer!][0])
                    .font(.system(size: 55))
                    .foregroundColor(Color.white)
                    .padding(.bottom,10)
                
                Text("A-t-il réussi son gage ?")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .padding(.bottom,10)
                
                HStack{
                    Button(action: {
                        show.toggle()
                        successChaleng()
                    },label: {
                        Text("Oui")
                            .font(.system(size: 25,weight: .bold))
                            .frame(width:80,height:50)
                            .background(Color("Main"))
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        
                    })
                    .padding(.trailing,25)
                    
                    Button(action: {
                        successGage.toggle()
                    },label: {
                        Text("Non")
                            .font(.system(size: 25,weight: .bold))
                            .frame(width:80,height:50)
                            .background(Color.white)
                            .foregroundColor(Color("Color Tree"))
                            .cornerRadius(10)
                    })
                    .padding(.leading,25)
                    
                }
                Spacer()
                
            }
            .frame(width:400,height:240)
            //.background(Color("Color Secondary"))
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .isHidden(successGage)
            
        }
        .frame(width:440,height:280)
        
        //.background(Color("Color Secondary"))
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("Gradient1"), Color("Gradient2"), Color("Gradient2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 4)
        )
        .rotationEffect(.degrees(-90))
    }
    
    func successChaleng(){
        let elimPlayer = tabAdvers[buffer!][1]
        for y in 0..<tabAdvers.count {
            print(tabAdvers[y][1])
            if tabAdvers[y][0] == elimPlayer{
                
                tabAdvers[buffer!][1] = tabAdvers[y][1]
                tabAdvers[buffer!][2] = tabAdvers[y][2]
                tabAdvers.remove(at: y)
                break
            }
        }
        
        
    }
}
