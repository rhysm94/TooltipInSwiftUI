//
//  ContentView.swift
//  TooltipInSwiftUI
//
//  Created by Rhys Morgan on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
			Text("Hello, world!")

			TooltipSwiftUI(
				image: UIImage(systemName: "scribble"),
				title: "WEEE Directive",
				message: "You need a minimum of 25 qualifying items to be eligible for a free collection. If a collection does not qualify then a charge will be applied."
			)
			.border(.black)
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
