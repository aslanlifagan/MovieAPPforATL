//
//  PeopleViewModel.swift
//  MovieAPPforATL
//
//  Created by Aslanli Faqan on 17.05.24.
//

import Foundation

class PeopleViewModel {
    private (set) var peopleData: PeopleModel?
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleList() {
        PeopleManager.shared.getPeopleList(pageID:1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            if let errorString = errorString {
                self.error?(errorString)
            } else if let responseData = responseData {
                self.peopleData = responseData
                self.success?()
            }
        }
    }
    
    func getList() -> [ImageLabelCellProtocol] {
        peopleData?.results ?? []
    }

    func getCount() -> Int {
        getList().count
    }
    
    func getItem(index: Int) -> ImageLabelCellProtocol {
        getList()[index]
    }
    
}
