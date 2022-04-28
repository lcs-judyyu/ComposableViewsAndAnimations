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
    @State var firstPush = Int.random(in: 1...66)
    
    //controls second push
    @State var secondPush = Int.random(in: 1...32)
    
    //controls last push
    let lastPush: Int = 1
    
    //keep track of current progress
    @State var progress = 0
    
    //MARK: Computed Properties
    //controls third push
    var thirdPush: Int {
        99 - firstPush - secondPush
    }
    
    var body: some View {
        VStack (spacing: 50) {
            
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .frame(width: 320, height: 35)
            
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .frame(width: 70, height: 35)
                    .foregroundColor(Color("aquamarine"))
                    .offset(x: -140)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .frame(width: 50, height: 35)
                    .foregroundColor(Color.white)
                    .offset(x: -110)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .frame(width: 70, height: 35)
                    .foregroundColor(Color("aquamarine"))
                    .offset(x: -80)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .frame(width: 50, height: 35)
                    .foregroundColor(Color.white)
                    .offset(x: -50)
            }
            
            HStack {
                Image(systemName: "bubble.left").scaleEffect(2.5)
                Image(systemName: "drop").scaleEffect(2.5).rotationEffect(.degrees(180))
                Text("50%")
            }
            
            switch progress {
            case 100:
                Text("Completed!")
            case 60...99:
                Text("Almost Ready...")
            default:
                Text("Loading...")
            }
            
        }
    }
}

struct SecondCustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableView(color: "pink")
    }
}
