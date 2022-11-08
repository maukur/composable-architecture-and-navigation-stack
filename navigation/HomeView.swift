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
            VStack {
                Spacer()
                Button("popup") {
                    store.send(.popup("Custom Popup"))
                }
                Button("alert") {
                    store.send(.alert("Error Alert"))
                }
                Spacer()
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
        case popup(String)
        case alert(String)
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .navigate:
            router.tab = .search
            router.serchPath.append("From home")
        case .popup(let str):
            let model = OnboardingPopup(title: str, description: "Onboardin description") as AnyObject
            router.popup = PopUpItem(popUpModel: model)
        case .alert(let str):
            let alertModel = ErrorAlert(title: str, description: "") as AnyObject
            router.alert = AlertItem(alertModel: alertModel)
        }
        return .none
    }
    
    
}
