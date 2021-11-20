//
//  DashboardViewModel.swift
//  FindYourDog
//
//  Created by Dheeraj Verma on 18/11/21.
//

import Foundation
import Alamofire

class DashboardViewModel: ObservableObject {
    
    @Published var dogsBreeds: [BreedModel]?
    @Published var isShowAlert = false
    var appState: AppState?
    var errorResponse: ErrorResponse?
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func getListOfBreed() {
        let url = APIConstants.baseURL + APIConstants.breeds
        let header = APIConstants.header
        self.appState?.shouldShowActivityIndicator = true
        NetworkHelper.sharedInstance.request(url, method: .get, parameters: nil, headers: header, returningClass: [BreedModel].self, encoding: URLEncoding.default) { data in
            self.appState?.shouldShowActivityIndicator = false
            self.dogsBreeds = data
        } errorHandler: { error, code in
            self.appState?.shouldShowActivityIndicator = false
            self.errorResponse = error
            self.isShowAlert = true
     
        }
    }
}
