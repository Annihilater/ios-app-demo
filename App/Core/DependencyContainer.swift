import Foundation

/// 轻量依赖容器。实现阶段注入 VPNManager、ConfigStore 等。
@MainActor
final class DependencyContainer {
    let environment: AppEnvironment

    init(environment: AppEnvironment = .placeholder) {
        self.environment = environment
    }
}
