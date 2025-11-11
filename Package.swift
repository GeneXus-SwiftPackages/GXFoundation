// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXFoundation",
	platforms: [.iOS("15.0"), .watchOS("10.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXFoundation",
			targets: ["GXFoundationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "4.1.0-beta.6")
	],
	targets: [
		.target(name: "GXFoundationWrapper",
				dependencies: [
					"GXFoundation",
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXFoundation",
			url: "https://pkgs.genexus.dev/iOS/beta/GXFoundation-4.1.0-beta.6.xcframework.zip",
			checksum: "e2ee883791b644680b08299718c0fd51ea9af6430d657c44a0a9703c40170e52"
		)
	]
)