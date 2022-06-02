import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMinor(from: "6.5.0")),
        ]
    ),
    platforms: [.iOS]
)
