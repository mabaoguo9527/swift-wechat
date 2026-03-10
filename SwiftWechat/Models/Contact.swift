import Foundation

struct Contact: Identifiable {
    let id: UUID
    let name: String
    let avatar: String
    let initial: String     // 首字母（用于分组）
    let status: String?

    init(id: UUID = UUID(), name: String, avatar: String, status: String? = nil) {
        self.id = id
        self.name = name
        self.avatar = avatar
        self.initial = String(name.prefix(1))
        self.status = status
    }
}

extension Contact {
    static let mockData: [Contact] = [
        Contact(name: "安琪", avatar: "person.circle.fill", status: "努力搬砖中..."),
        Contact(name: "陈明", avatar: "person.circle", status: "今天天气真好"),
        Contact(name: "大壮", avatar: "person.circle.fill"),
        Contact(name: "冯磊", avatar: "person.circle"),
        Contact(name: "顾晓华", avatar: "person.circle.fill", status: "🎵 听歌中"),
        Contact(name: "黄小明", avatar: "person.circle"),
        Contact(name: "李白", avatar: "person.circle.fill", status: "床前明月光"),
        Contact(name: "刘洋", avatar: "person.circle"),
        Contact(name: "马龙", avatar: "person.circle.fill", status: "忙"),
        Contact(name: "钱多多", avatar: "person.circle"),
        Contact(name: "孙悟空", avatar: "person.circle.fill", status: "大圣归来"),
        Contact(name: "王芳", avatar: "person.circle"),
        Contact(name: "肖战", avatar: "person.circle.fill"),
        Contact(name: "赵云", avatar: "person.circle", status: "常山赵子龙"),
    ]
}
