//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    This is a loading view that animations rotations, movements, and changes in the sizes of four circles.
                    
                    Enter a phrase in the text field below.
                    """)
                
                TextField("What is loading?", text: $phrase)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(message: phrase)) {
                    SimpleListItemView(title: "Loading . . .",
                                       caption: "What is loading? \(phrase)")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
