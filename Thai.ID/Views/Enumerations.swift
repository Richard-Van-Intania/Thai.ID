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

enum CardTitle: String, CaseIterable, Identifiable {
    case mr
    case miss
    case mrs

    var id: String { rawValue }

    var displayThai: String {
        switch self {
        case .mr: "นาย"
        case .miss: "นางสาว"
        case .mrs: "นาง"
        }
    }

    var displayEnglish: String {
        switch self {
        case .mr: "Mr."
        case .miss: "Miss"
        case .mrs: "Mrs."
        }
    }
}
