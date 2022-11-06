//
//  HomeView.swift
//  navigation
//
//  Created by Artem Tischenko on 6/11/2022.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    let store: StoreOf<Home>
    
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { store in
            Button("asd") {
                store.send(.navigate)
            }
        }
        
    }
}

public struct Home: ReducerProtocol {
    
    @Dependency(\.router) var router
    
    
    public struct State: Equatable  {
        public var color: Color = .white
    }
    
    public enum Action: Equatable {
        case navigate
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .navigate:
            router.tab = .search
            router.serchPath.append("From home")
        }
        return .none
    }
    
    
}
