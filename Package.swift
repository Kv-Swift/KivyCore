// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "KivyCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "KivyCore", targets: ["KivyCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/KivySwiftLink/SDL2Core", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/KivySwiftLink/PythonSwiftLink", .upToNextMajor(from: "311.1.0")),
        .package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", .upToNextMajor(from: "0.0.0"))
    ],
    targets: [
        .target(
            name: "KivyCore",
            dependencies: [
        		.product(name: "SDL2Core", package: "SDL2Core"),
        		.product(name: "SwiftonizeModules", package: "PythonSwiftLink"),
        		.product(name: "PythonCore", package: "PythonCore"),
        		"libkivy"
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedFramework("OpenGLES"),
        		.linkedFramework("Accelerate"),
        		.linkedFramework("CoreMedia"),
        		.linkedFramework("CoreVideo")
        	],
            plugins: [
        		.plugin(name: "Swiftonize", package: "SwiftonizePlugin")]
        ),
        .binaryTarget(
            name: "libkivy",
            url: "https://github.com/kivyswiftlink/KivyCore/releases/download/311.0.11/libkivy.zip",
            checksum: "d661e4a052d835d730afafd299bfa8ce7ed2fc0f1db54f3540805f462590b1bf"
        )
    ]
)

