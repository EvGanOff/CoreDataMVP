//
//  TableViewCell.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {

    static let reuseID = "TableViewCell"

    let label = CDTitleLabel(textAligment: .left, fontSize: 18)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        configure()

    }

    required init?(coder: NSCoder) {
        fatalError()
    }


    // MARK: - SetupHierarchy -

    private func setupHierarchy() {
        contentView.addSubview(label)
        
    }

    // MARK: - Configure -

    private func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Matrics.padding),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Matrics.padding)
        ])
    }

    // MARK: - Matrics -

    private struct Matrics {
        static let padding: CGFloat = 12

        static let tableRowHeight: CGFloat = 50
        static let smallAnchorConstant: CGFloat = 10
        static let largeAnchorConstant: CGFloat = 20
        static let textFieldWidth: CGFloat = 150
        static let textFieldHeight: CGFloat = 40
        static let buttonWidth: CGFloat = 80
    }
}
