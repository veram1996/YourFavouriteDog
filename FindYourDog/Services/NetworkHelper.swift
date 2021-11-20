//
//  NetworkHelper.swift
//  FindYourDog
//
//   Created by Dheeraj Verma on 17/11/21.
//

import Foundation
import Alamofire

class NetworkHelper {
    static var sharedInstance = NetworkHelper()    
    private init() {}
    
    func request<T: Decodable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? =  nil,
        returningClass: T.Type,
        encoding: ParameterEncoding = URLEncoding.default,
        successHandler: @escaping (_ successResponse: T?) -> Swift.Void,
        errorHandler: @escaping (_ errorResponse: ErrorResponse?, _ statusCode: Int?) -> Swift.Void) {
        
        if Connectivity.isConnectedToInternet == true {
            self.actualRequest(url, method: method, parameters: parameters, headers: headers, returningClass: returningClass, encoding: encoding) { (data) in
                DispatchQueue.main.async {
                    successHandler(data)
                }
            } errorHandler: { (errorResponse, statusCode) in
                errorHandler(errorResponse, statusCode)
            }
        } else {
            var error = ErrorResponse()
            error.error = StringConstants.noInternetFound
            error.errorDescription = StringConstants.pleaseCheckYourInternetConnection
            errorHandler(error, -1)
        }
    }
    
    private func actualRequest<T: Decodable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? =  nil,
        returningClass: T.Type,
        encoding: ParameterEncoding = URLEncoding.default,
        successHandler: @escaping (_ successResponse: T) -> Swift.Void,
        errorHandler: @escaping (_ errorResponse: ErrorResponse?, _ statusCode: Int) -> Swift.Void) {
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        request.validate(statusCode: 200..<300)
            .responseJSON { response in
                self.responseWrapper(response: response, returingClass: returningClass) { (data) in
                    successHandler(data)
                } errorHandler: { (errorResponse) in
                    errorHandler(errorResponse, response.response?.statusCode ?? -1)
                }
            }
    }
    
}

extension NetworkHelper {
    private func responseWrapper<T: Decodable>(response: DataResponse<Any>,
                                               returingClass: T.Type,
                                               successHandler: @escaping (_ data: T) -> Swift.Void,
                                               errorHandler: @escaping (_ error: ErrorResponse?) -> Swift.Void) {
        switch response.result {
        case .success:
            debugPrint("HTTP Response Body: \(String(describing: response.data)) Status Code = \(response.response?.statusCode ?? 0)")
            if let data = response.data {
                if data.count == 0, T.self == String.self {
                    successHandler("" as! T)
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let dataObject = try decoder.decode(T.self, from: data)
                    successHandler(dataObject)
                } catch {
                    print(error)
                    var errorResponse = ErrorResponse()
                    errorResponse.error = "Error"
                    errorResponse.errorDescription = error.localizedDescription
                    errorHandler(errorResponse)
                }
            } else {
                errorHandler(ErrorResponse())
            }
            
        case .failure(let error):
            debugPrint("HTTP Request failed. Request was: \(String(describing: response.request)) error: \(error.localizedDescription) status code = \(response.response?.statusCode ?? 0)")
            var errorResponse = ErrorResponse()
            do {
                let decoder = JSONDecoder()
                errorResponse = try decoder.decode(ErrorResponse.self, from: response.data!)
                errorResponse.error = "Error"
            } catch {
                errorResponse.error = "Error"
                errorResponse.errorDescription = error.localizedDescription
            }
            errorHandler(errorResponse)
        }
    }
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet: Bool {
        return self.sharedInstance.isReachable
    }
}
