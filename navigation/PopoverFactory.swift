//
//  PopupFactory.swift
//  navigation
//
//  Created by Artem Tischenko on 8/11/2022.
//

import SwiftUI

//Здесь должен происходить маппинг всех Popover к Model
struct PopoverFactory: View {
    
    let item: PopUpItem
    
    @ViewBuilder
    var body: some View {
        switch item.popUpModel {
        case let item as OnboardingPopup:
            CustomPopup(title: item.title, description: item.description)
        default:
            EmptyView()
        }
    }
    
}

///MODELS:

public struct PopUpItem: Identifiable {
    public let id: UUID = .init()
    public let popUpModel: AnyObject
}

public struct OnboardingPopup {
    public let title: String
    public let description: String
    public var didFinished: (()->Void)?
}


