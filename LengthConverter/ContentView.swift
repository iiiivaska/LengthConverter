//
//  ContentView.swift
//  LengthConverter
//
//  Created by Василий Буланов on 9/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var enter = ""
    @State private var meters = 0.0
    @State private var kilometers = 0.0
    @State private var feets = 0.0
    @State private var yards = 0.0
    @State private var miles = 0.0
    @State private var input = 0
    @State private var output = 0
    let measuares = ["meters", "kilometers", "feets", "yards", "miles"]
    
    var getValue: Double {
        var met = Double(enter) ?? 0
        switch input {
        case 0:
            break
        case 1:
            met *= 1000
            break
        case 2:
            met /= 3.28
            break
        case 3:
            met *= 0.9144
            break
        case 4:
            met *= 1609.344
            break
        default:
            met = 0.0
        }
        
        switch output {
        case 0:
            return met
        case 1:
            return met / 1000
        case 2:
            return met * 3.28
        case 3:
            return met / 0.9144
        case 4:
            return met / 1609.344
        default:
            return 0.0
        }
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section (header: Text("Enter value and select measure")){
                    TextField("Enter value", text: $enter)
                        .keyboardType(.decimalPad)
                    
                    Picker("Measure", selection: $input) {
                        ForEach(0 ..< measuares.count) {
                            Text("\(measuares[$0])")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section (header: Text("Result")){
                    Picker("Measure", selection: $output) {
                        ForEach(0 ..< measuares.count) {
                            Text("\(measuares[$0])")
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Text("\(getValue, specifier: "%.4f")")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
