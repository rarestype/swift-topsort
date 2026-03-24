// swift-tools-version:6.1
import PackageDescription

let package: Package = .init(
    name: "swift-topsort",
    platforms: [.macOS(.v15), .iOS(.v18), .tvOS(.v18), .visionOS(.v2), .watchOS(.v11)],
    products: [
        .library(name: "TopologicalSorting", targets: ["TopologicalSorting"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ordo-one/dollup", from: "1.0.1"),
    ],
    targets: [
        .target(
            name: "TopologicalSorting",
        ),

        .testTarget(
            name: "TopologicalSortingTests",
            dependencies: [
                .target(name: "TopologicalSorting"),
            ],
        ),
    ]
)
for target: Target in package.targets {
    {
        var settings: [SwiftSetting] = $0 ?? []

        settings.append(.enableUpcomingFeature("ExistentialAny"))
        settings.append(.define("DEBUG", .when(configuration: .debug)))

        $0 = settings
    } (&target.swiftSettings)
}
