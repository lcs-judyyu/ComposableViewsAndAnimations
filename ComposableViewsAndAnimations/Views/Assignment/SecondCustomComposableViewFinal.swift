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
    
    //controls text
    @State var textVersion: CGFloat = 1
    
    //controls complete text
    @State var textOrder: CGFloat = 1
    
    // What is the color?
    let color: String
    
    //controls outer frame
    @State var outerFrame: CGFloat = 310
    
    //controls inner frame
    @State var innerFrame: CGFloat = 0
    
    //controls first push
    @State var firstPush = Int.random(in: 1...66)
    
    //controls second push
    @State var secondPush = Int.random(in: 1...32)
    
    //controls last push
    let lastPush: Int = 1
    
    //keep track of current progress
    @State var progress = 0
    
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
                ZStack (alignment: .leading) {
                    
                    //white background
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 310, height: outerHeight)
                    
                    ZStack (alignment: .trailing) {
                        
                        //white background
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(Color.white)
                            .frame(width: 310, height: outerHeight)
                        
                        //black background
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .frame(width: outerFrame, height: outerHeight)
                    }
                    
                    
                    //inner fill
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color("\(color)").opacity(2), location: 0),
                            .init(color: Color("\(color)").opacity(0.2), location: 0.95),
                        ]),
                                             startPoint: .trailing,
                                             endPoint: .leading))
                        .frame(width: innerFrame, height: outerHeight)
                        .onReceive(timer) { input in
                            
                            withAnimation(
                                Animation.easeInOut(duration: 1.1).delay(0.5)
                            ) {
                                innerFrame += CGFloat(firstPush) * 3.1
                                progress += firstPush
                                outerFrame -= CGFloat(firstPush) * 3.1 - 20
                            }
                            
                            withAnimation(
                                Animation.easeInOut(duration: 1.1).delay(1.7)
                            ) {
                                innerFrame += CGFloat(secondPush) * 3.1
                                progress += secondPush
                                outerFrame -= CGFloat(secondPush) * 3.1 - 20
                            }
                            
                            withAnimation(
                                Animation.easeInOut(duration: 1.1).delay(3.5)
                            ) {
                                innerFrame += CGFloat(thirdPush) * 3.1
                                progress += thirdPush
                                outerFrame -= CGFloat(thirdPush) * 3.1 - 20
                            }
                            
                            withAnimation(
                                Animation.easeInOut(duration: 1.1).delay(5.5)
                            ) {
                                innerFrame += CGFloat(lastPush) * 3.1
                                progress += lastPush
                                outerFrame -= CGFloat(lastPush) * 3.1 - 20
                            }
                            
                            // Stop the timer
                            timer.upstream.connect().cancel()
                            
                        }
                    
                }
            
            //text
            ZStack {
                HStack (spacing: 4) {
                    Text("Completed!")
                        .opacity(textOrder == 1 ? 1 : 0.2)
                }
                .opacity(progress == 100 ? 1 : 0)
                
                HStack (spacing: 4) {
                    Text("Almost Ready")
                    
                    Text(" .")
                        .opacity(textVersion == 1 ? 1 : 0.2)
                    
                    Text(" .")
                        .opacity(textVersion == 2 ? 1 : 0.2)
                    
                    Text(" .")
                        .opacity(textVersion == 3 ? 1 : 0.2)
                }
                .opacity(progress >= 60 && progress < 100 ? 1 : 0)
                
                HStack (spacing: 4) {
                    Text("Loading")
                    
                    Text(" .")
                        .opacity(textVersion == 1 ? 1 : 0.2)
                    
                    Text(" .")
                        .opacity(textVersion == 2 ? 1 : 0.2)
                    
                    Text(" .")
                        .opacity(textVersion == 3 ? 1 : 0.2)
                }
                .opacity(progress < 60 ? 1 : 0)
            }
            .font(Font.custom("TimesNewRomanPS-BoldItalicMT", size: 30))
            .foregroundColor(Color.gray)
            .onReceive(timer) { input in
                
                withAnimation(
                    Animation.easeInOut(duration: 0.6)
                        .repeatForever(autoreverses: false)
                ) {
                    
                    if textVersion == 3 {
                        textVersion = 1
                    } else {
                        textVersion += 1
                    }
                    
                    if textOrder == 2 {
                        textOrder = 1
                    } else {
                        textOrder += 1
                    }
                    
                }
                
            }
        }
    }
}

struct SecondCustomComposableViewFinal_Previews: PreviewProvider {
    static var previews: some View {
        SecondCustomComposableViewFinal(color: "eggplant")
    }
}
