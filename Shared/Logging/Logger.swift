import Foundation
import os

public enum AppLog {
    public static let general = Logger(subsystem: "ProxyClient", category: "general")
    public static let tunnel = Logger(subsystem: "ProxyClient", category: "tunnel")
    public static let rules = Logger(subsystem: "ProxyClient", category: "rules")
}
