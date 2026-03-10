import Foundation

struct Chat: Identifiable, Hashable {
    let id: UUID
    let name: String
    let avatar: String       // SF Symbol name
    let lastMessage: String
    let time: String
    var unreadCount: Int
    var isPinned: Bool

    init(id: UUID = UUID(), name: String, avatar: String, lastMessage: String,
         time: String, unreadCount: Int = 0, isPinned: Bool = false) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.lastMessage = lastMessage
        self.time = time
        self.unreadCount = unreadCount
        self.isPinned = isPinned
    }
}

extension Chat {
    static let mockData: [Chat] = [
        Chat(name: "张三", avatar: "person.circle.fill", lastMessage: "好的，明天见！", time: "刚刚", unreadCount: 2, isPinned: true),
        Chat(name: "产品团队", avatar: "person.3.fill", lastMessage: "PRD已更新，请查阅", time: "10:32", unreadCount: 5, isPinned: true),
        Chat(name: "李四", avatar: "person.circle", lastMessage: "哈哈哈哈哈", time: "09:15", unreadCount: 0),
        Chat(name: "王五", avatar: "person.circle", lastMessage: "[图片]", time: "昨天", unreadCount: 1),
        Chat(name: "技术群", avatar: "person.3.sequence.fill", lastMessage: "小王：上线了！", time: "昨天", unreadCount: 99),
        Chat(name: "妈妈", avatar: "heart.circle.fill", lastMessage: "记得按时吃饭", time: "周一", unreadCount: 0),
        Chat(name: "文件传输助手", avatar: "arrow.up.doc.fill", lastMessage: "swift-wechat 项目已上传", time: "周日", unreadCount: 0),
    ]
}
