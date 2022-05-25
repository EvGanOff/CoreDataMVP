//
//  DetailsListViewController.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import Foundation
import UIKit

enum ButtonStatus {
    case edit, save
}

class DetailsListViewController: UIViewController {

    var presenter: DetailsViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()

    }
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        changeStatus(status: .edit)

    }

    @objc
    func addButtonTapped() {
        changeStatus(status: .save)
    }

    private func changeStatus(status: ButtonStatus) {
        switch status {
        case .edit:
            let addButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector (addButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        case .save:
            let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector (addButtonTapped))
            navigationItem.rightBarButtonItem = addButton
        }
    }
}

extension DetailsListViewController: DetailsViewProtocol {


    
}
