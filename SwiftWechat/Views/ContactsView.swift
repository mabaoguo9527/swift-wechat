import SwiftUI

struct ContactsView: View {
    @State private var searchText = ""
    let contacts = Contact.mockData

    var grouped: [(String, [Contact])] {
        let filtered = searchText.isEmpty ? contacts : contacts.filter {
            $0.name.contains(searchText)
        }
        let dict = Dictionary(grouping: filtered) { String($0.name.prefix(1)) }
        return dict.sorted { $0.key < $1.key }
    }

    var body: some View {
        NavigationStack {
            List {
                // 功能入口
                Section {
                    ContactFunctionRow(icon: "person.badge.plus", color: .green, title: "新的朋友")
                    ContactFunctionRow(icon: "person.2.fill", color: .green, title: "仅聊天")
                    ContactFunctionRow(icon: "tag.fill", color: .orange, title: "标签")
                    ContactFunctionRow(icon: "building.2.fill", color: .blue, title: "公众号")
                }

                // 按字母分组
                ForEach(grouped, id: \.0) { initial, contacts in
                    Section(header: Text(initial).font(.caption).foregroundColor(.secondary)) {
                        ForEach(contacts) { contact in
                            ContactRowView(contact: contact)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText, prompt: "搜索")
            .navigationTitle("通讯录")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "person.badge.plus")
                    }
                }
            }
        }
    }
}

struct ContactFunctionRow: View {
    let icon: String
    let color: Color
    let title: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 32, height: 32)
                .background(color)
                .cornerRadius(8)
            Text(title)
                .font(.system(size: 16))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}

struct ContactRowView: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: contact.avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(.system(size: 16))
                if let status = contact.status {
                    Text(status)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContactsView()
}
