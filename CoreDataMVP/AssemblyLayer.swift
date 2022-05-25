//
//  AssemblyLayer.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/23/22.
//

import Foundation

import Foundation
import UIKit

protocol MainAssembly {
    static func createMainModule() -> UIViewController
    static func createDetailsModule() -> UIViewController
}

class MainScreenBuilder: MainAssembly {

    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        //let networkManager = NetworkManager()
        let presenter = MainViewPresentor(view: view)
        view.presenter = presenter

        return view
    }

    static func createDetailsModule() -> UIViewController {
        let view = DetailsListViewController()
        //let networkManager = NetworkManager()
        let presenter = DeteilsViewPresentor(view: view)
        view.presenter = presenter

        return view
    }


}
