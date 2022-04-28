//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableView: View {
    var body: some View {
        VStack (spacing: 50) {
            
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .frame(width: 340, height: 30)
            
            Text("Loading")
                
        }
    }
}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView()
    }
}
