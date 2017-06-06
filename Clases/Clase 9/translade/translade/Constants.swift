//
//  Constants.swift
//  translade
//
//  Created by Mauricio Rojas Vindas on 1/6/17.
//  Copyright © 2017 Mauricio Rojas Vindas. All rights reserved.
//

import Foundation

struct Constants {
    static let API_KEY = "NXrPcrRP7ImshGC3WtYKTWhgLT6Hp1ITgE0jsncYik9Kxxjjhm"
    static let API_URL = "https://gybra-trans-lator.p.mashape.com/"
    static let DIRS_KEY = "dirs"
    static let LENGUAGE_KEY = "langs"
    static let LENGUAGES_ARRAY_KEY = "LENGUAGES_ARRAY_KEY"
    static let GET_LENGUAGES_NOTIFICATION = "GET_LENGUAGES_NOTIFICATION"
    static let ERROR_FOUND_NOTIFICATION = "ERROR_FOUND_NOTIFICATION"
    static let GET_TRANSLATE_NOTIFICATION = "GET_TRANSLATE_NOTIFICATION"
    static let TRANSLATE_RESULT_KEY = "TRANSLATE_RESULT_KEY"
    static let TEXT_TRANSLATED_KEY = "text"
    static let API_HEADER_HEY = "X-Mashape-Key"
    
    enum LanguageType: Int {
        case origin = 0, destination
    }
}
