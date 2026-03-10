import Foundation
import Combine

class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = Chat.mockData
    @Published var searchText: String = ""

    var filteredChats: [Chat] {
        if searchText.isEmpty {
            return chats.sorted { $0.isPinned && !$1.isPinned }
        }
        return chats.filter {
            $0.name.contains(searchText) || $0.lastMessage.contains(searchText)
        }
    }

    func markAsRead(_ chat: Chat) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].unreadCount = 0
        }
    }
}
