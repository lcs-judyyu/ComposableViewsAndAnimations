//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI

struct SecondCustomComposableView: View {
    
    //MARK: Stored Properties
    let timer = Timer.publish(every: 1.2, on: .main, in: .common).autoconnect()
    
    // What is the color?
    let color: String
    
    //controls position
    @State var offset: CGFloat = 0
    
    //controls first push
    @State var firstPush = Int.random(in: 1...33)
    
    //controls second push
    @State var secondPush = Int.random(in: 1...33)
    
    //controls third push
    @State var thirdPush = Int.random(in: 1...33)
    
    //MARK: Computed Properties
    //controls last push
    var lastPush: Int {
        100 - firstPush - secondPush - thirdPush
    }
    
    var body: some View {
        VStack (spacing: 50) {
            
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .frame(width: 320, height: 35)
            
            HStack {
                Image(systemName: "bubble.left")
                Image(systemName: "drop")
                Text("50%")
            }
            
            Text("Loading...")
            Text("Almost Ready...")
            Text("Completed!")
                
        }
    }
}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView(color: "pink")
    }
}
