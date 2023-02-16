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
