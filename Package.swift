// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "KivyCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "KivyCore", targets: ["KivyCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/kv-swift/SDL2Core", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/kv-swift/PySwiftKit", .upToNextMajor(from: "311.0.0")),
        .package(url: "https://github.com/kv-swift/PythonCore", .upToNextMajor(from: "311.0.0"))
    ],
    targets: [
        .target(
            name: "KivyCore",
            dependencies: [
        		.product(name: "SDL2Core", package: "SDL2Core"),
        		.product(name: "SwiftonizeModules", package: "PySwiftKit"),
        		.product(name: "PythonCore", package: "PythonCore"),
        		.target(name: "libkivy")
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
            url: "https://github.com/kv-swift/KivyCore/releases/download/311.1.21/libkivy.zip",
            checksum: "1c919a9d82c6650368462910ee6fe2c13978c9e58a22451e18cb75af07676253"
        )
    ]
)

