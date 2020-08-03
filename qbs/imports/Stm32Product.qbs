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

    consoleApplication: true
    cpp.positionIndependentCode: false
    cpp.executableSuffix: ".elf"
        
    //property string home: rootPath + "/.."

    property string config: rootPath + "/Config"
    property string freeRTOSPath: rootPath + "/Middlewares/Third_Party/FreeRTOS"
    property string cmsis_RTOSPath: freeRTOSPath + "/Source/CMSIS_RTOS"
    property string fatFsPath: rootPath + "/Middlewares/Third_Party/FatFs"
    property string halPath: rootPath+ "/Drivers/STM32F7xx_HAL_Driver"
    property string cmsisPath: rootPath + "/Drivers/CMSIS"
    property string incPath: rootPath + "/Core/Inc"
    property string srcPath: rootPath + "/Core/Src"
}
