//
//  HomeView.swift
//  navigation
//
//  Created by Artem Tischenko on 6/11/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var router: Router

    var body: some View {
        Button("asd") {
            router.tab = .search
            router.serchPath.append("test")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
