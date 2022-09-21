//
//  APIManager.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/14/22.
//


import Foundation
import Alamofire

typealias RequestCompletion = ((_ success: Bool, _ IsFailResponseError: Bool, _ data: Any?, _ message: String) -> (Void))?

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
    let fcm_tokem = UserDefaultUtils.shared.get(key: UserDefaultsKeys.fcmToken)
    
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
    
    private func getDefaultHeaderTypeJSON(typeContentHeader: TypeContentHeader? = nil) -> HTTPHeaders {
        
        var headers = HTTPHeaders()
        guard let type = typeContentHeader else {
            return headers
        }
        headers["Accept"] = "application/json";
        headers["Content-Type"] = type.stringDescription;
        guard let accessToken = UserDefaultUtils.shared.get(key: UserDefaultsKeys.token) else {
            return headers
        }
        headers["Authorization"] = "Bearer \(accessToken)";
        return headers
        
    }
}

// MARK: - Login and authen
extension ApiManager {
    
    public func requestAPIJSON(api: ClientApi, parameters: [String : Any]? = nil, typeContentHeader: TypeContentHeader? = nil, encoding: ParameterEncoding? = nil, completion: RequestCompletion) {
        
        if !Reachability.shared.isConnectedToInternet {
            completion?(false, true, "", R.string.localizable.error_network())
            return
        }
        
        let url = api.baseURL + api.path

        let finalHeaders: HTTPHeaders = getDefaultHeaderTypeJSON(typeContentHeader: typeContentHeader)
        
        let finalEncoding: ParameterEncoding = {
            if let encoding = encoding {
                return encoding
            }
            return JSONEncoding.prettyPrinted
        }()
        
        sessionManager.request(url, method: api.method, parameters: parameters, encoding: finalEncoding, headers: finalHeaders).cURLDescription(calling: { (curl) in
            print(curl)
        })
        .responseJSON(completionHandler: { (response) in
            let statusCode = response.response?.statusCode
            switch response.result {
            case .success(let data):
                switch statusCode {
                case 200:
                    completion?(true, false, data, "")
                default:
                    completion?(false, false, data, "")
                }
            case .failure(let err):
                completion?(false, true, "", err.localizedDescription)
            }
        })
    }
}

extension ApiManager {
    
    private func responseAPI<T>(typeAPI: TypeAPI, response: AFDataResponse<Any>, success: @escaping Successs<T>, failured: @escaping Failured) {
        let result = self.chekResponse(response: response)
        if result.0 == 200 {
            
            if let json = response.value as? [String: Any] {
                let status = json["status"] as? Int ?? 0
                if status == 200 {
                    responseTypeAPI(typeAPI: typeAPI, json: json["data"] as? [String: Any] ?? [:], success: success)
                } else {
                    failured(ErrorRequest.convertData.localizedDescription)
                }
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
            break
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
