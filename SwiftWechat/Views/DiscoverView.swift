import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationStack {
            List {
                // 朋友圈 / 视频号
                Section {
                    DiscoverRow(icon: "photo.on.rectangle.angled", color: .green, title: "朋友圈")
                    DiscoverRow(icon: "play.rectangle.fill", color: .orange, title: "视频号")
                }

                // 扫一扫 / 摇一摇
                Section {
                    DiscoverRow(icon: "qrcode.viewfinder", color: .green, title: "扫一扫")
                    DiscoverRow(icon: "iphone.radiowaves.left.and.right", color: .green, title: "摇一摇")
                }

                // 看一看 / 搜一搜
                Section {
                    DiscoverRow(icon: "eye.fill", color: .green, title: "看一看")
                    DiscoverRow(icon: "magnifyingglass", color: .green, title: "搜一搜")
                }

                // 附近 / 漂流瓶
                Section {
                    DiscoverRow(icon: "location.fill", color: .green, title: "附近")
                }

                // 购物 / 游戏
                Section {
                    DiscoverRow(icon: "cart.fill", color: .orange, title: "购物")
                    DiscoverRow(icon: "gamecontroller.fill", color: .purple, title: "游戏")
                }

                // 小程序
                Section {
                    DiscoverRow(icon: "square.grid.2x2.fill", color: .blue, title: "小程序")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("发现")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DiscoverRow: View {
    let icon: String
    let color: Color
    let title: String
    var badge: String? = nil

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

            if let badge = badge {
                Text(badge)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.red)
                    .clipShape(Capsule())
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    DiscoverView()
}
