//
//  File.swift
//  
//
//  Created by Francisco Lucena on 4/7/24.
//

import Foundation

public class Logger {

    static let printLevel: LogLevel = .info

    public static func log(_ level: LogLevel, _ context: Context, message: String) {
        if level.rawValue >= printLevel.rawValue {
            print("[\(level.emoji)][\(context.rawValue)] \(message)")
        }
    }
}

extension Logger {

    public enum LogLevel: Int {
        case info
        case debug
        case warning
        case error

        var emoji: String {
            switch self {
            case .info: return "ℹ️"
            case .debug: return "🐞"
            case .warning: return "⚠️"
            case .error: return "⛔️"
            }
        }
    }

    public enum Context: String {
        case repository = "📦"
    }
}
