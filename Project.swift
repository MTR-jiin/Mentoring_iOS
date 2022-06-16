import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains MentoringIOS App target and MentoringIOS unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project Factory

protocol ProjectFactory {
    var projectName: String { get }
    var dependencies: [TargetDependency] { get }

    func generate() -> [Target]
}

// MARK: - Base Project Factory

class BaseProjectFactory: ProjectFactory {
    let projectName: String = "JobPlanetMyPage"

    let dependencies: [TargetDependency] = [
      .external(name: "RxSwift"),
      .external(name: "RxCocoa"),
      .package(product: "InfiniteLayout"),
      .package(product: "HeadPageKit"),
      .package(product: "TagListView"),
      .package(product: "UnderLineTextField"),
      
    ]
    
    let packages: [Package] = [
        .local(path: .relativeToRoot("vendor/UnderLineTextField")),
        .local(path: .relativeToRoot("vendor/TagListView")),
        .remote(url: "https://github.com/bugkingK/HeadPageKit", requirement: .branch("main")),
        .remote(url: "https://github.com/arnauddorgans/InfiniteLayout.git", requirement: .branch("master"))
    ]

    func generate() -> [Target] {
        [
            Target(
                name: projectName,
                platform: .iOS,
                product: .app,
                bundleId: "com.julia.test.\(projectName)",
                deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
                infoPlist: "\(projectName)/Support Files/Info.plist",
                sources: ["\(projectName)/**/*.swift",],
                resources: [
                    "\(projectName)/**/*.storyboard",
                    "\(projectName)/**/*.xib",
                    "\(projectName)/**/*.xcassets",
                    "\(projectName)/**/*.json",
                ],
                dependencies: dependencies
            )
        ]
    }
}

// MARK: - Project

let factory = BaseProjectFactory()

let project: Project = .init(
    name: factory.projectName,
    organizationName: factory.projectName,
    packages: factory.packages,
    targets: factory.generate()
)
