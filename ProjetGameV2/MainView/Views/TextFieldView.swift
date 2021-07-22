//
//  TextFieldView.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 22/04/2021.
//

import SwiftUI
import AudioToolbox

struct TextFieldView: View {
    
    @State var text : String = ""
    @State private var showingAlert = false
    @ObservedObject var model: ContentViewModel
    
    var body: some View {
        
        HStack{
            
            CustomTextField(text: $text,isFirstResponder: true)
                .frame(height:60)
        
            Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    set()
                }
                
            },label: {
                Image(systemName: "plus.square.fill")
            })
            .font(.system(size: 30))
            .foregroundColor(Color("Color Secondary"))
        }
        .alert(isPresented: $showingAlert) {
        Alert(title: Text("Attention jeune fou"), message: Text("Pour que le jeu se déroule au mieux dégage un poteà toi"), dismissButton: .default(Text("Ok un pote en moins")))
        }
        
    }
    
    func set(){
        if model.originalItems.contains(self.text) {
            
            self.showingAlert = true
            
        }else if (self.text.count >= 2) {
            
            model.originalItems.append(self.text)  //On ajoute la nouvelle variable dans le variableoriginalItems
            self.text = ""                          //On efface le champ

            
        }
    }
    
}

//Creation d'un textfield custom pour pouvoir un champ focus dès l'ouverture de la vu

struct CustomTextField: UIViewRepresentable {
    
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var didBecomeFirstResponder = false
        
        init(text: Binding<String>) {
            _text = text
            
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
            if text.count > 20{   //Limite le nombre d'entrer dans le champ à 20
                
                textField.text?.removeLast()  //Supprime le dernier charatère
                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { return }  //Fait vibrer le téléphone
            }
        }
        
    }
    
    
    @Binding var text: String
    var isFirstResponder = false
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.keyboardAppearance = UIKeyboardAppearance.dark    //Clavier en mode sombre
        textField.textColor = UIColor.white                         //Couleur de text
        textField.attributedPlaceholder =
            NSAttributedString(string: "Ajouter une joueur", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])

        return textField
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

