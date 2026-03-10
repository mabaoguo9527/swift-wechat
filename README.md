# SwiftWechat 🐧

A mock iOS WeChat app built with **Swift + SwiftUI**, for learning and demonstration purposes.

## Features

- 💬 Chat list with mock conversations
- 👥 Contacts list
- 🔍 Discover tab (Moments, Mini Programs)
- 👤 Profile / Me tab
- 📱 Native iOS look and feel with SwiftUI

## Structure

```
SwiftWechat/
├── App/
│   └── SwiftWechatApp.swift      # App entry point
├── Views/
│   ├── MainTabView.swift         # Tab bar navigation
│   ├── ChatListView.swift        # Chat list (微信 tab)
│   ├── ContactsView.swift        # Contacts (通讯录 tab)
│   ├── DiscoverView.swift        # Discover (发现 tab)
│   └── ProfileView.swift         # Profile (我 tab)
├── Models/
│   ├── Chat.swift                # Chat model
│   └── Contact.swift             # Contact model
└── ViewModels/
    └── ChatViewModel.swift       # Chat list view model
```

## Requirements

- iOS 16+
- Xcode 14+
- Swift 5.7+

## Getting Started

1. Clone the repo
2. Open `SwiftWechat.xcodeproj` in Xcode
3. Run on simulator (iPhone 14 or later recommended)

---

> ⚠️ This is a mock/demo app. Not affiliated with Tencent or WeChat.
