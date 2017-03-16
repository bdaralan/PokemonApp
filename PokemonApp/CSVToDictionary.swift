//
//  CSVToDictionary.swift
//  PokemonApp
//
//  Created by Dara on 3/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

func CSVToDictionary(contentsOfFile path: String?, withRowDelimiter rDeli: String = "\n", withFieldDelimiter fDeli: String = ",") -> [DictionarySS] {
        
    var csvDictionarySS = [DictionarySS]()
    
    if let path = path {
        
        do {
            let csvContent = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            var csvContentByLine = csvContent.components(separatedBy: rDeli)
            
            let keys = csvContentByLine[0].components(separatedBy: fDeli)
            csvContentByLine.removeFirst()
            
            for i in 0 ..< csvContentByLine.count {
                let lineToken = csvContentByLine[i].components(separatedBy: fDeli)
                
                var oneDict = DictionarySS()
                
                for j in 0 ..< keys.count {
                    oneDict[keys[j]] = lineToken[j]
                }
                
                csvDictionarySS.append(oneDict)
            }
        } catch {
            print(error)
        }
    }
    
    return csvDictionarySS
}
