//
//  SwiftUIView.swift
//  navigation
//
//  Created by Artem Tischenko on 6/11/2022.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    let store: StoreOf<Search>
    

    @EnvironmentObject var router: Router

    var body: some View {
        WithViewStore(store, observe: { $0 }) {
            store in
            
            VStack {
                Spacer()
                
                Text ("Search")
                Spacer()
                Button("Go Home") {
                    store.send(.navigate)
                }
                Spacer()
                
            }
        }
    }
}

public struct Search: ReducerProtocol {
    
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
            router.tab = .home
            router.homePath.append("From search")
            router.homePath.append("From Second")
        }
           return .none
       }

   
}

extension DependencyValues {
  public var router: Router {
    get { self[Router.self] }
    set { self[Router.self] = newValue }
  }

    private enum RouterGeneratorKey: DependencyKey {
        static let liveValue: @Sendable () -> Router =  {
            Router.liveValue
        }
  }
}
