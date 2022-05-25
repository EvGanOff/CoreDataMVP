//
//  DeteilsViewPresentor.swift
//  CoreDataMVP
//
//  Created by Евгений Ганусенко on 5/24/22.
//

import Foundation

protocol DetailsViewProtocol: AnyObject {
    
}

protocol DetailsViewPresenterProtocol: AnyObject {
    init(view: DetailsViewProtocol)

}

class DeteilsViewPresentor: DetailsViewPresenterProtocol {

    weak var view: DetailsViewProtocol?

    required init(view: DetailsViewProtocol) {
        self.view = view
        
    }
}
