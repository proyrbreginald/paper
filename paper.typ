/**
 * 获取全局参数配置
 */
#let today = datetime.today()
#let title = [面向工业机器人的嵌入式系统可靠固件更新架构设计]

/**
 * 设置页面尺寸
 */
#set page(
  paper: "a4",
  numbering: "第 1 / 1 页",
  header: [
    #block(
      width: 100%,
      inset: (bottom: 8pt),
      stroke: (bottom: 1pt + gray),
    )[
      #align(center)[深圳大学本科毕业论文——#title]
    ]
  ],
)

/**
 * 设置正文字体
 */
#set text(font: "Times New Roman", size: 12pt)

/**
 * 论文封面
 */
#page(numbering: none, header: none)[
  #align(center)[
    #image("assets/logo.svg", width: 30%)
  ]

  #align(center)[
    #text(font: "STXingkai", size: 36pt, tracking: 18pt)[
      #par[深圳大学]
    ]
  ]

  #align(center)[
    #text(font: "Microsoft YaHei", size: 26pt, tracking: 13pt)[
      #par[]
      #par[本科毕业论文(设计)]
      #par[]
    ]
  ]

  #align(center)[
    #block(
      width: 18pt * 13,
    )[
      #text(font: "KaiTi", size: 18pt)[
        #par[题目：#underline[面向工业机器人的嵌入]]
        #par[#underline[式系统可靠固件更新架构设计]]
        #par[姓名：#underline[#str("       ")杨荣宝#str("       ")]]
        #par[专业：#underline[#str("  ")微电子科学与工程#str("  ")]]
        #par[学院：#underline[#str("   ")电子与信息工程#str("   ")]]
        #par[学号：#underline[#str("     ")2022280136#str("     ")]]
        #par[指导教师：#underline[#str("     ")刘春平#str("     ")]]
        #par[职称：#underline[#str("        ")教授#str("        ")]]
      ]
    ]
  ]

  #align(center + bottom)[
    #text(font: "FangSong", size: 16pt)[
      #today.display("[year]年[month]月[day]日")
    ]
  ]
]

/**
 * 诚信声明
 */
#page(numbering: none, header: none)[
  #align(center)[
    #text(font: "Microsoft YaHei", size: 18pt, weight: "bold")[
      #par[]
      #par[]
      #par[深圳大学本科毕业论文（设计）诚信声明]
      #par[]
      #par[]
      #par[]
    ]
  ]

  #text(font: "SimSun", size: 14pt)[
    #par(
      first-line-indent: 14pt * 2,
      leading: 14pt * 2,
    )[
      本人郑重声明：所呈交的毕业论文（设计），题目《#underline[面向工业机器人的嵌入式系统可靠固件更新架构设计]》是本人在指导教师的指导下，独立进行研究工作所取得的成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式注明。除此之外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。本人完全意识到本声明的法律结果。
    ]
  ]

  #align(right + bottom)[
    #text(font: "SimSun", size: 14pt)[
      #par[毕业论文（设计）作者签名：#underline[#str("   ")杨荣宝#str("   ")]]
      #par[]
      #par[]
      #par[#today.display("[year]年[month]月[day]日")]
      #par[]
      #par[]
    ]
  ]
]

/**
 * 页数重新从1开始计数
 */
#counter(page).update(1)

/**
 * 目录
 */
#page(numbering: "i", header: none)[
  #[
    #show outline.entry: set block(above: 16pt, below: 16pt)
    #set text(size: 14pt)
    #outline(depth: 3, indent: 14pt * 2, title: [
      #block(width: 100%)[
        #align(center)[
          #text(font: "Microsoft YaHei", size: 16pt, weight: "bold", tracking: 16pt)[
            #par[目录]
            #par[]
          ]
        ]
      ]
    ])
  ]
]

/**
 * 配置参数
 */
#counter(page).update(1)
#show heading.where(level: 1): set text(
  font: "Microsoft YaHei",
  size: 16pt,
)
#show heading.where(level: 2): set text(
  font: "Microsoft YaHei",
  size: 14pt,
)
#show heading.where(level: 3): set text(
  font: "Microsoft YaHei",
  size: 12pt,
)
#set heading(numbering: "1.1")

