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
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "3.2.0-beta.20")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXFoundation-3.2.0-beta.20.xcframework.zip",
			checksum: "c9c23672ee6bbca772336f7610ad5bb89ef3b6d10b439c1303ff7e06dd3d79d0"
		)
	]
)