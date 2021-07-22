//
//  DynamicGridView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 26/04/2021.
//

import SwiftUI

//Classe pour la liste dunamique

class ContentViewModel: ObservableObject {
    
    @Published var originalItems: [String] = []   //Var qui contient les nom saisie par le joueur.
    
    @Published var spacing: CGFloat = 8
    @Published var padding: CGFloat = 8
    @Published var wordCount: Int = 75
    @Published var alignmentIndex = 0
    
    var words: [String] {
        Array(originalItems.prefix(wordCount))
    }
    let alignments: [HorizontalAlignment] = [.leading]
    
    var alignment: HorizontalAlignment {
        alignments[alignmentIndex]
    }
    //Fonction qui supprimer un joueur sélectionner
    func remove(name: String) {
        let id = originalItems.firstIndex(of: name)
        originalItems.remove(at: id!)
        
    }
    
}

struct DynamicGridView: View {
    

    @ObservedObject var model: ContentViewModel
    
    var body: some View {
        
        VStack(){
            
            //Flexible créer par les vus FlexibleView et _FlexibleView
            FlexibleView(
                data: model.words,
                spacing: model.spacing,
                alignment: model.alignment
            ) { item in
                HStack(spacing:0){
                    Text(verbatim: item)
                        .foregroundColor(Color.black)
                        .font(.system(size: 13))
                    Button(action: {model.remove(name: item)})
                    {
                        Image(systemName:"xmark")
                            .font(.system(size: 13))
                            .foregroundColor(Color.gray)
                            .padding(.leading,5)
                    }
                    
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white))
                
            }
            
        }
        .padding(.horizontal,8)
        .padding(.bottom,3)
        
    }
    
}

