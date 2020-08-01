import qbs

Product {
    Depends { name: "cpp" }
    
    cpp.commonCompilerFlags: [
        "-mcpu=cortex-m0plus",
        "-mthumb",
    ]
    cpp.linkerFlags: [
        "-mcpu=cortex-m0plus",
        "-mthumb",
    ]
}
