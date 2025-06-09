// swift-tools-version: 5.9

import PackageDescription


let kivy = false
let local = true

let pykit_package: Package.Dependency = if kivy {
    .package(url: "https://github.com/KivySwiftLink/PySwiftKit", from: .init(311, 0, 0))
} else {
    if local {
        .package(path: "/Users/codebuilder/Documents/GitHub/PySwiftKit")
    } else {
        .package(url: "https://github.com/PythonSwiftLink/PySwiftKit", from: .init(311, 0, 0))
    }
}

let pykit: Target.Dependency = .product(name: "SwiftonizeModules", package: "PySwiftKit")


let sdl_package: Package.Dependency = if local {
    .package(path: "../SDL2Core")
} else {
    .package(url: "https://github.com/KivySwiftLink/SDL2Core", .upToNextMajor(from: "311.0.0"))
}

//let psw: Package.Dependency = if local {
//    .package(path: "/Volumes/CodeSSD/PythonSwiftGithub/PySwiftWrapper")
//} else {
//    .package(url: "https://github.com/PythonSwiftLink/PySwiftWrapper", from: .init(0, 0, 0))
//}

let package = Package(
    name: "KivyCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "KivyCore", targets: ["KivyCore"])
    ],
    dependencies: [
        //.package(url: "https://github.com/KivySwiftLink/SDL2Core", .upToNextMajor(from: "311.0.0")),
        //.package(url: "https://github.com/KivySwiftLink/PySwiftKit", .upToNextMajor(from: "311.0.0")),
        pykit_package,
        sdl_package,
        //psw,
        .package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: "311.0.0")),
        //.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", .upToNextMajor(from: "0.0.0"))
    ],
    targets: [
        .target(
            name: "KivyCore",
            dependencies: [
        		.product(name: "SDL2Core", package: "SDL2Core"),
        		.product(name: "SwiftonizeModules", package: "PySwiftKit"),
        		.product(name: "PythonCore", package: "PythonCore"),
        		"libkivy",
                .product(name: "PySwiftWrapper", package: "PySwiftKit")
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
        		//.plugin(name: "Swiftonize", package: "SwiftonizePlugin")
            ]
        ),
        .binaryTarget(
            name: "libkivy",
            url: "https://github.com/kivyswiftlink/KivyCore/releases/download/311.1.1/libkivy.zip",
            checksum: "49447aa23ad6eedf8bd59f777041d8305c64d304aa6ae33cf7862ca1580eefff"
        )
    ]
)

