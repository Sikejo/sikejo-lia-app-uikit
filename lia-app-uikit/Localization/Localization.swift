//
//  Localization.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-14.
//

import Foundation

import Foundation

public enum Localization {
    // Fetching strings from the Localizable.strings files.
    public static var localized: ((String) -> String)? = { key in
        return NSLocalizedString(key, comment: "")
    }
}
