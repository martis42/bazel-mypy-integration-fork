workspace(name = "bazel_mypy_integration")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load(
    "//repositories:repositories.bzl",
    mypy_integration_repositories = "repositories",
)

mypy_integration_repositories()

load("//repositories:deps.bzl", mypy_integration_deps = "deps")

mypy_integration_deps("//third_party:requirements.txt")

load("@mypy_integration_pip_deps//:requirements.bzl", install_mypy_deps = "install_deps")

install_mypy_deps()

http_archive(
    name = "buildifier_prebuilt",
    sha256 = "0450069a99db3d414eff738dd8ad4c0969928af13dc8614adbd1c603a835caad",
    strip_prefix = "buildifier-prebuilt-0.4.0",
    urls = [
        "http://github.com/keith/buildifier-prebuilt/archive/0.4.0.tar.gz",
    ],
)

load("@buildifier_prebuilt//:deps.bzl", "buildifier_prebuilt_deps")

buildifier_prebuilt_deps()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@buildifier_prebuilt//:defs.bzl", "buildifier_prebuilt_register_toolchains")

buildifier_prebuilt_register_toolchains()

http_archive(
    name = "com_google_protobuf",
    sha256 = "14e8042b5da37652c92ef6a2759e7d2979d295f60afd7767825e3de68c856c54",
    strip_prefix = "protobuf-3.18.0",
    urls = [
        "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v3.18.0.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.18.0.tar.gz",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()
