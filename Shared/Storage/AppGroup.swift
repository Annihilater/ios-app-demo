import Foundation

public enum AppGroup {
    public static func containerURL(id: String) -> URL? {
        FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: id)
    }
}
