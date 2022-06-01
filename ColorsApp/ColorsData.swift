//
//  Data.swift
//  ColorsApp
//
//  Created by Osher Yeffet on 01/06/2022.
//
import Foundation
import UIKit
// swiftlint:disable line_length identifier_name colon

class ColorsData: Codable {
    var color_name: String
    var color_values: [String: Double]
    var color_description: String
    var color_meaning: String

    init(color_name: String, color_values: [String: Double], color_description:String, color_meaning: String) {
        self.color_name = color_name
        self.color_values = color_values
        self.color_description = color_description
        self.color_meaning = color_meaning
    }
}

//    let url = URL(string: "https://raw.githubusercontent.com/OwnHealthIL/ios-internship-final-exam-osher-yeffet/master/colors.json?token=GHSAT0AAAAAABVB2JJGURDZDECNMR3WKR7WYUXG6BQ")
//