/**
 * 正文
 */
#page[
  #heading(level: 1, numbering: none)[摘要]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    简述物联网及嵌入式设备对固件在线升级（OTA）的迫切需求。针对传统全量固件升级存在的传输时间长、Flash擦写损耗大等问题，本文设计并实现了一款基于32位嵌入式单片机的Bootloader系统。该系统不仅支持标准的UART全量固件升级，还深度集成了detools差分还原算法实现高效的差分升级。系统通过重新划分Flash与RAM空间映射、采用纯C语言重写启动文件及复位逻辑，实现了Loader与App的无缝切换与代码复用。同时，引入RT-Thread Nano实时操作系统与Ymodem协议，提升了系统的任务调度能力和文件传输可靠性。最后，利用内核特性实现了CPU利用率监控。测试结果表明，该Bootloader运行稳定，差分升级功能显著降低了升级包体积与传输时间。
  ]

  #heading(level: 1, numbering: none)[关键词]

  = 绪论

  == 研究背景与意义

  - 探讨嵌入式设备固件升级（IAP/OTA）的必要性（修复Bug、迭代新功能）。
  - 分析现有升级方案的局限性：全量升级占用带宽大、传输慢；传统的汇编启动文件不易跨平台复用。
  - 引出差分升级（Differential Update）在资源受限MCU上的优势。

  == 国内外研究现状

  - 对比常见Bootloader的设计模式。
  - 分析常见的差分算法（如bsdiff、detools等）在嵌入式领域的应用情况及优缺点。

  == 本文主要工作

  - 简述项目的核心贡献（对应您的6条技术细节），说明本文的章节安排。

  = 系统总体架构与存储空间设计

  - 本章主要对应技术细节1，详细论述存储器（Memory）的重新规划，这是Bootloader运行的基础。

  == 系统总体架构设计

  - Bootloader系统整体框图：分为通信模块（UART/Ymodem）、调度模块（RT-Thread）、差分还原模块（detools）、系统底层控制（C语言启动与跳转）。

  == Flash存储区划分与管理

  - LOADER区： 系统上电默认执行的引导程序，包含升级逻辑与文件接收逻辑。
  - USER区： 存放用户实际业务的应用程序（App）。
  - PATCH区： 专门用于存放通过UART接收到的差分包（Patch），避免覆盖原有运行代码。
  - OEM区： 存放厂商出厂的初始固件（可作为差分还原的基础固件或用于出厂恢复）。

  == RAM存储区划分与数据共享机制

  - TCM区域利用： 划分ITCM（指令紧耦合内存）与DTCM（数据紧耦合内存），用于加速关键代码（如差分还原算法的核心运算）的执行。
  - 常规数据存放区： 存放OS堆栈、全局变量。
  - 启动参数区（Boot Params）： 关键设计。利用特定RAM地址在“软件复位”（Soft Reset）时不丢失数据的特性，实现Loader与App之间的通信（如标志位传递升级指令、跳转地址等），掉电后才丢失。
  - BKPRAM（备份RAM）： 用于保存重要的系统级备份数据，依赖后备电池供电，掉电不丢失。

  = 核心底层机制与RTOS集成

  - 本章主要对应技术细节2、3、5，重点论述底层启动逻辑和系统资源管理。

  == 基于C语言的启动文件深度重写

  - 复位处理逻辑（Reset_Handler）重构： 摒弃传统的汇编启动代码，将Reset_Handler独立出来用纯C语言实现，提高代码可读性与可移植性。
  - RAM数据初始化： 在C语言中实现.data段的搬运和.bss段的清零操作。
  - App与Loader代码复用： 统一的C语言启动框架使得Loader和App可以复用相同的初始化逻辑。
  - App启动检测机制： 在复位处理函数中加入校验逻辑（校验栈顶指针、复位向量有效性、启动参数区的标志位），以决定是留在Loader层还是跳转进入User App。

  == RT-Thread Nano操作系统的移植与应用

  - 移植过程： 适配目标MCU的中断与上下文切换机制，配置系统时钟。
  - 多任务调度： 将串口接收、差分解压还原、系统监控等功能分离成独立的线程（Task），实现业务逻辑的模块化解耦，解决裸机下阻塞式等待的问题。

  == CPU使用率监视器的设计与实现

  - 内核特性利用： 利用ARM Cortex-M的DWT（Data Watchpoint and Trigger）周期计数器或SysTick，精确记录任务运行时间与空闲任务（Idle Task）时间。
  - 性能监控： 实现实时统计并输出CPU占用率，为差分算法的资源消耗评估和系统优化提供数据支持。

  = 固件传输协议与差分升级核心技术

  - 本章对应技术细节4和6，是本文实现升级功能的业务核心。

  == 基于UART与Ymodem协议的文件传输
  - Ymodem协议移植： 在RT-Thread环境下实现Ymodem协议的接收状态机（支持128字节与1024字节数据包，包含CRC校验）。
  - 文件分类识别机制： 通过Ymodem协议传输的首包（Header Packet）提取文件名称。设计解析逻辑：若文件后缀或名称匹配全量规则，则直接写入USER区（或暂存并覆盖）；若匹配差分包规则，则写入PATCH区触发差分还原流程。

  == 基于detools的差分还原算法实现

  - 差分升级原理： 详述PC端使用detools结合crle算法（一种非常适合Flash小资源的游程编码压缩算法）对比新旧固件生成Patch文件的过程。
  - MCU端还原流程：
    + Loader从PATCH区读取差分包数据。
    + 将OEM区（或当前USER区）的旧版本固件作为基准（Base）。
    + 调用detools的C语言解码库（crle解压），在MCU内部进行流式运算。
    + 将合成后的全新固件数据流式写入USER区。
  - 内存优化策略： 针对单片机RAM小的特点，详细论述流式读写（Streaming I/O）在差分还原中的应用，避免将整个固件加载到RAM中。

  = 系统测试与分析

  - 验证系统的稳定性与各项指标。

  == 测试环境配置

  - 介绍测试使用的MCU平台（型号、主频、Flash/RAM大小）、编译工具链、PC端差分包生成工具。

  == 启动与文件传输功能测试

  - 验证Loader与App通过“启动参数区”切换的成功率。
  - 测试Ymodem协议传输全量固件与差分固件的正确性及传输速率。

  == 差分升级性能对比测试

  - 升级包体积对比： 选取几个实际版本迭代，对比全量固件与crle算法生成的Patch包大小（通常能压缩到原大小的10%以下）。
  - 时间耗时分析： 对比“全量传输+直接写入”与“差分包传输+detools还原计算”的总体耗时。

  == CPU占有率及内存开销评估

  - 利用已实现的“CPU监视器”模块，输出Ymodem接收时、detools还原计算时的峰值/平均CPU占用率。
  - 分析整个系统的ROM（Flash）占用和RAM开销，证明其轻量化。

  = 总结与展望

  == 全文总结

  - 回顾项目完成的6项核心技术指标。
  - 强调项目在节省传输带宽、提升Flash寿命、提高代码复用率方面的实际工程价值。

  == 后续工作展望

  - 安全性扩展： 增加固件的签名校验（如ECDSA或RSA）与数据解密（AES），防止固件被恶意篡改。
  - 防掉电恢复/双区回滚： 引入更完善的双区乒乓升级（A/B Slot）机制，防止升级中途断电导致系统变砖。
  - 传输链路扩展： 未来可扩展除UART外的OTA方式，如基于以太网、Wi-Fi、BLE等通信接口的升级。

]

/**
 * 参考文献
 */
#page[
  #heading(level: 1, numbering: none)[参考文献]
  #par[]
  #bibliography("assets/refs.bib", style: "ieee", title: none)
]

/**
 * 致谢
 */
#page[
  #align(center)[
    #heading(level: 1, numbering: none)[致谢]
    #par[]
  ]
]
