//
//  Router.swift
//  DeepLinks
//
//  Created by Vlad Dzirko on 22.07.2023.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset() {
        path = NavigationPath()
    }
}
