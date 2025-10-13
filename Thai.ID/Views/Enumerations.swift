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
    case th
    case en

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .th: "Thai"
        case .en: "English"
        }
    }
}
