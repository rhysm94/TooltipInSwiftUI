//
//  Tooltip.swift
//  TooltipInSwiftUI
//
//  Created by Rhys Morgan on 05/06/2023.
//

import UIKit
import SwiftUI

final class TooltipView: UIView {
	let icon = UIImageView()
	let title = UILabel()
	let message = UILabel()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configureView()
	}

	private func configureView() {
		backgroundColor = .secondarySystemBackground

		addSubview(icon)
		icon.tintColor = .label

		icon.translatesAutoresizingMaskIntoConstraints = false
		let iconConstraints = [
			icon.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			icon.heightAnchor.constraint(equalToConstant: 24),
			icon.widthAnchor.constraint(equalToConstant: 24),
			icon.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 10)
		]

		addSubview(title)
		title.font = .preferredFont(forTextStyle: .subheadline)
		title.setContentHuggingPriority(.defaultHigh, for: .vertical)

		title.translatesAutoresizingMaskIntoConstraints = false
		let titleConstraints = [
			title.topAnchor.constraint(equalTo: icon.topAnchor),
			title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
			title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
		]

		addSubview(message)
		message.font = .preferredFont(forTextStyle: .caption1)
		message.numberOfLines = 0

		message.translatesAutoresizingMaskIntoConstraints = false
		let messageConstraints = [
			message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
			message.leadingAnchor.constraint(equalTo: title.leadingAnchor),
			message.trailingAnchor.constraint(equalTo: title.trailingAnchor),
			message.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
		]

		NSLayoutConstraint.activate(iconConstraints + titleConstraints + messageConstraints)
	}
}

struct TooltipSwiftUI: UIViewRepresentable {
	let image: UIImage?
	let title: String
	let message: String

	func makeUIView(context: Context) -> TooltipView {
		let view = TooltipView()
		return view
	}

	func updateUIView(_ uiView: TooltipView, context: Context) {
		uiView.icon.image = image
		uiView.title.text = title
		uiView.message.text = message
	}
}

struct TooltipSwiftUI_Previews: PreviewProvider {
	static var previews: some View {
		TooltipSwiftUI(
			image: UIImage(systemName: "scribble"),
			title: "WEEE Directive",
			message: "You need a minimum of 25 qualifying items to be eligible for a free collection. If a collection does not qualify then a charge will be applied."
		)
	}
}
