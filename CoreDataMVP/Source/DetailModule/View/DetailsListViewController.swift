//
//  DetailsListViewController.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import UIKit

// MARK: - ButtonStatus -

enum ButtonStatus {
    case edit, save
}

class DetailsListViewController: UIViewController {

    // MARK: - Properties -

    var presenter: DetailsViewPresenterProtocol?
    var dataManager: PersistenceManagerProtocol?
    var person: Person?

    let conteinerView = DetailsView()
    private var name: String?
    private var birthday: String?
    private var gender: String?

    // MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        self.view = conteinerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    // MARK: - Initialization -
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .systemBlue
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Detail"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.isUserInteractionEnabled = false
        presenter?.showPersons()
        configureBirthdeyButton()
        configureGenderButton()
        cancelButtonConfigure()
        changeStatus(status: .edit)
    }

    private func changeStatus(status: ButtonStatus) {
        switch status {
        case .edit:
            let addButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector (editButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        case .save:
            let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector (saveButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        }
    }

    private func cancelButtonConfigure() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = addButton
    }


    // MARK: - Button Actions -

    @objc
    private func cancelButtonTapped() {
        presenter?.returnMainView()
    }

    @objc
    private func editButtonTapped() {
        changeStatus(status: .save)
        view.isUserInteractionEnabled = true
    }

    @objc
    private func saveButtonTapped() {
        changeStatus(status: .edit)
        view.isUserInteractionEnabled = false

        if let nameIsEmpty = conteinerView.nameTextField.text?.isEmpty {
            name = !nameIsEmpty ? conteinerView.nameTextField.text : conteinerView.nameTextField.placeholder
        }

        birthday = conteinerView.birthdayButton.titleLabel?.text
        gender = conteinerView.genderButton.titleLabel?.text
        updatePersonInformation()
    }

    private func configureBirthdeyButton() {
        conteinerView.birthdayButton.addTarget(self, action: #selector(birthdeyButtonDidTapped), for: .touchUpInside)
        conteinerView.birthdayButton.backgroundColor = .systemBlue
    }

    private func configureGenderButton() {
        conteinerView.genderButton.addTarget(self, action: #selector(genderButtonDidTapped), for: .touchUpInside)
        conteinerView.genderButton.backgroundColor = .systemBlue
        conteinerView.genderButton.tintColor = .systemPink
    }

    @objc
    private func genderButtonDidTapped() {
        self.alertForGenderButton(button: conteinerView.genderButton)
    }

    @objc
    private func birthdeyButtonDidTapped() {
        self.alertDateForBirtdeyButton(button: conteinerView.birthdayButton)
    }
}

//MARK: - Protocol methods -

extension DetailsListViewController: DetailsViewProtocol {
    func showPersonInformation(_ person: Person) {
        conteinerView.genderButton.setTitle(person.gender ?? "Add", for: .normal)
        conteinerView.nameTextField.text = person.name
        conteinerView.birthdayButton.setTitle(person.birthday ?? "Add", for: .normal)
    }

    func updatePersonInformation() {
        guard let name = name, let birthday = birthday, let gender = gender else { return }
        presenter?.updatePerson(name: name, birthday: birthday, gender: gender)
    }
}
