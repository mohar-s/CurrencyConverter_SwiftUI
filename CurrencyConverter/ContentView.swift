//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Mohar on 02/04/25.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CurrencyConverterViewModel()
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Convert from Currency")) {
                    HStack (alignment: .lastTextBaseline) {
                        TextField("Enter amount", text: $viewModel.amount)
                            .keyboardType(.decimalPad)
                            
                        Button("Calculate") {
                            viewModel.selectedFormCurrency = viewModel.selectedFormCurrency ?? viewModel.currencies[0]
                        }
                    }

                    Picker("From currency", selection: $viewModel.selectedFormCurrency) {
                        ForEach(viewModel.currencies) { currency in
                            Text("\(currency.country) - \(currency.currencyCode)").tag(currency as CountryCurrency?)
                        }
                    }
                }

                if viewModel.selectedFormCurrency != nil {
                    Section(header: Text("Converted Amount To") ) {
                        Text("\(viewModel.selectedToCurrency!.symbol) \(viewModel.convertedAmount, specifier: "%.2f")")
                            .font(.title)
                        
                        Picker("To currency", selection: $viewModel.selectedToCurrency) {
                            ForEach(viewModel.currencies) { currency in
                                Text("\(currency.country) - \(currency.currencyCode)").tag(currency as CountryCurrency?)
                            }
                        }
                        
                        Text("Conversion Rate : \(viewModel.conversionRate)")
                    }
                
                }
            }
            .navigationTitle("Currency Converter")
        }
        .onAppear {
            viewModel.initilizeTheList()
        }
    }
}

// Preview
#Preview  {
    ContentView()
}
