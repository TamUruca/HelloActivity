//
//  InboxViewModel.swift
//  HelloActivity
//
//  Created by Uruca's Macbook on 9/22/22.
//

import Foundation
import UIKit


final class InboxViewModel: ObservableObject {
    
    @Published var error: ErrorApp.ErrorProvider?
    @Published var inboxdata: [ItemInboxData] = []

    // MARK: - Call API
    func getAPIInbox(progressApp: ProgressApp) {
        progressApp.isShowProgressView = true
        
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.inbox, typeContentHeader: .json) { [weak self] (success, IsFailResponseError, data, message) -> (Void) in
            progressApp.isShowProgressView = false
            if !success, !message.isEmpty {
                self?.error = .errorAPI(error: message)
                return
            }
            if success && !IsFailResponseError , let data = data {
               guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                let decoder = JSONDecoder()
                do {
                    let inboxDataResponse = try decoder.decode(InboxDataResponse.self, from: jsonData)
                    self?.inboxdata = inboxDataResponse.data
                } catch {
                    self?.error = .errorAPI(error: error.localizedDescription)
                }
            } else if let data = data {
                progressApp.isShowProgressView = false
                if let json = data as? [String: Any] {
                    let message = json["message"] as? String ?? ""
                    self?.error = .errorAPI(error: message)
                }
            }
        }
    }
    
    func isLoginSocial(type: String) -> Bool {
        guard let dataSocial = UserDefaultUtils.shared.get(object: DataRegisterSocial.self, fromKey: UserDefaultsKeys.loginSocial) else {
            return false
        }
        return dataSocial.type == type
    }
    
    func checkDate(date: String) -> String {
        if let dateConvert = date.toDate(format: .input1) {
            if checkMonthYear(dateCustom: TypeInDate.year(dateConvert), dateCurrent: TypeInDate.year(Date())) {
                // date is current yeas
                if checkMonthYear(dateCustom: TypeInDate.day(dateConvert), dateCurrent: TypeInDate.day(Date())) {
                    // date is day current
                    return dateConvert.toString(format: .input4).lowercased()
                } else {
                    return dateConvert.toString(format: .output6).lowercased()
                }
            } else {
                // date is not current yeas
                return dateConvert.toString(format: .output3).lowercased()
            }
        }
        return ""
    }
    
    func checkMonthYear(dateCustom: TypeInDate, dateCurrent: TypeInDate) -> Bool {
         return dateCustom.valueDate == dateCurrent.valueDate
    }
}
