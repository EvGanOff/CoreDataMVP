//
//  CDPickerView.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/25/22.
//

import Foundation
import UIKit

class CDPickerView: UIPickerView {

    var title = ""
    private let genderDataSource = ["Male", "Female"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        dataSource = self
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = .systemBackground
        layer.borderWidth = 0.1
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CDPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        title = genderDataSource[row] as String
    }
}

extension CDPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genderDataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        title = genderDataSource[row] as String
        return genderDataSource[row] as String
    }
}
