//
//  AlertFactory.swift
//  navigation
//
//  Created by Artem Tischenko on 8/11/2022.
//

import SwiftUI
import ComposableArchitecture

struct AlertFactory: View {
    
    @Binding var item: AlertItem
    let store: StoreOf<AlertReducer>
    
    @ViewBuilder
    var body: some View {
        WithViewStore(store, observe: {$0}) { state in
            Group {
                switch item.alertModel {
                case let model as ErrorAlert:
                    Spacer()
                        .alert(model.title,
                               isPresented: .constant(state.show),
                               actions: {
                                            Button("Close") {
                                                state.send(.close)
                                            }
                                        },
                                message: { Text(model.description) })
                default:
                    EmptyView()
                }
                
            }.onDisappear {
                state.send(.close)
            }
        }
    }
}


///MODELS:
public struct AlertItem: Identifiable {
    public let id: UUID = .init()
    public let alertModel: AnyObject?
    
    static let none: AlertItem = AlertItem(alertModel: nil)
}

public struct ErrorAlert {
    public let title: String
    public let description: String
    public var didFinished: (()->Void)?
}


public struct AlertReducer: ReducerProtocol {
    
    @Dependency(\.router) var router
    
    public struct State: Equatable  {
        var show: Bool
    }
    
    public enum Action: Equatable {
        case close
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .close:
            router.alert = .none
            state.show.toggle()
        }
        return .none
    }
    
    
}
