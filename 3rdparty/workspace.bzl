# Do not edit. bazel-deps autogenerates this file from maven-dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.thoughtworks.paranamer:paranamer:2.8", "lang": "java", "sha1": "619eba74c19ccf1da8ebec97a2d7f8ba05773dd6", "sha256": "688cb118a6021d819138e855208c956031688be4b47a24bb615becc63acedf07", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8.jar", "source": {"sha1": "8f3421a8203053a6ab4b74f76a0550d21eee8cfe", "sha256": "8a4bfc21755c36ccdd70f96d7ab891d842d5aebd6afa1b74e0efc6441e3df39c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8-sources.jar"} , "name": "com_thoughtworks_paranamer_paranamer", "actual": "@com_thoughtworks_paranamer_paranamer//jar", "bind": "jar/com/thoughtworks/paranamer/paranamer"},
    {"artifact": "junit:junit:4.12", "lang": "java", "sha1": "2973d150c0dc1fefe998f834810d68f278ea58ec", "sha256": "59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/junit/junit/4.12/junit-4.12.jar", "source": {"sha1": "a6c32b40bf3d76eca54e3c601e5d1470c86fcdfa", "sha256": "9f43fea92033ad82bcad2ae44cec5c82abc9d6ee4b095cab921d11ead98bf2ff", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/junit/junit/4.12/junit-4.12-sources.jar"} , "name": "junit_junit", "actual": "@junit_junit//jar", "bind": "jar/junit/junit"},
    {"artifact": "org.backuity:matchete-core_2.12:1.28.0", "lang": "scala", "sha1": "e0608b643fa3c8c8a0e59c15870454a98b37ffe4", "sha256": "37c0a5352405e28231b1982e42307ba9cc276f81a40146a565dfb05222867b6f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-core_2.12/1.28.0/matchete-core_2.12-1.28.0.jar", "source": {"sha1": "b0eafbdf93e4a7f8141e56eac21842032dbdafc0", "sha256": "2eb084e29242209118219a4341b6e782bb29110ef9a7b85b2a0b098ff1c4ca0f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-core_2.12/1.28.0/matchete-core_2.12-1.28.0-sources.jar"} , "name": "org_backuity_matchete_core_2_12", "actual": "@org_backuity_matchete_core_2_12//jar:file", "bind": "jar/org/backuity/matchete_core_2_12"},
    {"artifact": "org.backuity:matchete-json_2.12:1.28.0", "lang": "scala", "sha1": "4e68ffc88362ab3b1bdeedd9966a2ec22e2ebfc0", "sha256": "afdb48bed3f6208737c2669c6e5b6c09674d366f882359c1bc55785ac1781ed8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-json_2.12/1.28.0/matchete-json_2.12-1.28.0.jar", "source": {"sha1": "948bee46e4233c6c67244e796378e232e17a8fa4", "sha256": "9517855bec9b661ca9ebce5976a33e1f7bfd00205f96240a6212f8a03341556d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-json_2.12/1.28.0/matchete-json_2.12-1.28.0-sources.jar"} , "name": "org_backuity_matchete_json_2_12", "actual": "@org_backuity_matchete_json_2_12//jar:file", "bind": "jar/org/backuity/matchete_json_2_12"},
    {"artifact": "org.backuity:matchete-junit_2.12:1.28.0", "lang": "scala", "sha1": "0fe06ac1c31bc5b2e0b968b2f68b86f45fa6adec", "sha256": "7c0edd69e0a5133216208a38269d67a7c3693da7a417d144456378791b6ee04c", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-junit_2.12/1.28.0/matchete-junit_2.12-1.28.0.jar", "source": {"sha1": "25bf4e7f73da4afed568ad10540f8eb76eb621a6", "sha256": "bf3dc1dca47fe381961e8a9ba140d21779eeb1997ddd673f38d55979c600d41f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-junit_2.12/1.28.0/matchete-junit_2.12-1.28.0-sources.jar"} , "name": "org_backuity_matchete_junit_2_12", "actual": "@org_backuity_matchete_junit_2_12//jar:file", "bind": "jar/org/backuity/matchete_junit_2_12"},
    {"artifact": "org.backuity:matchete-macros_2.12:1.28.0", "lang": "scala", "sha1": "858434f51d6dca99d0026d24133d5bd2c39dd1d6", "sha256": "147184501542fc66dd5b892abba0af8968f56d893065202e0f75aaabe8b81699", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-macros_2.12/1.28.0/matchete-macros_2.12-1.28.0.jar", "source": {"sha1": "d7e3549329f973932632819b9c4defeefd5b28ce", "sha256": "75561828d0a197153f18d3fd37c92c40022d90c1dc76526c032b954833002afb", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/backuity/matchete-macros_2.12/1.28.0/matchete-macros_2.12-1.28.0-sources.jar"} , "name": "org_backuity_matchete_macros_2_12", "actual": "@org_backuity_matchete_macros_2_12//jar:file", "bind": "jar/org/backuity/matchete_macros_2_12"},
    {"artifact": "org.hamcrest:hamcrest-core:1.3", "lang": "java", "sha1": "42a25dc3219429f0e5d060061f71acb49bf010a0", "sha256": "66fdef91e9739348df7a096aa384a5685f4e875584cce89386a7a47251c4d8e9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar", "source": {"sha1": "1dc37250fbc78e23a65a67fbbaf71d2e9cbc3c0b", "sha256": "e223d2d8fbafd66057a8848cc94222d63c3cedd652cc48eddc0ab5c39c0f84df", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3-sources.jar"} , "name": "org_hamcrest_hamcrest_core", "actual": "@org_hamcrest_hamcrest_core//jar", "bind": "jar/org/hamcrest/hamcrest_core"},
    {"artifact": "org.json4s:json4s-ast_2.12:3.5.0", "lang": "java", "sha1": "979c95efd0eab59be7b526995ed41acdcfe18e5a", "sha256": "47345bc9cdce5532e4013a1c46d85bece9362385344439a416f4458f1e380bf2", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-ast_2.12/3.5.0/json4s-ast_2.12-3.5.0.jar", "source": {"sha1": "042bc889975ea5f13375b21f88ca055395a65806", "sha256": "d4c6029e89fd4a385a987fe8dfc630938faf8823a4c6401ebb01a623773b2522", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-ast_2.12/3.5.0/json4s-ast_2.12-3.5.0-sources.jar"} , "name": "org_json4s_json4s_ast_2_12", "actual": "@org_json4s_json4s_ast_2_12//jar", "bind": "jar/org/json4s/json4s_ast_2_12"},
    {"artifact": "org.json4s:json4s-core_2.12:3.5.0", "lang": "java", "sha1": "b6f38a8dafcfe23c22d83c6dd3001b3ca97f0a1f", "sha256": "0b768ba4d597213c9dc005a628a3662bd104c2521f1004458293ce70150ff2ac", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-core_2.12/3.5.0/json4s-core_2.12-3.5.0.jar", "source": {"sha1": "d7fe8959f54408d44ff06830b70f480856f88d09", "sha256": "99debb03a0f4cd232ee24440370a14c45a6b8b9a783001994811cb80cdb1a877", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-core_2.12/3.5.0/json4s-core_2.12-3.5.0-sources.jar"} , "name": "org_json4s_json4s_core_2_12", "actual": "@org_json4s_json4s_core_2_12//jar", "bind": "jar/org/json4s/json4s_core_2_12"},
    {"artifact": "org.json4s:json4s-native_2.12:3.5.0", "lang": "java", "sha1": "0acea06040f973022b21e803d0679e1436bcd256", "sha256": "df1f34c3c1dff10436c1cbd6148662630437149066e481aa9b600472ef38606f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-native_2.12/3.5.0/json4s-native_2.12-3.5.0.jar", "source": {"sha1": "e4bdf35f621cb175aeb2020e494128a6decef41e", "sha256": "e3c16da014c6e48520c28ed01dbc636ef90172dbd2a594b8b7075dd40c0d47db", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-native_2.12/3.5.0/json4s-native_2.12-3.5.0-sources.jar"} , "name": "org_json4s_json4s_native_2_12", "actual": "@org_json4s_json4s_native_2_12//jar", "bind": "jar/org/json4s/json4s_native_2_12"},
    {"artifact": "org.json4s:json4s-scalap_2.12:3.5.0", "lang": "java", "sha1": "24ea78aff4dc666814ef37126c6d7006ca90f1ee", "sha256": "fd96dfb6e0a7e59d6a74ef47eee5da91fa8b028b34382148238ff309bcbfd57b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-scalap_2.12/3.5.0/json4s-scalap_2.12-3.5.0.jar", "source": {"sha1": "8504b85292d9afcf21679ca953fa509bf911a043", "sha256": "b76a650b461cb9adf77230597d3f4a675eeadd12ee8b1bc606518ff530e93a43", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/json4s/json4s-scalap_2.12/3.5.0/json4s-scalap_2.12-3.5.0-sources.jar"} , "name": "org_json4s_json4s_scalap_2_12", "actual": "@org_json4s_json4s_scalap_2_12//jar", "bind": "jar/org/json4s/json4s_scalap_2_12"},
    {"artifact": "org.scala-lang.modules:scala-xml_2.12:1.0.6", "lang": "java", "sha1": "e22de3366a698a9f744106fb6dda4335838cf6a7", "sha256": "7cc3b6ceb56e879cb977e8e043f4bfe2e062f78795efd7efa09f85003cb3230a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6.jar", "source": {"sha1": "429925530fb0f9a6fb26e5160532b7b3426557c0", "sha256": "a7e8aac79394df396afda98b35537791809d815ce15ab2224f7d31e50c753922", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.12/1.0.6/scala-xml_2.12-1.0.6-sources.jar"} , "name": "org_scala_lang_modules_scala_xml_2_12", "actual": "@org_scala_lang_modules_scala_xml_2_12//jar", "bind": "jar/org/scala_lang/modules/scala_xml_2_12"},
    {"artifact": "org.scala-lang:scala-library:2.12.0", "lang": "java", "sha1": "270fc1cda47bc255f3cd03152ec8c2ed7d224e2b", "sha256": "0e72ec4ea955d0bad7f1a494e8df95163f1631df0ce8ec4f9f278fe4d5fd1824", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.0/scala-library-2.12.0.jar", "source": {"sha1": "896700a667d89de8ce18e1fa4b68a5719e5c0271", "sha256": "456b9b5a0cd6581923e8938305eae7a61976706b4e771ef158faf25f85f882dc", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.0/scala-library-2.12.0-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
    {"artifact": "org.scala-lang:scala-reflect:2.12.0", "lang": "java", "sha1": "980f68c6ca4fcf9d70c142160108ddfeaee0787a", "sha256": "f56553934378e6d3e8bf1d759a51f8b2fc4c99370774f0aaedaab8619517ccbe", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.0/scala-reflect-2.12.0.jar", "source": {"sha1": "0585a6df3a541c210edb37e47d978d7e44be3677", "sha256": "c21130c1ec42b207da452bae3e64b6d237837a2c5954ed29203053690da100a8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.12.0/scala-reflect-2.12.0-sources.jar"} , "name": "org_scala_lang_scala_reflect", "actual": "@org_scala_lang_scala_reflect//jar", "bind": "jar/org/scala_lang/scala_reflect"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
