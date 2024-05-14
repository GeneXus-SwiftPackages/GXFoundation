// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXFoundation",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXFoundation",
			targets: ["GXFoundationWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "2.0.0-beta.32")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFoundation-2.0.0-beta.32.xcframework.zip",
			checksum: "7fa3bcdcfbd9a86ef968a3df27486a5af80b76d2793df7915a714e9cb6fdffbf"
		)
	]
)