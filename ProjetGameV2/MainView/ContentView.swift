//
//  ContentView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var showDelay = false
    @State var disable = true
    
    @StateObject var model = ContentViewModel()
    
    @State var tabAdvers : [[String]] = [[]]
    @State var nextView = false
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    NavigationLink(destination: ContentSecondView(tabAdvers: self.$tabAdvers),isActive: self.$nextView){}
                        
                    Spacer()
                    DynamicGridView(model: model)
                    HStack{
                        //Spacer()
                        ParameterView(show: self.$show,showDelay: self.$showDelay)
                        .padding(.trailing,5)
                        .padding(.leading,12)
                        //                                    Parametre show, permet d'afficher le menu paramétre
                        //                                    Paramete ship, permet de faire disparaitre le champ de texte
                        
                        
                        TextFieldView(model: model)
                        
                        Button(action: {
                            if model.originalItems.count > 3{
                                tabAdvers = self.SelectAdv()
                                self.nextView = true
                                setGage()
                            }
                            
                            
                        }){
                            Image(systemName: "arrow.right.square.fill")
                                .font(.system(size: 30))
                                .foregroundColor(Color("Color Tree"))
                            
                        }
                        .padding(.trailing,8)
                        .padding(.leading,8)
                        Spacer()
                        
                    }
                    
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color("Color Text")))
                    .border(width: 1, edges: [.bottom], color: Color("Color Four"))  //Permet de faire des border que d'un coté. 
                    
                }
                .isHidden(showDelay)
                .background(Image("back2_logo").resizable().edgesIgnoringSafeArea(.all))
                
            //Permet l'affichage de la popup des parametres
            
                if self.show{
                
                GeometryReader{geometry in
                    MenuSetting(enable: self.$disable)
                        .position(x: geometry.size.width / 2, y: (geometry.size.height / 2)-70)
                }.background(
                    
                    Color.black.opacity(0.7)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            
                            withAnimation(){
                                
                                self.showDelay.toggle()
                                self.show.toggle()
                              
                            }
                            
                            
                        }
                        //.allowsHitTesting(disable)
                )
            }
            //_________________________________________________________
            }
            
        }
        
        
    }
    
    func SelectAdv() -> [[String]]{
        
        //La logique de la fonctione
        //On récupére la liste des joueurs
        //On melange cette liste.
        //On copy la liste des joueurs dans un autre tableau dans le quel on passe le dernir joueur en premier dans la liste
        //Chaque joueur à donc un adversaire que ne peut pas être lui même
        //On ajoute les deux tableau dans un tableau double se qui forme des sous tableau de pairs de joueur/adeversaire
        //Puis nous remelangeons le tableau double de sorte qu'aucun parterne de ressorce à l'affichage
        
        var melan : [String] = model.originalItems
        var tabAdvers = [[String]]()                    //On créer un tableau multiple
        melan.shuffle()                                 //On melanche la liste des joueurs
        
        for i in 0 ..< melan.count {                    //On ajoue dans le table double les joueur
            var add = [String]()
            add.append(melan[i])
            tabAdvers.append(add)
        }
        
        melan.insert(melan[melan.count-1], at: 0)       //On copie le dernier joueur en premier dans le tableau
        let _ = melan.popLast()                         //On supprime l'element copie de la dernière place.
        
        for i in 0 ..< melan.count {                    //Puis on copie dans le tableau double ce tableau qui représente les adversaires des joueurs
            tabAdvers[i].append(melan[i])
        }
       
        tabAdvers.shuffle()                             //On melanche le tableau double
    
        return tabAdvers
        
    }
    
    func setGage() {
        
        var db = data()
        
        db.gage.shuffle()
        
        for i in 0 ..< tabAdvers.count {                    //Puis on copie dans le tableau double ce tableau qui représente les adversaires des joueurs
            tabAdvers[i].append(db.gage[i])
        }
        
        
    }
    
}
