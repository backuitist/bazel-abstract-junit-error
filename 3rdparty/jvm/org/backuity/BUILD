load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "matchete_core",
    jars = [
        "//external:jar/org/backuity/matchete_core_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":matchete_macros"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "matchete_json",
    jars = [
        "//external:jar/org/backuity/matchete_json_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/json4s:json4s_native_2_12",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":matchete_core",
        ":matchete_junit"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "matchete_junit",
    jars = [
        "//external:jar/org/backuity/matchete_junit_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/junit:junit",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":matchete_core"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "matchete_macros",
    jars = [
        "//external:jar/org/backuity/matchete_macros_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/scala_lang:scala_reflect"
    ],
    visibility = [
        "//visibility:public"
    ]
)


