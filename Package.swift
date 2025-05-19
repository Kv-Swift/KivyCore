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
        .package(url: "https://github.com/KivySwiftLink/PySwiftKit", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "KivyCore",
            dependencies: [
        		.product(name: "SDL2Core", package: "SDL2Core"),
        		.product(name: "SwiftonizeModules", package: "PySwiftKit"),
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
            plugins: []
        ),
        .binaryTarget(
            name: "libkivy",
            url: "https://github.com/kivyswiftlink/KivyCore/releases/download/311.1.8/libkivy.zip",
            checksum: "c70f75d079b8f2161aa8bdc9952dbb89c6c0b0bfba5a8a754af933404b61c120"
        )
    ]
)

