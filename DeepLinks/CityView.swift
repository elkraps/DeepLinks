//
//  CityView.swift
//  DeepLinks
//
//  Created by Vlad Dzirko on 22.07.2023.
//

import SwiftUI
import Charts

struct CityView: View {
    @EnvironmentObject var router: Router
    let city: City
    
    var body: some View {
        VStack {
            ZStack {
                if city.isCapital {
                    Text("⭐️")
                        .font(.system(size: 200))
                }
                HStack {
                    Text("\(city.name) (\(city.country))")
                        .font(.title2)
                }
            }
            .frame(height: 200)
            Spacer()
            Chart(city.fellowCities) { city in
                BarMark(x: .value("City", city.name),
                        y: .value("Population", city.population))
                .foregroundStyle(by: .value("City", city.name))
            }
            .chartLegend(.hidden)
            .padding()
            
            Button("Back to countries list") {
                router.reset()
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("City")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CityView(city: Country.sample[2].cities[0])
                .environmentObject(Router())
        }
    }
}
