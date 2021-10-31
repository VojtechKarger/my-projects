//
//  StringMarkingExtension.swift
//  StringMarkingExtension
//
//  Created by vojta on 16.09.2021.
//

import UIKit
import SwiftUI


extension String {

    func colorTheText(atributes: [String: UIColor]) -> NSMutableAttributedString {
        let strings = self.components(separatedBy: " ")
        let string = NSMutableAttributedString(string: "")
        for str in strings {
            print(str)
            if let color = atributes[str] {
                let atributedString = NSAttributedString(string: str + " ", attributes: [NSAttributedString.Key.foregroundColor: color])
                string.append(atributedString)
            }else{
                string.append(NSAttributedString(string: str + " "))
            }
        }
        return string
    }
    
    func colorTextInRanges(attributes: [String: UIColor]) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(
            attributedString: NSAttributedString(string: self,
                                                 attributes: [
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                                                    NSAttributedString.Key.foregroundColor: UIColor(Color.primary)
                                                 ]
))
        for (word,color) in attributes {
            for r in self.foundRangesOfWord(word) {
                attributedString.addAttributes([NSAttributedString.Key.foregroundColor: color], range: r)
            }
        }
        return attributedString
    }
    func replaceBadQuotes() -> String {
        return String(self.map {
            $0 == "”" ? "\"" : $0 == "“" ? "\"" : $0
        })
    }
    
    
    func foundRangesOfWord(_ word: String) -> [NSRange] {
        var array = Array<NSRange>()
        var i = 0
        var isInWord = false
        var currentWord: String = ""
        
        for ch in self {
            if !Attributes.characterSet.contains(ch) {
                isInWord = true
            }else{
                isInWord = false
                if currentWord == word {
                    array.append(NSRange(location: i - currentWord.count, length: currentWord.count))
                }
                currentWord = ""
            }
            if isInWord {
                currentWord += String(ch)
                if currentWord == word {
                    array.append(NSRange(location: i - currentWord.count + 1, length: currentWord.count))
                    currentWord = ""
                }
            }
            i += 1
        }
        
        
        return array
    }
    
    
    
}





