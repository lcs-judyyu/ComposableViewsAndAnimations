//
//  SecondCustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Judy Yu on 2022-04-28.
//

import SwiftUI
struct Intervals: Hashable, Identifiable {
    let id: UUID
    let numberOfIntervals: [CGFloat] =  [0.0,1.0,3.0,4.0,6.0,7.0,9.0,10.0,12.0]
}

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
        VStack (spacing: 50) {
            
            ZStack {
                //outer background
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 310, height: outerHeight)
                
                //from left to right
                Group {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color.white)
                        .offset(x: 120 + firstInterval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120 + firstInterval + interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color.white)
                        .offset(x: 120 + firstInterval + 3 * interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120 + firstInterval + 4 * interval)
                }
                
                Group {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color.white)
                        .offset(x: 120 + firstInterval + 6 * interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120 + firstInterval + 7 * interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color.white)
                        .offset(x: 120 + firstInterval + 9 * interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color("aquamarine"))
                        .offset(x: 120 + firstInterval + 10 * interval)
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor(Color.white)
                        .offset(x: 120 + firstInterval + 12 * interval)
                }
                
                //end
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 47, height: outerHeight)
                    .foregroundColor(Color("aquamarine"))
                    .offset(x: -133)
                
            }
            
            ZStack {
                
                ForEach([0.0,1.0,3.0,4.0,6.0,7.0,9.0,10.0,12.0], id: \.self) {

                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .frame(width: 70, height: outerHeight)
                        .foregroundColor($0.truncatingRemainder(dividingBy: 3) == 0 ? Color.white : Color("aquamarine"))
                        .offset(x: 120 + firstInterval + $0 * interval)
                }
                
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
