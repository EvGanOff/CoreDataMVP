//
//  ExtensionUIViewController.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/25/22.
//

import UIKit

extension UIViewController {
    func alertDateForBirtdeyButton(button: UIButton) {
        let alertController = UIAlertController(title: "Дата рождения", message: nil, preferredStyle: .alert)

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels

        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
            button.setTitle(dateString, for: .normal)
        }

        let cancelAction = UIAlertAction(title: "Назад", style: .default, handler: nil)
        alertController.view.addSubview(datePicker)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        alertController.view.heightAnchor.constraint(equalToConstant: 250),
        datePicker.widthAnchor.constraint(equalTo: alertController.view.widthAnchor),
        datePicker.heightAnchor.constraint(equalToConstant: 150),
        datePicker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 50)
        ])

        present(alertController, animated: true, completion: nil)
    }

    func alertForGenderButton(button: UIButton) {
        let alertController = UIAlertController(title: "Выберите пол", message: nil, preferredStyle: .actionSheet)
        alertController.view.backgroundColor = .systemBackground
        alertController.view.layer.cornerRadius = 10
        let picker = CDPickerView()

        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            button.setTitle(picker.title, for: .normal)
        }

        let cancelAction = UIAlertAction(title: "Назад", style: .default, handler: nil)
        alertController.view.addSubview(picker)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        NSLayoutConstraint.activate([
        alertController.view.heightAnchor.constraint(equalToConstant: 300),
        picker.widthAnchor.constraint(equalTo: alertController.view.widthAnchor),
        picker.heightAnchor.constraint(equalToConstant: 100),
        picker.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 50)
        ])

        present(alertController, animated: true, completion: nil)
    }
}
