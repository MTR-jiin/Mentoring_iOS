import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMinor(from: "6.5.0")),
            .remote(url: "https://github.com/bugkingK/RxHeadPageKit.git", requirement: .upToNextMajor(from: "3.0.1"))
        ]
    ),
    platforms: [.iOS]
)
