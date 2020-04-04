//
//  CharacterProfile.swift
//  TheSimpsons
//
//  Created by Gavin Li on 4/3/20.
//  Copyright © 2020 Gavin Li. All rights reserved.
//

import UIKit

class CharacterProfile: Decodable {
    var Result: String
    var FirstURL: String
    var Text: String
    var Icon: Icon
    
    init(result: String, firstUrl: String, text: String, icon: Icon) {
        Result = result
        FirstURL = firstUrl
        Text = text
        Icon = icon
    }
    
    func getFullName() -> String {
        let firstDash = Text.firstIndex(of: "-") ?? Text.startIndex
        let name = Text[..<firstDash]
        return name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func getDescription() -> String {
        if let dashIndex = Text.firstIndex(of: "-") {
            if dashIndex < Text.endIndex {
                let desc = Text[Text.index(after: dashIndex)..<Text.endIndex]
                return desc.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
        return Text
    }
    
    static func getImageFromWeb(_ urlString: String, closure: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: urlString) else {
            return closure(nil)
        }
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return closure(nil)
            }
            guard response != nil else {
                print("no response")
                return closure(nil)
            }
            guard data != nil else {
                print("no data")
                return closure(nil)
            }
            DispatchQueue.main.async {
                if data!.count > 64 {
                    closure(UIImage(data: data!))
                } else {
                    closure(nil)
                }
            }
        }; task.resume()
    }
    
    //    if let url = URL(string: characterProfile.Icon.URL) {
    //        DispatchQueue.global().async {
    //            if let data = try? Data(contentsOf: url) {
    //                DispatchQueue.main.async {
    //                    cell.charPic.image = UIImage(data: data)
    //                }
    //            } else {
    //                cell.charPic.image = UIImage(named: "placeholder")
    //            }
    //        }
    //    } else {
    //        cell.charPic.image = UIImage(named: "placeholder")
    //    }
}

class Icon: Decodable {
    var URL: String
    var Height: String
    var Width: String
    
    init() {
        URL = ""
        Height = ""
        Width = ""
    }
    
    init(url: String, height: String, width: String) {
        URL = url
        Height = height
        Width = width
    }
}
