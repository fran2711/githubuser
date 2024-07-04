//
//  AlertUIModel.swift
//  RickAndMorty
//
//  Created by Francisco Lucena on 23/4/24.
//

import Foundation
import SwiftUI

public struct AlertUIModel: Identifiable {
    public var id: String = UUID.init().uuidString
    public let title: String
    public let message: String?
    public let actions: [Action]
    
    public init(title: String, message: String? = nil, actions: [AlertUIModel.Action]? = nil) {
        self.title = title
        self.message = message
        self.actions = actions ?? []
    }
    
    public init(title: String, message: String? = nil, action: AlertUIModel.Action) {
        self.title = title
        self.message = message
        self.actions = [action]
    }
}

extension AlertUIModel {
    public struct Action {
        public enum ButtonType { case `default`, cancel, destructive }
        public let buttonType: ButtonType
        public let title: String?
        public let action: (() -> Void)?
        
        private init(buttonType: AlertUIModel.Action.ButtonType = .default, title: String?, action: (() -> Void)? = nil) {
            self.buttonType = buttonType
            self.title = title
            self.action = action
        }
        
        public static func `default`(title: String, action: (() -> Void)?) -> Action {
            self.init(buttonType: .default, title: title, action: action)
        }
        
        public static func cancel(title: String? = nil, action: (() -> Void)?) -> Action {
            self.init(buttonType: .cancel, title: title, action: action)
        }
        
        public static func destructive(title: String, action: (() -> Void)?) -> Action {
            self.init(buttonType: .destructive, title: title, action: action)
        }
    }

}

extension AlertUIModel.Action {
    
    var button: Alert.Button {
        switch buttonType {
        case .default: return .default(Text(title ?? ""), action: action)
        case .cancel:
            if let title = title {
                if let action = action {
                    return .cancel(Text(title), action: action)
                } else {
                    return .cancel(Text(title))
                }
            } else {
                if let action = action {
                    return .cancel(action)
                } else {
                    return .cancel()
                }
            }
        case .destructive: return .destructive(Text(title ?? ""), action: action)
        }
    }
}

extension AlertUIModel {
    var alert: Alert {
        .alert(title: title, message: message, actions: actions)
    }
}

extension Alert {
    
    public static func alert(title: String, message: String? = nil, actions: [AlertUIModel.Action] = []) -> Alert {
        let titleText = Text(title)
        let messageText: Text?
        if let message = message {
            messageText = Text(message)
        } else {
            messageText = nil
        }
        switch actions.count {
        case 0:
            return .init(title: titleText, message: messageText, dismissButton: nil)
        case 1:
            return .init(title: titleText, message: messageText, dismissButton: actions[0].button)
        default:
            return .init(title: titleText, message: messageText, primaryButton: actions[0].button, secondaryButton: actions[1].button)
        }
    }
}

struct AlertModifier: ViewModifier {
    
    let alert: Binding<AlertUIModel?>
    let myShown: Binding<Bool>
    
    init(alert: Binding<AlertUIModel?>) {
        self.alert = alert
        self.myShown = Binding(get: {
            alert.wrappedValue != nil
        }, set: { _ in
            alert.wrappedValue = nil
        })
    }
        
    func body(content: Content) -> some View {
        content.alert(item: alert) { model in
            model.alert
        }
    }
}

extension View {
    func alert(model alert: Binding<AlertUIModel?>) -> some View {
        modifier(AlertModifier(alert: alert))
    }
}
