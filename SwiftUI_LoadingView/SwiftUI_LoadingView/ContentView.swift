//
//  ContentView.swift
//  SwiftUI_LoadingView
//
//  Created by Hiroki Kayanuma on 2021/04/29.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack(content: {
            Color(.red).ignoresSafeArea()
            Text("Hello, world!")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding()
            if self.isLoading {
                LoadingView()
            }
        })
        .onAppear(perform: {
            self.startFakeNetworkCall()
        })
        
    }
    func startFakeNetworkCall() {
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack(content: {
            Color(.systemBackground)
                .ignoresSafeArea()
                .opacity(0.5)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(3)
        })
    }
}
