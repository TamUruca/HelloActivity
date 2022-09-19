//
//  APIManager.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//


import Foundation
import Alamofire

enum TypeContentHeader {
    case json
    case urlncoded
    
    var stringDescription: String {
        switch self {
        case .json:
            return "application/json"
        case .urlncoded:
            return "application/x-www-form-urlencoded"
        }
    }
        
}

enum ErrorServer {
    case requestSuccess
    case registerSuccess
    case returnNoBody
    case authenFail
    case permission
    case urlNotExist
    case differentRequest
    case validation
    case expiredToken
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .requestSuccess:
            return "Successful request"
        case .registerSuccess:
            return "Successful registration"
        case .returnNoBody:
            return "The request was successful, but there is no body to return"
        case .authenFail:
            return "Authentication failed"
        case .permission:
            return "Permission error"
        case .urlNotExist:
            return "Access a URL that does not exist"
        case .differentRequest:
            return "Request Method is different"
        case .validation:
            return "Validation error"
        case .expiredToken:
            return "expiredToken"
        case .unknown:
            return "An unknown error"
        }
    }
}

enum ErrorRequest {
    case convertData
    
    var localizedDescription: String {
        switch self {
        case .convertData:
            return "Format data is wrong"
        }
        
    }
}

enum TypeAPI {
    case login
    case register
}

public typealias Successs<T> = (Bool, T?) -> Void
public typealias Failured = (String) -> Void
public typealias Result = (Bool, String) -> Void

class Reachability {
    static var shared = Reachability()
    var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

class ApiManager {
    static let shareInstance = ApiManager()
    let fcm_tokem = UserDefaults.standard.string(forKey: "fcmToken")
    
    private lazy var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.timeoutIntervalForResource = 30.0
        var manager = Session(configuration: configuration)
        return manager
    }()
    
    func chekResponse(response: AFDataResponse<Any>) -> (Int, String) {
        let statusCode = response.response?.statusCode ?? 0
        switch response.result {
        case .success:
            switch statusCode {
            case 200:
                return (200, ErrorServer.requestSuccess.localizedDescription)
            case 201:
                return (201, ErrorServer.registerSuccess.localizedDescription)
            case 204:
                return (204, ErrorServer.returnNoBody.localizedDescription)
            case 401:
                return (401, ErrorServer.authenFail.localizedDescription)
            case 403:
                return (403, ErrorServer.permission.localizedDescription)
            case 404:
                return (404, ErrorServer.urlNotExist.localizedDescription)
            case 405:
                return (405, ErrorServer.differentRequest.localizedDescription)
            case 422:
                return (422, ErrorServer.validation.localizedDescription)
            case 500:
                return (500, "error_500")
            case 203:
                return (203, ErrorServer.expiredToken.localizedDescription)
            default:
                return (statusCode, ErrorServer.unknown.localizedDescription)
            }
        case .failure(let error):
            switch error {
            case .sessionTaskFailed(let urlError as URLError) where urlError.code == .timedOut:
                return (statusCode, "error_time_out")
            default:
                return (statusCode, error.localizedDescription)
            }
        }
    }
    
    // get Header
    private func getHeader(token: String, typeContentHeader: TypeContentHeader) -> HTTPHeaders {
        return [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json",
            "Content-Type": typeContentHeader.stringDescription ]
    }
}

// MARK: - Login and authen
extension ApiManager {
    
    public func postAPILogin(credentials: LoginCredentials,
                             success: @escaping Successs<UserLogin>,
                             failured: @escaping Failured) {
        if !Reachability.shared.isConnectedToInternet {
            failured(R.string.localizable.error_network())
            return
        }
        let parameters: Parameters = ["email": credentials.email, "password": credentials.password, "terminal_id": 123456]
        sessionManager.request(Utils.postAPILogin(), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: getHeader(token: "", typeContentHeader: .json) ).responseJSON { (response) in
            self.responseAPI(typeAPI: .login, response: response, success: success, failured: failured)
        }
    }
    
    public func postAPIRegister(credentials: RegisterCredentials,
                             success: @escaping Successs<Any>,
                             failured: @escaping Failured) {
        if !Reachability.shared.isConnectedToInternet {
            failured(R.string.localizable.error_network())
            return
        }
        let parameters: Parameters = ["yourName": credentials.yourName, "name": credentials.name, "nickName": credentials.nickName, "emailAddress": credentials.emailAddress, "password": credentials.password ]
        sessionManager.request(Utils.postAPIRegister(), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: getHeader(token: "", typeContentHeader: .urlncoded) ).responseJSON { (response) in
            self.responseAPI(typeAPI: .login, response: response, success: success, failured: failured)
        }
    }
}

extension ApiManager {
    
    private func responseAPI<T>(typeAPI: TypeAPI, response: AFDataResponse<Any>, success: @escaping Successs<T>, failured: @escaping Failured) {
        let result = self.chekResponse(response: response)
        if result.0 == 200 {
            if let json = response.value as? [String: Any] {
                responseTypeAPI(typeAPI: typeAPI, json: json, success: success)
            } else {
                failured(ErrorRequest.convertData.localizedDescription)
            }
        } else if result.0 == 203 {
            failured(result.1)
        } else {
            self.checkErrorServer(errorServer: result.1, response: response, failured: failured)
        }
    }
    
    private func responseTypeAPI<T>(typeAPI: TypeAPI, json: [String: Any], success: @escaping Successs<T>) {
        switch typeAPI {
        case .login:
            let data = UserLogin(dic: json)
            UserDefaults.standard.set(data.token, forKey: "token")
            success(true, data as? T)
        case .register:
            break
        }
    }
    
    private func checkErrorServer(errorServer: String, response: AFDataResponse<Any>, failured: @escaping Failured) {
        if let json = response.value as? [String: Any] {
            let message = json["message"] as? String ?? ""
            if message.isEmpty {
                failured(errorServer)
            } else {
                failured(message)
            }
        } else {
            failured(ErrorRequest.convertData.localizedDescription)
        }
    }
}
