//
//  MainViewController.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import UIKit

class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol? = nil

    let textField = CDTextField()
    let stackView = UIStackView()
    let tableView = UITableView()
    let button = CDButton(backgraundColor: .systemPink, title: "Add")
    var titles: [String] = []



    // MARK: - ViewController lifecycle -

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        configureView()
    }

    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Configure -

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
        guard let text = textField.text, let presenter = self.presenter else { return }
        if text != "" {
            presenter.add(title: text)
        }
    }

    private struct Matrics {
        static let padding: CGFloat = 12
        static let leadingAnchorConstraint: CGFloat = 150
        static let heightAnchorConstant: CGFloat = 40
    }
}

// MARK: - TableViewDataSource -
extension MainViewController: MainViewProtocol {
    func onGetItems(titles: [String]) {
        self.titles = titles
        tableView.reloadData()
    }

    func onDeleteItem(index: Int) {
        self.titles.remove(at: index)
        tableView.reloadData()
    }

    func onAddItem(title: String) {
        self.titles.append(title)
        tableView.reloadData()
        textField.text = ""
    }

    func succses() {
        //tableView.reloadData()
    }

    func failure() {
        print("somthing was wrong")
    }
}

// MARK: - TableViewDataSource -

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as? TableViewCell else {
            let cell = TableViewCell(style: .default, reuseIdentifier: TableViewCell.reuseID)
            return cell
        }

        cell.label.text = titles[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate -

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let title = titles[indexPath.row]
            let titleIndex = self.titles.firstIndex(of: title)
            if let titleIndex = titleIndex {
                presenter?.delete(index: titleIndex)
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = MainScreenBuilder.createDetailsModule()
        navigationController?.pushViewController(newViewController, animated: true)
        
    }
}
