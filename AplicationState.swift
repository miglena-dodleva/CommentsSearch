//
//  AplicationState.swift
//  CommentsSearch
//
//  Created by Jessica on 8.02.23.
//

import Foundation

class AplicationState: ObservableObject {
    
    enum State {
        case splash
        case main
    }
    
    @Published private(set) var appState: State = .splash
    
    func updateState(state: State) {
        appState = state
    }
}

class MainState: ObservableObject {
    
    enum State {
        case hasNoRsults
        case displayResults
        case displayBaseDB
    }
    
    @Published private(set) var mainState: State = .displayBaseDB
    
    func updateMainState(state: State) {
        mainState = state
    }
}
