//
//  CurrencyConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Mohar on 02/04/25.
//

import Foundation

struct CountryCurrency: Identifiable , Hashable {
    let id = UUID()
    let country: String
    let symbol: String
    let currencyCode: String
    let conversionRateToUSD: Double
}

class CurrencyConverterViewModel : ObservableObject {
    
    var amount: String = ""
    @Published var selectedFormCurrency: CountryCurrency?
    @Published var selectedToCurrency: CountryCurrency?
    @Published var currencies : [CountryCurrency] = []
        
    func initilizeTheList()  {
        currencies = [
            CountryCurrency(country: "United States", symbol: "$", currencyCode: "USD", conversionRateToUSD: 1.0),
            CountryCurrency(country: "Eurozone", symbol: "€", currencyCode: "EUR", conversionRateToUSD: 1.09),
            CountryCurrency(country: "United Kingdom", symbol: "£", currencyCode: "GBP", conversionRateToUSD: 1.26),
            CountryCurrency(country: "Japan", symbol: "¥", currencyCode: "JPY", conversionRateToUSD: 0.0068),
            CountryCurrency(country: "India", symbol: "₹", currencyCode: "INR", conversionRateToUSD: 0.012),
            CountryCurrency(country: "Canada", symbol: "CAD$", currencyCode: "CAD", conversionRateToUSD: 0.74),
            CountryCurrency(country: "Australia", symbol: "AU$", currencyCode: "AUD", conversionRateToUSD: 0.65)
        ]
        
        selectedToCurrency = currencies[0]
        
        print("All Counties initialize")
    }
    
    var convertedAmount: Double {
        
        guard let selectedFromCurrency = selectedFormCurrency,
              let inputAmount = Double(amount) , let selectedToCurrency = selectedToCurrency  else {
            return 0.0
        }
        
        let inDoller = inputAmount * selectedFromCurrency.conversionRateToUSD
        
        return inDoller / selectedToCurrency.conversionRateToUSD
    }
    
    var conversionRate: String {
        guard let selectedFromCurrency = selectedFormCurrency,
              let selectedToCurrency = selectedToCurrency  else {
            return ""
        }
        
       return "\(selectedFromCurrency.conversionRateToUSD / selectedToCurrency.conversionRateToUSD)"
    }
    
}
