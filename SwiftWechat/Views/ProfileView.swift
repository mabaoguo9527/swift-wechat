import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            List {
                // 个人信息头部
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .foregroundColor(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(alignment: .leading, spacing: 4) {
                            Text("马龙")
                                .font(.system(size: 20, weight: .semibold))
                            Text("微信号：mabaoguo9527")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("🐧 每天进步一点点")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: "qrcode")
                            .foregroundColor(.secondary)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    .padding(.vertical, 8)
                }

                // 支付
                Section {
                    ProfileRow(icon: "creditcard.fill", color: .orange, title: "支付")
                }

                // 收藏 / 朋友圈 / 视频号 / 卡包 / 表情
                Section {
                    ProfileRow(icon: "star.fill", color: .orange, title: "收藏")
                    ProfileRow(icon: "photo.on.rectangle", color: .green, title: "朋友圈")
                    ProfileRow(icon: "play.rectangle.fill", color: .orange, title: "视频号")
                    ProfileRow(icon: "wallet.pass.fill", color: .green, title: "卡包")
                    ProfileRow(icon: "face.smiling.fill", color: .yellow, title: "表情")
                }

                // 设置
                Section {
                    ProfileRow(icon: "gearshape.fill", color: .gray, title: "设置")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("我")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileRow: View {
    let icon: String
    let color: Color
    let title: String
    var value: String? = nil

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

            if let value = value {
                Text(value)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.caption)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    ProfileView()
}
