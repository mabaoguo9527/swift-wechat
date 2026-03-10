import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var showSearch = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Search bar
                if showSearch {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("搜索", text: $viewModel.searchText)
                            .textInputAutocapitalization(.never)
                        if !viewModel.searchText.isEmpty {
                            Button(action: { viewModel.searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                }

                List(viewModel.filteredChats) { chat in
                    ChatRowView(chat: chat)
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.markAsRead(chat)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("微信")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showSearch.toggle() }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {}) {
                            Label("发起群聊", systemImage: "person.3")
                        }
                        Button(action: {}) {
                            Label("添加朋友", systemImage: "person.badge.plus")
                        }
                        Button(action: {}) {
                            Label("扫一扫", systemImage: "qrcode.viewfinder")
                        }
                        Button(action: {}) {
                            Label("收付款", systemImage: "dollarsign.circle")
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
    }
}

struct ChatRowView: View {
    let chat: Chat

    var body: some View {
        HStack(spacing: 12) {
            // Avatar
            ZStack(alignment: .topTrailing) {
                Image(systemName: chat.avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(chat.isPinned ? .green : .blue)

                if chat.unreadCount > 0 {
                    Text(chat.unreadCount > 99 ? "99+" : "\(chat.unreadCount)")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(Color.red)
                        .clipShape(Capsule())
                        .offset(x: 6, y: -6)
                }
            }

            // Content
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text(chat.time)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                Text(chat.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 10)
        .background(chat.isPinned ? Color(.systemGray6).opacity(0.5) : Color.clear)
    }
}

#Preview {
    ChatListView()
}
