//
//  ChatModel.swift
//  HowTalk
//
//  Created by 정환우 on 2021/02/02.
//

import ObjectMapper

class ChatModel: Mappable {
    
    @objc public var users :Dictionary<String,Bool> = [:] // 채팅방에 참여한 사람들
    public var comments :Dictionary<String,Comment> = [:] // 채팅방 대화 내용
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        users <- map["users"]
        comments <- map["comments"]
    }
    
    public class Comment: Mappable{
        
        public var uid : String?
        public var message : String?
        public required init?(map: Map) {
            
        }
        public func mapping(map: Map) {
            uid <- map["uid"]
            message <- map["message"]
        }
        
    }
    
}
