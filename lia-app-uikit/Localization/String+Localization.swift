//
//  String+Localization.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-14.
//

import Foundation

extension String {
    // Method to fetch a localized string and format it with arguments if provided.
    func localizedWithFormat(_ args: [CVarArg] = []) -> String {
        guard let localizedClosure = Localization.localized else {
            fatalError("Localization is not connected properly.")
        }
        let localizedString = localizedClosure(self)
        return String(format: localizedString, arguments: args)
    }

    // Computed property to fetch a localized string.
    var localized: String {
        guard let localizedClosure = Localization.localized else {
            fatalError("Localization is not connected properly.")
        }
        return localizedClosure(self)
    }
}
