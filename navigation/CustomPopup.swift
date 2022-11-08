//
//  CustomPopup.swift
//  navigation
//
//  Created by Artem Tischenko on 8/11/2022.
//

import SwiftUI

struct CustomPopup: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            Spacer()
            Text(title)
                .font(.title)
            Text(title)
            Spacer()
        }
     
    }
}
