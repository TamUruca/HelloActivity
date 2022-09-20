//
//  ActivityAreaViewModel.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation

class ActivityAreaViewModel: ObservableObject {
    @Published var areaDatas: [AreaData]?
//
//    var registerDisabled: Bool {
//        credentials.yourName.isEmpty || credentials.name.isEmpty || credentials.nickName.isEmpty || credentials.emailAddress.isEmpty || credentials.password.isEmpty
//    }
    
    // MARK: - Call API
    func getListActivityArea() {
//        progressApp.isShowProgressView = true
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.areas) { (success, IsFailResponseError, data) -> (Void) in
            if success && !IsFailResponseError , let data = data {
               guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                let decoder = JSONDecoder()
                do {
                    let areas = try decoder.decode(AreasResponse.self, from: jsonData)
                    self.areaDatas = areas.data
                } catch {
                    print(error.localizedDescription)
                }
            } else if !success && !IsFailResponseError, let data = data {
                print(data)
            } else {
                print("data")
            }
            
        }
    }
}
