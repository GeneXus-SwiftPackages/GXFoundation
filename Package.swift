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
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.6.0-rc.0")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXFoundation-1.6.0-rc.0.xcframework.zip",
			checksum: "13121123bfcb18611a61c842efe43084a2fc524c5aec7e1a2790e5453a10b290"
		)
	]
)