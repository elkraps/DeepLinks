//
//  ContentView.swift
//  DeepLinks
//
//  Created by Vlad Dzirko on 21.07.2023.
//

import SwiftUI

struct CountryListView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.path) {
            List(Country.sample) { country in
                NavigationLink(value: country) {
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                    }
                }
            }
            .navigationDestination(for: Country.self) { country in
                CountryView(country: country)
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
            .environmentObject(Router())
    }
}
