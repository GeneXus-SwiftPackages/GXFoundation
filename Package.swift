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
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "3.2.0")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXFoundation-3.2.0.xcframework.zip",
			checksum: "2f7ae0ab939663fcc82df201cf695de16f98e3d8fa7c30bf3c2c2e662b9d1d66"
		)
	]
)