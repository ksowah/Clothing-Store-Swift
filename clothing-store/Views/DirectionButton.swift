//
//  DirectionButton.swift
//  clothing
//
//  Created by macbook on 26/03/2025.
//

import SwiftUI

struct DirectionButton: View {
    
    enum BtnType {
        case Next
        case Back
    }
    
    var btnType: BtnType
    
    var body: some View {
        VStack {
            Image(systemName: btnType == .Next ? "arrowshape.turn.up.right.fill" : "arrowshape.turn.up.backward.fill")
                .imageScale(btnType == .Next ? .medium : .small)
                .foregroundColor(.white)
        }
        .frame(width: btnType == .Next ? 50 : 40,height: btnType == .Next ? 50 : 40)
        .background(.black)
        .clipShape(Circle())
    }
}

struct DirectionButton_Previews: PreviewProvider {
    static var previews: some View {
        DirectionButton(btnType: .Back)
    }
}
