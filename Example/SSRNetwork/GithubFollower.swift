//
//  GithubFollower.swift
//  SSRNetwork_Example
//
//  Created by shendong on 2020/1/15.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import HandyJSON
import SSRNetwork

class GithubFollower: HandyJSON {
    required init() {}
    var login : String?
    var id : Double?
    var avatar_url: String?
    var url: String?
}

extension GithubFollower{
    
    class func getMyFollowings(result : @escaping ([GithubFollower]) -> Void){
        SSRNetwork.shared.request(url: "https://api.github.com/users/mistdon/following", success: { (response, dataResponse) in
            guard response.code == 0, let data = response.data as? [Any], let followings = [GithubFollower].deserialize(from: data) else{
                print(response.message)
                return
            }
            result(followings.compactMap({$0}))
        }) { (error) in
            print(error?.localizedDescription)
        }
    }
}

//

    
//    func getMyFollowings(result : @escaping ([GithubFollower]) -> Void){
//        self.request(url: "https://api.github.com/users/mistdon/following", method: .get, parameter: nil, success: { (response) in
//            guard response.code == 0, let data = response.data as? [Any], let followings = [SSRGithubFollower].deserialize(from: data) else{
//                Toast(text: response.message, type: 2).show()
//                return
//            }
//            result(followings.compactMap({$0}))
//        }) { (error) in
//            print(error?.localizedDescription)
//        }
////        SSRNetwork.shared.
//    }
//}
