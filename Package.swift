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
            url: "https://github.com/kv-swift/KivyCore/releases/download/311.1.14/libkivy.zip",
            checksum: "f0347dde153f46768d523ca10d576c02e5620d99ddc6c6a5a85657d6438c732b"
        )
    ]
)

