//
//  DetailsView.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/27/22.
//

import UIKit

class DetailsView: UIView {

    // MARK: - UIElements -

    let nameTextField = CDTextField()
    let genderPicker = CDPickerView()
    let birthdayButton = CDButton(backgraundColor: .systemPink, title: "Add")
    let genderButton = CDButton(backgraundColor: .systemPink, title: "Add")

    let nameImage = CDImageView(frame: .zero)
    let genderImage = CDImageView(frame: .zero)
    let birthdeyImage = CDImageView(frame: .zero)
    let avatarImageView = CDImageView(frame: .zero)

    let mainStackView = UIStackView()
    let stackViewWithEditUI = UIStackView()
    let imageStackView = UIStackView()

    // MARK: - Initialization -

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure UIElements -

    private func configureNameTextFeild() {
        nameTextField.borderStyle = .none
        nameTextField.layer.borderWidth = 0.1
        nameTextField.backgroundColor = .systemGray5
        nameTextField.textAlignment = .center
    }

    private func configureStackViews() {
        mainStackView.horizontalAxisStack()
        stackViewWithEditUI.verticalAxisStack()
        imageStackView.verticalAxisStack()
    }

    private func configureAvatarImageView() {
        avatarImageView.image = Images.avatarImageView
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureImageViews() {
        nameImage.image = Images.nameImage
        genderImage.image = Images.genderImage
        birthdeyImage.image = Images.birthdeyImage
    }

    // MARK: - Setup Hierarchy -

    private func setupHierarchy() {
        addSubview(avatarImageView)
        addSubview(mainStackView)
        mainStackView.addSubview(stackViewWithEditUI)
        mainStackView.addSubview(imageStackView)

        let views = [nameTextField, birthdayButton, genderButton]
        views.forEach { stackViewWithEditUI.addArrangedSubview($0) }

        let images = [nameImage, birthdeyImage, genderImage]
        images.forEach { imageStackView.addArrangedSubview($0) }
    }

    // MARK: - Configure Layouts  -

    private func configure() {
        setupHierarchy()
        configureNameTextFeild()
        configureImageViews()
        configureAvatarImageView()

        configureStackViews()
        mainStackView.backgroundColor = .systemGray6

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200),

            mainStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: Matric.mainStackViewTopAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Matric.mainStackPadding),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Matric.mainStackPadding),
            mainStackView.heightAnchor.constraint(equalToConstant: Matric.mainStackViewHeightAnchor),

            imageStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: Matric.padding),
            imageStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: Matric.padding),
            imageStackView.trailingAnchor.constraint(equalTo: stackViewWithEditUI.leadingAnchor, constant: -Matric.padding),
            imageStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -Matric.padding),
            imageStackView.widthAnchor.constraint(equalToConstant: Matric.imageStackViewWidthAnchor),

            stackViewWithEditUI.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: Matric.padding),
            stackViewWithEditUI.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -Matric.padding),
            stackViewWithEditUI.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -Matric.padding),
        ])
    }

    // MARK: - Matric Constants  -

    private struct Matric {
        static let padding: CGFloat = 12
        static let mainStackPadding: CGFloat = 12
        static let mainStackViewTopAnchor: CGFloat = 250
        static let mainStackViewHeightAnchor: CGFloat = 290
        static let imageStackViewWidthAnchor: CGFloat = 80
    }
}
