//
//  CDImageView.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/25/22.
//

import UIKit

class CDImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        clipsToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
    }
}
