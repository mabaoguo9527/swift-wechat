import SwiftUI

struct Message: Identifiable {
    let id: UUID
    let content: String
    let isMe: Bool
    let time: String

    init(id: UUID = UUID(), content: String, isMe: Bool, time: String) {
        self.id = id
        self.content = content
        self.isMe = isMe
        self.time = time
    }

    static let mockMessages: [Message] = [
        Message(content: "你好！", isMe: false, time: "10:00"),
        Message(content: "你好，有什么事吗？", isMe: true, time: "10:01"),
        Message(content: "想问一下 PRD 评审的时间定了吗", isMe: false, time: "10:02"),
        Message(content: "明天下午3点，在1108会议室", isMe: true, time: "10:03"),
        Message(content: "好的，我会准时参加", isMe: false, time: "10:04"),
        Message(content: "到时候把设计稿也带上", isMe: true, time: "10:05"),
        Message(content: "没问题，已经准备好了 👍", isMe: false, time: "10:06"),
        Message(content: "太好了！那明天见 😊", isMe: true, time: "10:07"),
        Message(content: "好的，明天见！", isMe: false, time: "10:08"),
    ]
}

struct ChatDetailView: View {
    let chat: Chat
    @State private var inputText = ""
    @State private var messages = Message.mockMessages
    @FocusState private var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            // 消息列表
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding()
                }
                .onAppear {
                    if let last = messages.last {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
                .onChange(of: messages.count) { _ in
                    if let last = messages.last {
                        withAnimation {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()

            // 输入栏
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image(systemName: "mic")
                        .font(.system(size: 22))
                        .foregroundColor(.primary)
                }

                TextField("发送消息", text: $inputText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(1...4)
                    .focused($isInputFocused)

                if inputText.isEmpty {
                    Button(action: {}) {
                        Image(systemName: "face.smiling")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    }
                    Button(action: {}) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 22))
                            .foregroundColor(.primary)
                    }
                } else {
                    Button(action: sendMessage) {
                        Text("发送")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.green)
                            .cornerRadius(6)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
        }
        .navigationTitle(chat.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }

    func sendMessage() {
        guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let now = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
        messages.append(Message(content: inputText, isMe: true, time: now))
        inputText = ""
    }
}

struct MessageBubble: View {
    let message: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if message.isMe { Spacer(minLength: 60) }

            if !message.isMe {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.blue)
            }

            VStack(alignment: message.isMe ? .trailing : .leading, spacing: 2) {
                Text(message.content)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(message.isMe ? Color.green : Color(.systemGray5))
                    .foregroundColor(message.isMe ? .white : .primary)
                    .cornerRadius(16)

                Text(message.time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            if message.isMe {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.green)
            }

            if !message.isMe { Spacer(minLength: 60) }
        }
    }
}

#Preview {
    NavigationStack {
        ChatDetailView(chat: Chat.mockData[0])
    }
}
