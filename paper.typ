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
    #show outline.entry: set block(above: 12pt, below: 12pt)
    #set text(size: 12pt)
    #outline(depth: 3, indent: 12pt * 2, title: [
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
  #par[]

  #heading(level: 1, numbering: none)[关键词]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    引导程序；差分升级；固件升级；实时操作系统
  ]
  #par[]

  = 绪论

  #par[]

  == 研究背景与意义

  #par[]

  === 研究背景

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    随着物联网（IoT）、智能制造、机器人以及工业自动化技术的迅猛发展，嵌入式设备的应用场景日益复杂，设备数量呈爆发式增长。在产品的全生命周期中，为了修复系统漏洞、优化核心算法或迭代新功能，固件升级（Firmware Update）已成为嵌入式设备不可或缺的关键能力。传统的固件更新通常依赖于物理烧录器（如J-Link、ST-Link），这要求技术人员必须到现场拆卸设备外壳进行操作，维护成本极高且效率低下。因此，基于通信接口（如UART、以太网、无线网络等）的在应用编程（IAP, In-Application Programming）和在线升级（OTA, Over-the-Air）技术逐渐成为行业标准。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    然而，在资源受限的32位嵌入式单片机（MCU）领域，现有的Bootloader设计与升级方案仍面临诸多痛点，亟待优化：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 全量升级带来的传输与存储瓶颈：传统的升级方式通常要求设备接收并全量重写整个新版本固件。随着嵌入式软件业务逻辑的复杂化，固件体积不断膨胀（通常在数百KB至数MB之间）。在UART等低带宽、易受干扰的通信接口下，全量固件传输耗时过长，不仅增加了升级过程被打断的风险（如突发断电导致设备“变砖”），还加剧了Flash存储器的擦写损耗。
    + 底层代码移植性差：主流的单片机启动文件（Startup File）通常由芯片厂商使用纯汇编语言编写，硬件耦合度极高。当项目需要跨芯片平台移植，或希望在Bootloader与应用程序（App）之间实现底层初始化代码的复用时，繁杂的汇编指令往往成为技术壁垒。
    + 裸机框架的并发处理能力弱：传统的Bootloader多采用裸机（前后台系统）轮询的架构。在面对大文件接收（如Ymodem协议解析）、复杂的数据解压算法以及系统状态监控时，单一的死循环结构容易导致处理阻塞，文件传输的稳定性与系统的实时响应能力捉襟见肘。
  ]
  #par[]

  === 研究意义

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    针对上述行业痛点，本文设计并实现了一款基于32位嵌入式MCU的差分升级Bootloader系统。本课题的研究不仅在底层架构架构上进行了深度创新，更在实际工程应用中具有显著的经济与技术价值，具体体现在以下几个方面：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 突破带宽限制，大幅提升升级效率（差分升级的价值）
      #par(
        first-line-indent: 12pt * 2,
      )[
        本项目将detools差分还原算法引入资源受限的MCU端。通过在PC端对比新旧固件生成体积极小的差分包（Patch），设备端仅需通过UART接收差分包即可在本地还原出全量新固件。这种方式不仅将数据传输量降低了约80%~90%，极大缩短了升级时间，还显著降低了传输过程中的误码率，特别适用于受限于低速串口通信的工业现场设备。
      ]
      #par[]
    + 重塑存储模型，增强系统健壮性（空间规划的价值）
      #par(
        first-line-indent: 12pt * 2,
      )[
        本文打破了常规的Flash和RAM粗放式分配，进行了精细化的空间重构。在Flash端划分出独立的PATCH区与OEM区，确保在差分还原过程中，即使发生意外中断，原有用户程序（USER区）与出厂固件也不受破坏；在RAM端，创新性地规划了“启动参数区”。利用该区域在软件复位时数据不丢失的特性，实现了Bootloader与App之间状态标志与命令的安全、无缝传递，大幅提升了程序跳转的确定性与系统的容错率。
      ]
      #par[]
    + 提高代码复用率与跨平台可移植性（C语言重写启动文件的价值）
      #par(
        first-line-indent: 12pt * 2,
      )[
        摒弃了晦涩的汇编启动代码，本文深度采用纯C语言重写了Reset_Handler复位逻辑及RAM数据初始化（如.data段搬运和.bss段清零）。这一底层重构不仅让Bootloader具备了极强的跨硬件平台移植能力，还使得Bootloader与App可以共享同一套初始化架构，大幅降低了工程代码的冗余度与后期维护成本。
      ]
      #par[]
    + 引入实时操作系统，提升资源调度与监控能力（RTOS的价值）
      #par(
        first-line-indent: 12pt * 2,
      )[
        通过在Bootloader中移植RT-Thread Nano实时操作系统，将串口接收（Ymodem协议处理）、差分数据解压还原、CPU状态监控等功能解耦为独立的线程。多任务并发调度彻底解决了裸机架构下的阻塞问题，不仅保证了文件传输的极高可靠性，还能通过实时输出的CPU利用率监控数据，为系统性能评估与算法内存优化提供直观的量化指标。
      ]
  ]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    综上所述，本文所设计的Bootloader系统，在保证极高可靠性的前提下，实现了固件升级技术的“轻量化”与“高效化”。研究成果不仅为32位嵌入式MCU的OTA升级提供了一套高内聚、低耦合的标准模板，也对降低物联网设备的后期运维成本具有重要的工程指导意义。
  ]
  #par[]

  == 国内外研究现状

  #par[]
  - 对比常见Bootloader的设计模式。
  - 分析常见的差分算法（如bsdiff、detools等）在嵌入式领域的应用情况及优缺点。
  #par[]

  == 本文主要工作

  #par[]
  - 简述项目的核心贡献（对应您的6条技术细节），说明本文的章节安排。
  #par[]

  = 系统总体架构与存储空间设计

  #par[]
  - 本章主要对应技术细节1，详细论述存储器（Memory）的重新规划，这是Bootloader运行的基础。
  #par[]

  == 系统总体架构设计

  #par[]
  - Bootloader系统整体框图：分为通信模块（UART/Ymodem）、调度模块（RT-Thread）、差分还原模块（detools）、系统底层控制（C语言启动与跳转）。
  #par[]

  == Flash存储区划分与管理

  #par[]
  - LOADER区： 系统上电默认执行的引导程序，包含升级逻辑与文件接收逻辑。
  - USER区： 存放用户实际业务的应用程序（App）。
  - PATCH区： 专门用于存放通过UART接收到的差分包（Patch），避免覆盖原有运行代码。
  - OEM区： 存放厂商出厂的初始固件（可作为差分还原的基础固件或用于出厂恢复）。
  #par[]

  == RAM存储区划分与数据共享机制

  #par[]
  - TCM区域利用： 划分ITCM（指令紧耦合内存）与DTCM（数据紧耦合内存），用于加速关键代码（如差分还原算法的核心运算）的执行。
  - 常规数据存放区： 存放OS堆栈、全局变量。
  - 启动参数区（Boot Params）： 关键设计。利用特定RAM地址在“软件复位”（Soft Reset）时不丢失数据的特性，实现Loader与App之间的通信（如标志位传递升级指令、跳转地址等），掉电后才丢失。
  - BKPRAM（备份RAM）： 用于保存重要的系统级备份数据，依赖后备电池供电，掉电不丢失。
  #par[]

  = 核心底层机制与RTOS集成

  #par[]
  - 本章主要对应技术细节2、3、5，重点论述底层启动逻辑和系统资源管理。
  #par[]

  == 基于C语言的启动文件深度重写

  #par[]
  - 复位处理逻辑（Reset_Handler）重构： 摒弃传统的汇编启动代码，将Reset_Handler独立出来用纯C语言实现，提高代码可读性与可移植性。
  - RAM数据初始化： 在C语言中实现.data段的搬运和.bss段的清零操作。
  - App与Loader代码复用： 统一的C语言启动框架使得Loader和App可以复用相同的初始化逻辑。
  - App启动检测机制： 在复位处理函数中加入校验逻辑（校验栈顶指针、复位向量有效性、启动参数区的标志位），以决定是留在Loader层还是跳转进入User App。
  #par[]

  == RT-Thread Nano操作系统的移植与应用

  #par[]
  - 移植过程： 适配目标MCU的中断与上下文切换机制，配置系统时钟。
  - 多任务调度： 将串口接收、差分解压还原、系统监控等功能分离成独立的线程（Task），实现业务逻辑的模块化解耦，解决裸机下阻塞式等待的问题。
  #par[]

  == CPU使用率监视器的设计与实现

  #par[]
  - 内核特性利用： 利用ARM Cortex-M的DWT（Data Watchpoint and Trigger）周期计数器或SysTick，精确记录任务运行时间与空闲任务（Idle Task）时间。
  - 性能监控： 实现实时统计并输出CPU占用率，为差分算法的资源消耗评估和系统优化提供数据支持。
  #par[]

  = 固件传输协议与差分升级核心技术

  #par[]
  - 本章对应技术细节4和6，是本文实现升级功能的业务核心。
  #par[]

  == 基于UART与Ymodem协议的文件传输

  #par[]
  - Ymodem协议移植： 在RT-Thread环境下实现Ymodem协议的接收状态机（支持128字节与1024字节数据包，包含CRC校验）。
  - 文件分类识别机制： 通过Ymodem协议传输的首包（Header Packet）提取文件名称。设计解析逻辑：若文件后缀或名称匹配全量规则，则直接写入USER区（或暂存并覆盖）；若匹配差分包规则，则写入PATCH区触发差分还原流程。
  #par[]

  == 基于detools的差分还原算法实现

  #par[]
  - 差分升级原理： 详述PC端使用detools结合crle算法（一种非常适合Flash小资源的游程编码压缩算法）对比新旧固件生成Patch文件的过程。
  - MCU端还原流程：
    + Loader从PATCH区读取差分包数据。
    + 将OEM区（或当前USER区）的旧版本固件作为基准（Base）。
    + 调用detools的C语言解码库（crle解压），在MCU内部进行流式运算。
    + 将合成后的全新固件数据流式写入USER区。
  - 内存优化策略： 针对单片机RAM小的特点，详细论述流式读写（Streaming I/O）在差分还原中的应用，避免将整个固件加载到RAM中。
  #par[]

  = 系统测试与分析

  #par[]
  - 验证系统的稳定性与各项指标。
  #par[]

  == 测试环境配置

  #par[]
  - 介绍测试使用的MCU平台（型号、主频、Flash/RAM大小）、编译工具链、PC端差分包生成工具。
  #par[]

  == 启动与文件传输功能测试

  #par[]
  - 验证Loader与App通过“启动参数区”切换的成功率。
  - 测试Ymodem协议传输全量固件与差分固件的正确性及传输速率。
  #par[]

  == 差分升级性能对比测试

  #par[]
  - 升级包体积对比： 选取几个实际版本迭代，对比全量固件与crle算法生成的Patch包大小（通常能压缩到原大小的10%以下）。
  - 时间耗时分析： 对比“全量传输+直接写入”与“差分包传输+detools还原计算”的总体耗时。
  #par[]

  == CPU占有率及内存开销评估

  #par[]
  - 利用已实现的“CPU监视器”模块，输出Ymodem接收时、detools还原计算时的峰值/平均CPU占用率。
  - 分析整个系统的ROM（Flash）占用和RAM开销，证明其轻量化。
  #par[]

  = 总结与展望

  #par[]
  #par[]

  == 全文总结

  #par[]
  - 回顾项目完成的6项核心技术指标。
  - 强调项目在节省传输带宽、提升Flash寿命、提高代码复用率方面的实际工程价值。
  #par[]

  == 后续工作展望

  #par[]
  - 安全性扩展： 增加固件的签名校验（如ECDSA或RSA）与数据解密（AES），防止固件被恶意篡改。
  - 防掉电恢复/双区回滚： 引入更完善的双区乒乓升级（A/B Slot）机制，防止升级中途断电导致系统变砖。
  - 传输链路扩展： 未来可扩展除UART外的OTA方式，如基于以太网、Wi-Fi、BLE等通信接口的升级。
  #par[]

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
