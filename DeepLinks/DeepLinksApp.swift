//
//  DeepLinksApp.swift
//  DeepLinks
//
//  Created by Vlad Dzirko on 21.07.2023.
//

import SwiftUI

@main
struct DeepLinksApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            CountryListView()
                .environmentObject(router)
                .onOpenURL { url in
                    guard let scheme = url.scheme, scheme == "navStack" else { return }
                    guard let country = url.host else { return }
                    if let foundCountry = Country.sample.first(where: {$0.name == country}) {
                        router.reset()
                        router.path.append(foundCountry)
                        if url.pathComponents.count == 2 {
                            let city = url.lastPathComponent
                            if let foundCity = foundCountry.cities.first(where: {$0.name == city}) {
                                router.path.append(foundCity)
                            }
                        }
                    }
                }
        }
    }
}
