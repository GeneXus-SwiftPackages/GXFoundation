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
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "3.0.0-beta.11")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFoundation-3.0.0-beta.11.xcframework.zip",
			checksum: "19d96367303fab79932be9c7825fcea83ec4d35a6da8e8f2e7c27e6f0e6e33e7"
		)
	]
)