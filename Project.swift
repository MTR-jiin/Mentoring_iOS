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
      .external(name: "TagListView")
    ]

    func generate() -> [Target] {
        [
            Target(
                name: projectName,
                platform: .iOS,
                product: .app,
                bundleId: "com.julia.test.\(projectName)",
                deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
                infoPlist: "\(projectName)/Sources/Application/Info.plist",
                sources: ["\(projectName)/**/*.swift",],
                resources: [
                    "\(projectName)/**/*.storyboard",
                    "\(projectName)/**/*.xib",
                    "\(projectName)/**/*.xcassets",
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
    targets: factory.generate()
)
