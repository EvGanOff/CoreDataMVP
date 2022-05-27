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

    let labelInCell = CDTitleLabel(textAligment: .left, fontSize: 24)

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
        contentView.addSubview(labelInCell)
    }

    // MARK: - Configure -

    private func configure() {
        labelInCell.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelInCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelInCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelInCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Matrics.padding),
            labelInCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Matrics.padding)
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
