//
//  File.swift
//  
//
//  Created by Denis Martin on 27/04/2021.
//

import SwiftyJSON
import CoreData
import Alamofire

/*
 {
     "bio": "<p>Denis</p>\r\n",
     "links": [
         {
             "url": "https://www.test.com",
             "label": "irlmobile",
             "id": "84272742-B5EA-41D0-8B1E-4075B8060D7D",
             "priority": 100
         }
     ],
     "name": "Denis",
     "id": "194B5116-11F0-42C8-8608-02F3E6041C9F",
     "imageKey": "blog/authors/Dell Xmas 07 002_2.jpg"
 }
 */

extension BlogAuthor: ManagedObjectServerMaping {
        
    public typealias FeatherModule = BlogModule
    
    public static let route: String = "authors"
    
    public static let routeFilteringParameters: String? = "?per=10000"

    public static let apiListItemsKey: String? = "items"

}

#if os(iOS)
extension BlogAuthor: ImageCaching {

    public var imageURL: String? {
        guard let imageKey = imageKey else {
            return nil
        }
        return FeatherModule.main.host + "/assets/" + imageKey
    }

}
#endif
