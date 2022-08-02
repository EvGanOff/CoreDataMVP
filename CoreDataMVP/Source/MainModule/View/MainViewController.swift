//
//  MainViewController.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol? = nil

    // MARK: - UIElements -

    let textField = CDTextField()
    let tableView = UITableView()
    let button = CDButton(backgraundColor: .systemPink, title: "Add")

    // MARK: - Lifecycle -

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        configureView()
        presenter?.updateView()
    }

    // MARK: - Configure ViewController -

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }

    // MARK: - Configure UIElements and Layouts -

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureView() {
        let views = [textField, button,tableView]
        views.forEach { view.addSubview($0) }

        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: Matrics.leadingAnchorConstraint),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Matrics.padding),
            textField.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -Matrics.padding),
            textField.heightAnchor.constraint(equalToConstant: Matrics.heightAnchorConstant),
            textField.widthAnchor.constraint(equalToConstant: 270),

            button.topAnchor.constraint(equalTo: view.topAnchor, constant:  Matrics.leadingAnchorConstraint),
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: Matrics.padding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Matrics.padding),
            button.heightAnchor.constraint(equalToConstant: Matrics.heightAnchorConstant),

            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Matrics.padding),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
    
    @objc
    private func didTappedButton() {
        addNewPerson()
        textField.text = ""
        reloadData()
    }

    private struct Matrics {
        static let padding: CGFloat = 12
        static let leadingAnchorConstraint: CGFloat = 150
        static let heightAnchorConstant: CGFloat = 40
    }
}

// MARK: - TableViewDataSource -

extension MainViewController: MainViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }

    func addNewPerson() {
        let name = textField.text ?? ""
        presenter?.addNewPerson(name: name)
    }
}

// MARK: - TableViewDataSource -

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = presenter?.getTableRowCount() else { return 0 }

        return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as? TableViewCell else {
            let cell = TableViewCell(style: .default, reuseIdentifier: TableViewCell.reuseID)
            return cell
        }

        cell.labelInCell.text = presenter?.getPersonNameAt(index: indexPath.row)

        return cell
    }
}

// MARK: - UITableViewDelegate -

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter?.deletePersonAt(index: indexPath.row)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectPersonAt(index: indexPath.row)
    }
}
