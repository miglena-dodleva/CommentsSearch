//
//  SearchState.swift
//  CommentsSearch
//
//  Created by Jessica on 16.02.23.
//

import Foundation
import SwiftUI

class SearchState: ObservableObject {
    
    enum State {
        case hasNoRsults
        case displayDB
        case loading
    }
    
    @Published private(set) var sState: State = .displayDB
    
    func updateSearchState(state: State) {
        sState = state
    }
    
    
}
