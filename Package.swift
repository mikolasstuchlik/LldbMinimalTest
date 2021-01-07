// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LldbMinimalTest",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .systemLibrary(name: "CGLib", pkgConfig: "gio-unix-2.0"),
        .target(
            name: "GLib", 
            dependencies: ["CGLib"],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-serialize-debugging-options"], .when(configuration: .debug))]
        ),
        .target(
            name: "LldbMinimalTest",
            dependencies: ["GLib"])
    ]
)
