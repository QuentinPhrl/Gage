//
//  HidingViews.swift
//  ProjetGameV2
//
//  Created by Quentin Puechguiral on 25/04/2021.
//

import SwiftUI

extension View {
    
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
