//
//  ActivityFavoriteViewModel.swift
//  HelloActivity
//
//  Created by mac2 on 2022/09/20.
//

import Foundation

class ActivityFavoriteViewModel: ObservableObject {
    @Published var activitiesDatas: [ActivityItem]?
    
    // MARK: - Call API
    func getListActivityArea() {
        ApiManager.shareInstance.requestAPIJSON(api: ClientApi.favorite) { [weak self] (success, IsFailResponseError, data, message) -> (Void) in
//            progressApp.isShowProgressView = false
            if !success, !message.isEmpty {
                print("error")
                return
            }
            if success && !IsFailResponseError , let data = data {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted) else {return}
                 let decoder = JSONDecoder()
                 do {
                     let favorite = try decoder.decode(FavoriteResponse.self, from: jsonData)
                     self?.activitiesDatas = favorite.data.activities
                 } catch {
                     print(error.localizedDescription)
                 }
            } else if let data = data {
                print(data)
            }
        }
    }
}
