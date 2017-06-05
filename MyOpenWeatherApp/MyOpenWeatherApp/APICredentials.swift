//
//  APICredentials.swift
//  MyOpenWeatherApp
//
//  Created by Rigoberto Sáenz Imbacuán on 6/4/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

enum APICredentials {
    case openWeatherMapApiKey
}

extension APICredentials {
    
    func load() -> String {
        
        let keychainKey = getKeychainKey()
        
        // Ask if the required credential is stored under the keychain key
        if let key: String = KeychainWrapper.standard.string(forKey: keychainKey) {
            return key
            
        } else {
            
            // Gets the obfuscated credential
            let key = getData()
            
            // Which is stored in the Keychain before returned
            KeychainWrapper.standard.set(key, forKey: keychainKey)
            return key
        }
    }
    
    fileprivate func getKeychainKey() -> String {
        
        // Gets the bundle identifier
        guard let bundleIdentifier: String = Bundle.main.bundleIdentifier else {
            return ""
        }
        
        // Which is joined to some string to get the Keychain Key
        switch self {
        case .openWeatherMapApiKey:
            return bundleIdentifier.dot.O.p.e.n.W.e.a.t.h.e.r.M.a.p
        }
    }
    
    fileprivate func getData() -> String {
        
        var data = String()
        
        // Returns the credential, which is obfuscated using TPObfuscatedString library
        switch self {
        case .openWeatherMapApiKey:
            data.append(String().f.one.f.three.eight.nine.a.b.eight.e.zero.c.zero.zero.four.six.four)
            data.append(String().seven.one.nine.four.three.one.two.eight.b.seven.seven.four.three.f.d)
        }
        
        return data
    }
}
