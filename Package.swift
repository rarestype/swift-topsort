// swift-tools-version:6.1
import PackageDescription

let package: Package = .init(
    name: "swift-topsort",
    products: [
    ],
    dependencies: [
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
for target: PackageDescription.Target in package.targets {
    {
        var settings: [PackageDescription.SwiftSetting] = $0 ?? []

        settings.append(.enableUpcomingFeature("ExistentialAny"))
        settings.append(.define("DEBUG", .when(configuration: .debug)))

        $0 = settings
    } (&target.swiftSettings)
}
