"""Rules to load all dependencies of this project."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=function-docstring
def repositories():
    versions = struct(
        rules_python = "0.18.1",
        bazel_skylib = "1.2.0",
    )

    maybe(
        http_archive,
        name = "rules_python",
        url = "https://github.com/bazelbuild/rules_python/archive/{v}.tar.gz".format(v = versions.rules_python),
        strip_prefix = "rules_python-{v}".format(v = versions.rules_python),
        sha256 = "29a801171f7ca190c543406f9894abf2d483c206e14d6acbd695623662320097",
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{v}/bazel-skylib-{v}.tar.gz".format(v = versions.bazel_skylib),
            "https://github.com/bazelbuild/bazel-skylib/releases/download/{v}/bazel-skylib-{v}.tar.gz".format(v = versions.bazel_skylib),
        ],
        sha256 = "af87959afe497dc8dfd4c6cb66e1279cb98ccc84284619ebfec27d9c09a903de",
    )
