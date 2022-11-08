//
//  Navigation.swift
//  navigation
//
//  Created by Artem Tischenko on 8/11/2022.
//

import ComposableArchitecture
import SwiftUI

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

public class Router: ObservableObject, DependencyKey {
    public static var liveValue: Router = Router()
    
    private init() {}
    
    @Published var homePath = NavigationPath()
    @Published var serchPath = NavigationPath()
    @Published var tab = Tabs.home
    
    
    @Published var popup: PopUpItem?
    @Published var alert: AlertItem = .none
}

enum Tabs {
    case home
    case search
    case profile
}
