// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXFoundation",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXFoundation",
			targets: ["GXFoundationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.4.0-beta.20")
	],
	targets: [
		.target(name: "GXFoundationWrapper",
				dependencies: [
					"GXFoundation",
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXFoundation",
			url: "https://pkgs.genexus.dev/iOS/beta/GXFoundation-1.4.0-beta.20.xcframework.zip",
			checksum: "72044b927fdd6afc2048efca76a512d0fa1e658acc640ca0e1e84da6a3d62900"
		)
	]
)