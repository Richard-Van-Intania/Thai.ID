enum ViewLayout: String, CaseIterable, Identifiable {
    case list = "list"
    case thumbnails = "thumbnails"

    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .list: return "List"
        case .thumbnails: return "Thumbnails"
        }
    }
}

enum UserLocale: String, CaseIterable, Identifiable {
    case th = "th"
    case en = "en"

    var id: String { self.rawValue }

    var displayName: String {
        switch self {
        case .th: return "Thai"
        case .en: return "English"
        }
    }
}
