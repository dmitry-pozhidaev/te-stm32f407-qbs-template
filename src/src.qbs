import qbs
import Stm32Application
import qbs.FileInfo
import qbs.ModUtils

Stm32Application {
    name: "Application"

    cpp.includePaths: [
        "app",
        "libs",
        "libs/cmsis",
        "libs/port/gcc",
        "libs/periphery",
        "libs/system",
        "libs/ethernet",
        "libs/lwip/src/",
        "libs/lwip/src/arch/",
        "libs/lwip/src/include",
        "libs/lwip/src/include/lwip",
        "libs/lwip/src/include/ipv4", //Use old internet protocol due ipv6 has experimental status
        "libs/lwip/src/include/netif",
        "libs/lwip/src/netif",
        "libs/lwip/include",
    ]
    cpp.defines: [
    "USE_FULL_LL_DRIVER",
    "HSE_VALUE=8000000",
    "HSE_STARTUP_TIMEOUT=100",
    "LSE_STARTUP_TIMEOUT=5000",
    "LSE_VALUE=32768",
    "MSI_VALUE=4194000",
    "HSI_VALUE=16000000",
    "LSI_VALUE=37000",
    "VDD_VALUE=3300",
    "PREFETCH_ENABLE=0",
    "INSTRUCTION_CACHE_ENABLE=1",
    "DATA_CACHE_ENABLE=1",
    "STM32L011xx",
    ]
    Properties {
        condition: cpp.debugInformation
        cpp.defines: outer.concat("DEBUG")
    }

    cpp.linkerScripts: [
        "../ldscripts/libs.ld",
        "../ldscripts/mem.ld",
        "../ldscripts/sections.ld",
    ]

    Group {
        name: "sources"
        prefix: "../**/"
        files: [
            "*.c",
            "*.cpp",
            "*.h",
            "*.s"
        ]
        excludeFiles: [
            "ipv6/*.*",
            "test/unit/**/*.*",
        ]
        cpp.cxxFlags: [ "-std=c++11" ]
        cpp.cFlags: [ "-std=gnu99" ]
        cpp.warningLevel: "all"
    }
    Group {
        name: "ldscripts"
        prefix: "../ldscripts/"
        files: "*.ld"
    }
}
