//
//  SecondCustomComposableViewFinal.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-29.
//

import SwiftUI

struct SecondCustomComposableViewFinal: View {
    
    //MARK: Stored Properties
    @Environment(\.scenePhase) var scenePhase
    
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
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
    
    //controls opacity of the progress bar
    @State var opacityAmount: CGFloat = 0
    
    //controls x offset of the progress bar
    @State var xOffset: CGFloat = -310
    
    //controls first interval between rounded rectangles
    let firstInterval: CGFloat = -30
    
    //controls spacings between rounded rectangles
    let interval: CGFloat = -18
    
    //controls height of the outer rounded rectangle
    let outerHeight: CGFloat = 35
    
    //MARK: Computed Properties
    //controls third push
    var thirdPush: Int {
        99 - firstPush - secondPush
    }
    
    var body: some View {
        VStack (spacing: 20) {
            
            //progress bar
            VStack {
                
                //outer background
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 310, height: outerHeight)
                
                //inner fill
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(
                                        gradient: Gradient(stops: [
                                            .init(color: Color("\(color)"), location: 0),
                                            .init(color: Color("\(color)").opacity(0.2), location: 0.15),
                                            .init(color: Color("\(color)"), location: 0.2),
                                            .init(color: Color("\(color)").opacity(0.2), location: 0.35),
                                            .init(color: Color("\(color)"), location: 0.4),
                                            .init(color: Color("\(color)").opacity(0.2), location: 0.55),
                                            .init(color: Color("\(color)"), location: 0.6),
                                            .init(color: Color("\(color)").opacity(0.2), location: 0.75),
                                            .init(color: Color("\(color)"), location: 0.8),
                                            .init(color: Color("\(color)").opacity(0.2), location: 0.95),
                                            .init(color: Color("\(color)"), location: 1)
                                        ]),
                                        startPoint: .trailing,
                                        endPoint: .leading))
                    .frame(width: 310, height: outerHeight)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(RadialGradient(
                                        gradient: Gradient(colors: [
                                            Color("\(color)"),
                                            Color("\(color)").opacity(0.5),
                                            Color("\(color)"),
                                            Color("\(color)").opacity(0.5),
                                            Color("\(color)"),
                                            Color("\(color)").opacity(0.5),
                                            Color("\(color)"),
                                            Color("\(color)").opacity(0.5),
                                            Color("\(color)")
                                        ]),
                                        center: .leading,
                                        startRadius: 20,
                                        endRadius: 300))
                    .frame(width: 310, height: outerHeight)
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color("\(color)"),Color("\(color)").opacity(0.2)]), startPoint: .trailing, endPoint: .leading))
                    .frame(width: 310, height: outerHeight)
                
            }
            
            
            //text
            ZStack {
                Text("Completed!")
                    .opacity(progress == 100 ? 1 : 0)
                
                Text("Almost Ready ...")
                    .opacity(progress >= 60 && progress < 100 ? 1 : 0)
                
                Text("Loading ...")
                    .opacity(progress < 60 ? 1 : 0)
            }
            .font(Font.custom("TimesNewRomanPS-BoldItalicMT", size: 30))
            .foregroundColor(Color.gray)
            
        }
    }
}

struct SecondCustomComposableViewFinal_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableViewFinal(color: "eggplant")
    }
}
