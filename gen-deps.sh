#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bazel-deps

# TODO pin nixpkgs

gen_maven_deps.sh generate -r "$PWD" -s 3rdparty/workspace.bzl -d maven-dependencies.yaml
