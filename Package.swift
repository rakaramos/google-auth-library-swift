// swift-tools-version:5.0

//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import PackageDescription

let package = Package(
    name: "Auth",
    products: [
        .library(name: "OAuth1", targets: ["OAuth1"]),
        .library(name: "OAuth2", targets: ["OAuth2"]),
        .library(name: "TinyHTTPServer", targets: ["TinyHTTPServer"]),
        .library(name: "SwiftyBase64", targets: ["SwiftyBase64"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", .branch("master")),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .branch("master")),
        .package(url: "https://github.com/attaswift/BigInt", .branch("master")),
    ],
    targets: [
        .target(name: "OAuth1",
                dependencies: ["CryptoSwift", "TinyHTTPServer"]),
        .target(name: "OAuth2",
                dependencies: ["CryptoSwift", "TinyHTTPServer", "BigInt", "SwiftyBase64"],
                exclude: ["FCMTokenProvider"]),
        .target(name: "TinyHTTPServer",
                dependencies: ["NIO", "NIOHTTP1"]),
        .target(name: "SwiftyBase64"),
    ]
)
