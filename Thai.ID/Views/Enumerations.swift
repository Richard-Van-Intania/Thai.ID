enum ViewLayout: String, CaseIterable, Identifiable {
    case list
    case thumbnails

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .list: "List"
        case .thumbnails: "Thumbnails"
        }
    }
}

enum UserLocale: String, CaseIterable, Identifiable {
    case en
    case th
    
    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .th: "ไทย (TH)"
        case .en: "English (EN)"
        }
    }
}
