//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    //MARK: Stored Properties
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    //MARK: Computed Properties
    
    var body: some View {
        ZStack {
            Circle()
        }
        .animation(
            Animation.easeInOut(duration: 2)
                .repeatForever(autoreverses: true)
        )
        .onReceive(timer) { input in
            timer.upstream.connect().cancel()
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
