/**
 * 获取全局参数配置
 */
#let today = datetime.today()
#let title = [面向工业机器人的嵌入式系统可靠固件更新架构设计]

/**
 * 设置页面默认参数
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
  background: {
    let watermark = align(center + horizon, rotate(-30deg, text(fill: rgb("#E0E0E0"), size: 32pt, "杨荣宝")))
    let repeats = (watermark,) * 15
    grid(
      columns: 3,
      rows: 5,
      gutter: 5cm,
      ..repeats
    )
  },
)

/**
 * 设置正文字体
 */
#set text(font: "Times New Roman", size: 12pt)

/**
 * 为所有代码块设置背景与字体
 */
#show raw: set block(fill: rgb("#f5f5f5"), inset: 8pt, radius: 8pt)
#show raw: set text(font: (
  (name: "Consolas"),
  "STKaiti",
))

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
  #par(
    first-line-indent: 12pt * 2,
  )[
    随着物联网产业的规模化发展，嵌入式设备的在线升级（OTA, Over-the-Air）与在应用编程（IAP, In-Application Programming）技术已成为国内外学术界与工业界的研究热点。Bootloader作为实现固件升级的核心底层软件，其架构设计、传输协议及更新算法经历了从简单到复杂、从粗放式到精细化的演进过程。当前国内外的研究现状主要集中在以下几个维度：
  ]
  #par[]

  === 嵌入式Bootloader架构与RTOS应用现状

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    早期的MCU Bootloader通常采用简单的“裸机”前后台架构（即while(1)超级循环加中断）。这种架构虽然对Flash和RAM资源占用极小，但在处理复杂逻辑时存在明显短板。例如，在通过UART接收文件时，如果同时需要进行大面积的Flash擦写操作，极易引发系统的阻塞，导致通信协议（如Xmodem、Ymodem等）超时报错甚至升级失败。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    近年来，随着32位MCU（如ARM Cortex-M系列）硬件资源的不断丰富，国内外许多学者开始致力于将轻量级实时操作系统（RTOS）引入Bootloader中。例如，FreeRTOS、国内的RT-Thread Nano等被广泛应用于升级程序的底层调度。通过多线程管理，系统能够将“通信接收”、“固件存储”、“状态监控”等任务解耦。研究表明，在Bootloader中引入RTOS，不仅能大幅提升Ymodem等文件传输协议的稳定性和容错率，还能利用操作系统的空闲任务（Idle Task）实现对CPU占用率的精确监控，为系统资源的性能评估提供数据支撑。
  ]
  #par[]

  === 差分升级算法在资源受限设备中的研究现状

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    传统的固件升级方式多为“全量升级”，即每次都下载完整的固件包。这在网络带宽有限或对功耗要求极高的场景下（如NB-IoT、LoRa或低速UART总线设备）表现出极大的局限性。因此，差分升级技术（Differential Update）逐渐由PC端和智能手机端（如Android系统的OTA）下沉至嵌入式领域。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在PC和Linux嵌入式系统中，主流的差分算法是基于bsdiff/bspatch或xdelta。然而，这些经典算法在还原阶段通常依赖bzip2解压机制，需要占用极大的动态内存（通常在MB级别），这对于RAM空间仅有几十到上百KB的常规32位单片机而言是完全无法承受的。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    针对这一痛点，近年来国内外工业界开源了多种适用于微控制器的轻量化差分算法。其中，detools由于其极低的内存开销（RAM Footprint）和优异的压缩比，成为了研究的热点。detools结合crle（一种基于游程编码的无损数据压缩算法）等机制，支持流式处理（Streaming I/O）。现有的先进研究主要致力于将这类算法与MCU的底层Flash读写深度结合，通过在Flash中划分出专门的PATCH暂存区，使得MCU可以在不将完整固件载入RAM的情况下，边读取、边解压、边写入，成功解决了小内存运行复杂差分算法的业界难题。
  ]
  #par[]

  === 嵌入式底层启动机制与存储器管理优化现状

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    Bootloader的设计深度依赖于MCU的底层启动机制和存储器映射。传统上，绝大多数芯片厂商（如ST、NXP）提供的启动文件（Startup File）均采用汇编语言编写。这种做法虽然执行效率高，但代码晦涩难懂，且与特定的编译器（如Keil MDK、IAR、GCC）强绑定，导致跨平台移植困难；同时，Bootloader和App之间难以实现底层初始化代码的复用。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为了提高代码的可维护性和跨平台能力，国内外部分前沿开源项目和学术研究开始探索“纯C语言启动框架”。通过在C语言层面接管复位中断（Reset_Handler），手动控制.data段的搬运和.bss段的清零，不仅消除了对汇编的依赖，还使得Loader阶段能够灵活控制外设的初始化状态。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    此外，在存储器管理方面，传统的升级参数传递多采用将标志位写入Flash特定扇区的方式，这会增加Flash的擦写损耗并延长启动时间。当前的优化研究倾向于利用RAM的精细化划分：一方面利用MCU的高速紧耦合内存（ITCM/DTCM）加速核心算法的执行；另一方面，开辟出不被复位清零的“启动参数区（No-Init RAM）”和BKPRAM备份区。通过软复位（Soft Reset）技术在内存中直接传递跳转指令和状态标识，极大地提高了Bootloader与App切换的响应速度与系统健壮性。
  ]
  #par[]

  === 现有研究的局限性与本文的切入点

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    综合来看，虽然国内外在嵌入式OTA升级、RTOS应用以及轻量级差分算法上均取得了丰硕的成果，但在实际工程应用中，能够将这些先进技术进行深度整合与极致优化的方案依然较少。大部分方案要么仅停留在全量升级阶段，要么其差分升级仍面临内存溢出的风险；此外，底层启动代码的僵化仍然制约着Bootloader代码的跨项目复用。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    基于上述现状，本文以解决传统升级方案中“传输慢、移植难、阻塞卡顿”等痛点为切入点，深入研究并设计了一款集成了RT-Thread Nano多任务调度、Ymodem可靠传输以及detools差分核心算法的现代Bootloader。在此基础上，本文创新性地重写了C语言底层启动文件，并对存储器空间进行了精细化重构，旨在为32位嵌入式设备提供一套高可靠、低开销的差分升级完整解决方案。
  ]
  #par[]

  == 本文主要工作

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    本文针对传统32位嵌入式设备固件升级中存在的传输效率低、底层框架耦合度高、大文件接收易阻塞等工程痛点，设计并实现了一款具备差分升级能力的高可靠Bootloader系统。本项目不仅在应用层实现了高效的协议与算法，还在底层对单片机的启动机制与存储器分配进行了深度重构。本文的主要研究与开发工作包括以下五个方面：
  ]
  #par[]

  === 存储空间映射重构与精细化内存管理

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    打破了传统MCU粗放的存储器划分方式，重新设计了Flash与RAM的空间布局。在Flash侧，严格划分出LOADER区（引导程序）、USER区（用户程序）、PATCH区（差分包暂存）及OEM区（出厂固件备份），保障了升级过程的物理安全性；在RAM侧，充分利用芯片内核特性划分了ITCM与DTCM以加速核心算法执行，并创新性地开辟了“启动参数区（No-Init RAM）”。该区域的数据在软件复位（Soft Reset）时不会丢失，成功实现了Bootloader与App之间升级指令与状态标志的无缝传递。
  ]
  #par[]

  === 核心启动机制的纯C语言重写与代码复用

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    摒弃了传统高度依赖芯片厂商的汇编启动文件（Startup File），通过纯C语言深度重构了系统的启动流程。独立编写了Reset_Handler复位处理逻辑，并在C语言层面接管了.data段的搬运与.bss段的清零等RAM初始化工作。这一设计不仅大幅提升了Bootloader代码的跨平台可移植性，还使得Bootloader与User App能够复用同一套底层初始化框架。同时，在复位处理函数中加入了严格的App启动检测机制（如栈顶指针合法性校验、复位向量校验等），确保程序跳转的安全性。
  ]
  #par[]

  === 实时操作系统移植与系统资源监控设计

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为解决裸机轮询架构在面对大文件接收和复杂解压算法时的阻塞问题，本文在Bootloader中成功移植了轻量级实时操作系统RT-Thread Nano。通过引入多任务调度机制，将业务逻辑模块化分离为串口接收、差分还原、系统监控等独立线程，显著提升了系统的并发处理能力。此外，利用ARM Cortex-M内核的周期计数器等硬件特性，设计并实现了一套CPU使用率监视器，能够实时统计并输出系统负载，为后续算法的性能调优提供了量化依据。
  ]
  #par[]

  === 基于Ymodem协议的智能文件传输机制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在UART通信基础上移植了Ymodem文件传输协议，实现了稳定可靠的固件接收状态机。针对全量升级与差分升级并存的需求，设计了基于文件首包（Header Packet）的智能解析分类机制。系统通过提取下发文件的名称或后缀特征，自动判别固件类型：若为全量固件，则直接触发全量更新流程；若为差分包（Patch），则将其安全存入PATCH区，并触发差分还原流水线。
  ]
  #par[]

  === 轻量级差分还原算法（detools）的移植与优化

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    将适用于资源受限设备的轻量化差分工具detools深度集成至MCU端。配合PC端使用crle算法生成的极小体积差分包，在设备端实现了高效的固件还原计算。针对MCU内部RAM极小的物理限制，采用了流式处理（Streaming I/O）策略，使得系统无需将整个固件或差分包载入内存，即可通过“边读、边解压、边写”的方式，利用OEM区（或当前USER区）的旧版固件作为基准，重构出完整的新版固件，彻底解决了单片机差分升级的内存溢出瓶颈。
  ]
  #par[]

  === 本文的章节安排

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为了清晰地阐述上述研究工作，本文的具体章节安排如下：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 绪论：阐述课题的研究背景、意义，分析当前国内外固件升级技术的研究现状，并概括本文的主要研究内容。
    + 系统总体架构与存储空间设计：详细论述Bootloader的系统拓扑结构，以及Flash和RAM多重区域的精细化划分与功能定义。
    + 核心底层机制与RTOS集成：重点剖析基于纯C语言重写启动文件与复位逻辑的技术细节，并介绍RT-Thread Nano的移植过程及CPU利用率监视器的实现原理。
    + 固件传输协议与差分升级核心技术：深入讲解Ymodem协议状态机的实现与文件分类逻辑，详细推演基于detools与crle算法的差分还原流程及内存优化策略。
    + 系统测试与分析：搭建测试环境，对Bootloader的启动切换、全量/差分传输成功率、CPU与内存开销、升级耗时等关键指标进行系统性测试与量化分析。
    + 总结与展望：总结全文研究成果，客观分析当前系统的不足，并对未来的技术迭代与扩展方向进行展望。
  ]
  #par[]

  = 系统总体架构与存储空间设计

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    本章主要详细论述存储器（Memory）的重新规划，这是Bootloader运行的基础。
  ]
  #par[]

  == 系统总体架构设计

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为了实现高可靠、低耦合的差分固件升级，并充分发挥32位 MCU（本项目采用带有复杂存储器架构的 Cortex-M7 内核，如 STM32H743IIT6）的硬件性能，本系统摒弃了传统的“单体大循环”裸机架构，采用了分层解耦的模块化架构设计。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    系统总体架构自下而上可划分为四个核心层次：底层硬件抽象与启动层、存储与状态管理层、操作系统调度层以及升级业务逻辑层。
  ]
  #par[]

  === 底层硬件抽象与启动层

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    该层负责系统上电后的“第一条指令”执行以及底层硬件运行环境的搭建，核心表现为彻底重构的C语言启动框架。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 向量表与复位接管：在精简的汇编文件（vector.s）中定义复位向量表（vector_table），并将系统复位入口直接映射到纯 C 语言实现的 reset_handler()。
    - 硬件内核初始化：在 reset_handler() 中，系统优先调用 fpu_init() 开启浮点运算单元执行权限，调用 rcc_init() 配置系统时钟树（PLL）和 Flash 延迟（Latency），并调用 ram_init() 使能 MCU 特有的多个高级 RAM 域（如 D2SRAM、BKPRAM 及其独立时钟）。
    - C运行环境（C-Runtime）手动构建：系统利用内联优化的 C 函数 reset_copy_ram_init() 和 reset_clear_ram_uninit()，将 Flash 中的初始数据精确地搬运至 ITCM、DTCM、AXIRAM 及 AHBRAM 等指定的物理内存区域，并完成 .bss 段的清零，为操作系统的运行和差分算法的高效计算（如利用 ITCM 存放高频代码，DTCM 存放高频数据）做好了物理铺垫。
  ]
  #par[]

  === 存储与状态管理层

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    该层是打通 Bootloader（引导程序）与 User App（用户程序）的信息桥梁，负责物理空间的边界划分与运行状态的安全传递。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 物理存储分区映射：系统通过 partition.h 实现了 Flash 的四等分布局（LOADER区、USER区、PATCH区、OEM区），严格定义了各区间的地址（如 MCU_FLASH_START 为 0x08000000）与扇区容量，隔离了核心代码与下载数据的存储空间。
    - 共享状态参数区（Shared RAM）：这是架构设计的一大亮点。系统通过自定义的编译器属性宏（SECTION(".share")），将一个名为 load_config 的状态结构体（包含错误码、复位标志、升级策略、差分包大小等信息）显式分配到“启动参数区”。
    - 状态机校验与跳转控制：load.c 模块实现了基于 CRC16 的强校验机制（algo_crc16）。在软复位时，Loader 通过 load_read_config_which() 读取 load_config。若校验通过且目标明确，系统通过重写栈指针（#str("__set_MSP")）、更新中断向量表偏移（SCB->VTOR），执行向 USER 区或 OEM 区的安全跳转；若不满足跳转条件，则留在 Loader 层，并向下调用 load_boot() 准备初始化升级组件。
  ]
  #par[]

  === 操作系统调度层

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    作为承上启下的中枢，该层通过引入 RT-Thread Nano 实时操作系统，彻底改变了 Bootloader 的执行流。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - OS 接管与启动：在 load_boot() 函数中，系统完成了基础外设配置后，通过 rtthread_launch() 正式移交 CPU 控制权。
    - 多任务并发与资源隔离：操作系统将文件接收、差分还原、状态监控等功能拆分为独立的线程，利用操作系统的调度器（Scheduler）和信号量（Semaphore）机制，解决了大体量差分固件处理时可能导致的阻塞卡顿问题。
  ]
  #par[]

  === 升级业务逻辑层

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    处于架构最顶端，包含了面向用户的两大核心业务组件：
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 通信与文件传输组件：在多线程支持下，运行 Ymodem 协议状态机，稳定地通过 UART 接收上位机下发的 .bin（全量）或 .patch（差分）文件，并基于文件特征将其流式写入 Flash 的对应分区（USER 区或 PATCH 区）。
    - 差分还原引擎：集成了 detools 和 crle 解压算法。当检测到 PATCH 区有有效的差分包时，引擎利用 OEM 区（或当前 USER 区）作为基准（Base），在有限的 RAM 空间内进行“流式运算”（Streaming I/O），将合成后的新固件安全覆盖到 USER 区，最终修改 load_config 状态并触发 MCU 重启以加载新固件。
  ]
  #par[]

  == Flash存储区划分与管理

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在嵌入式设备的在线固件升级（OTA）过程中，Flash 存储器的物理划分方案直接决定了系统的安全性、升级成功率以及存储资源的利用率。本项目所采用的 MCU 为 STM32H743IIT6，其内部片上 Flash 总容量为 2MB，物理擦除粒度（扇区大小 MCU_FLASH_SECTOR_SIZE）为 128KB（0x00020000），共计 16 个扇区。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    传统的 Bootloader 通常仅划分“Boot区”与“App区”，在升级时直接覆写 App 区。这种做法一旦在升级过程中发生掉电或通信中断，极易导致设备固件损坏且无法恢复（即设备“变砖”）。为了满足差分升级算法（detools）的运行需求，并提供极高的防掉电容错能力，本文在 partition.h 中打破了常规布局，将 2MB 的 Flash 空间精细化地重构为四个逻辑分区：LOADER区、USER区、PATCH区和OEM区。具体划分与管理机制如下：
  ]
  #align(center)[
    #figure(
      caption: [STM32H743IIT6 Flash 存储器物理空间划分表],
      table(
        columns: (120pt, 160pt, 120pt),
        align: center + horizon,
        stroke: 0.5pt,
        fill: (col, row) => (
          if row == 0 { rgb("F2F2F2") } else if row == 1 { rgb("E6F3FF") } else if row == 2 {
            rgb("FFF2CC")
          } else if row == 3 { rgb("E2EFDA") } else if row == 4 { rgb("FCE4D6") }
        ),

        [*地址范围*], [*分区名称与功能*], [*容量 / 扇区数量*],

        [0x081FFFFF \ ~ \ ~ \ ~ \ ~ \ 0x08140000],
        block(height: 90pt)[#set align(center + horizon); *OEM 区* \ (厂商出厂固件)],
        [768 KB \ (6 个扇区)],

        [0x0813FFFF \ ~ \ 0x08100000],
        block(height: 30pt)[#set align(center + horizon); *PATCH 区* \ (差分包暂存)],
        [256 KB \ (2 个扇区)],

        [0x080FFFFF \ ~ \ ~ \ ~ \ ~ \ 0x08040000],
        block(height: 90pt)[#set align(center + horizon); *USER 区* \ (用户程序)],
        [768 KB \ (6 个扇区)],

        [0x0803FFFF \ ~ \ 0x08000000],
        block(height: 30pt)[#set align(center + horizon); *LOADER 区* \ (引导程序)],
        [256 KB \ (2 个扇区)],
      ),
    )
  ]
  #par[]

  === LOADER区（引导与升级控制区）

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 空间规划：分配 2 个扇区（共 256KB），起始地址为 0x08000000。
    - 核心功能：本区域是系统上电复位后最先执行的代码段。内部固化了底层时钟树配置、C语言运行环境构建、RT-Thread Nano 操作系统核心、Ymodem 串口文件传输协议以及 detools 差分还原引擎。
    - 设计考量：虽然基础的 Bootloader 通常仅需几十 KB，但由于本项目集成了完整的 RTOS 和复杂的流式解压缩算法，因此预留了 256KB 的充足空间，保证了后续 Bootloader 自身业务逻辑的扩展性。为了确保系统永远具备可恢复能力，在任何升级流程中，LOADER区均被设置为写保护，严禁被擦除或修改。
  ]
  #par[]

  === USER区（用户应用程序区）

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 空间规划：分配 6 个扇区（共 768KB），起始地址紧随 LOADER 区之后（0x08040000）。
    - 核心功能：用于存放设备在正常工况下运行的实际业务逻辑代码（即 User App）。
    - 管理机制：在引导阶段，当 load.c 模块读取到“启动参数区”的启动标识为 LOAD_APP_USER，且校验合法时，Bootloader 会关闭自身中断，将系统中断向量表偏移寄存器（SCB->VTOR）重定向至 0x08040000，并更新主栈指针（MSP），最终通过函数指针跳转至该区域执行。在全量升级或差分还原的最后阶段，新固件的数据将被写入此区域。
  ]
  #par[]

  === PATCH区（差分包暂存区）

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 空间规划：分配 2 个扇区（共 256KB），起始地址为 0x08100000。
    - 核心功能：专门用于暂存通过 UART 接收到的差分升级包（Patch 文件）。
    - 设计考量（核心亮点）：这是支撑差分升级的灵魂分区。在常规全量升级中，暂存区需要与 App 区等大（即也需要 768KB 的空间），这在资源紧张的 MCU 中往往难以实现（常被称为“A/B双区升级的存储瓶颈”）。而本文引入差分技术后，得益于 bsdiff/crle 算法极高的压缩比，新旧版本之间生成的差分包体积通常不足原固件大小的 10%。因此，分配 256KB 作为 PATCH 区已存在巨大的冗余量，完美解决了小容量 Flash 实现安全 OTA 的痛点。通过暂存机制，避免了在下载阶段直接破坏正在运行的旧版固件。
  ]
  #par[]

  === OEM区（厂商出厂固件及基准备份区）

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 空间规划：分配 6 个扇区（共 768KB），与 USER 区大小严格保持一致，起始地址为 0x08140000。
    - 核心功能：存放设备出厂时烧录的稳定版本固件（Base Firmware）。
    - 管理机制：OEM区在系统中扮演双重角色：
      + 差分还原基准：当差分引擎对 PATCH 区的压缩包进行解压时，需要提取旧数据参与运算。系统可将 OEM 区的稳定固件作为固定的还原基准源流出，与 PATCH 包通过 detools 算法合成出全新的固件并写入 USER 区。
      + 出厂恢复（Fallback）：如 load.c 代码所示，系统设计了 LOAD_APP_OEM 启动分支。当 USER 区因非法断电、恶意篡改或新版固件存在致命 Bug 导致无法运行时，Bootloader 能够侦测到异常，并在下一次重启时强制将 SCB->VTOR 导向 OEM 区，实现系统的“一键恢复出厂设置”，极大提升了工业现场设备的健壮性。
  ]
  #par[]

  === 跨分区安全协同管理

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    通过上述物理划分，系统构建了一个高度解耦的存储器管理模型。在一次完整的差分升级任务中，Flash 管理流程如下：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 传输阶段：Bootloader 将接收到的 .patch 数据流式写入 PATCH区，此过程完全不影响 USER区 与 OEM区 的数据完整性。
    + 合成阶段：系统从 OEM区（或当前运行正常的 USER区）读取基准字节，从 PATCH区 读取差分指令与补丁字节，两者在内存中交汇运算后，将生成的新固件逐扇区擦除并写入 USER区。
    + 收尾阶段：写入完成并进行 CRC 校验后，更新系统级标志位，完成向 USER区 的安全切换。
  ]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    该分区模型严格遵循了“隔离更新、留有退路”的高可靠软件设计原则，结合 STM32H7 大扇区的硬件特性，在节省 Flash 擦写寿命与提升升级容错率之间取得了完美的平衡。
  ]
  #par[]

  == RAM存储区划分与数据共享机制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    与传统的单总线单片机不同，现代高性能 32 位 MCU（如基于 Cortex-M7 内核的 STM32H7 系列）内部拥有多块挂载在不同总线上的独立 RAM 域。为了最大化利用硬件性能，加速 detools 差分还原算法的执行，并解决跨程序（Bootloader 与 App）状态传递的工程难题，本文对 MCU 的内部 RAM 进行了深度的精细化划分与属性分配。系统整体 RAM 架构被划分为以下四大功能区：
  ]
  #par[]

  === 高速紧耦合内存（ITCM 与 DTCM）的加速应用

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    Cortex-M7 架构特有的紧耦合内存（TCM）与处理器内核直接相连，能够实现指令和数据的“零等待状态（Zero-wait state）”访问，其运行速度远超挂载在 AXI 或 AHB 体系上的普通 SRAM。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - ITCM（指令紧耦合内存）：系统在 specification.h 中分配了近 64KB 的 ITCM 空间（起始地址 0x00000000）。为了防止与内核复位中断向量表（Vector Table）发生地址冲突，代码中巧妙地设置了 0x400 的起始偏移量。在工程应用中，通过自定义属性宏 SECTION(".itcm")，将 Flash 擦写核心函数以及差分解压算法（如 crle 核心逻辑）映射至此。系统复位时，底层 C 代码（reset_copy_ram_init）会主动将这些关键代码从 Flash 搬运至 ITCM 中执行。此举不仅大幅提升了差分还原的解算帧率，还彻底避免了“在 Flash 中擦写 Flash”时产生的总线访问冲突（Read-while-Write Stall）问题。
    - DTCM（数据紧耦合内存）：分配了 128KB 空间（起始地址 0x20000000）。通过链接脚本控制，该区域主要用于存放 RT-Thread Nano 的系统堆栈、高频调度的全局变量以及中断上下文中频繁访问的数据，从而将操作系统的调度开销降至最低。
  ]
  #par[]

  === 常规数据内存（AXI SRAM 与 AHB SRAM）的划分

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    STM32H7 拥有容量庞大的 AXI SRAM（512KB）和多块 AHB SRAM（如 288KB 的 SRAM1/2 和 64KB 的 SRAM4）。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在本系统中，这些常规 RAM 区域主要被作为大数据量的吞吐缓冲区。例如，在 Ymodem 协议接收大文件或 detools 进行流式读写（Streaming I/O）时，需要分配大量动态内存（Heap）作为缓存队列。系统在 reset.c 的 reset_handler 函数中，通过 C 语言接管了这些内存域的有值数据搬运（reset_copy_ram_init）和无值数据清零（reset_clear_ram_uninit），确保了文件系统的缓存读写操作不会受到未初始化脏数据的影响。
  ]
  #par[]

  === 启动参数区（Shared RAM）与数据共享机制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在固件升级的完整闭环中，“App 通知 Loader 有新包待更新”以及“Loader 升级结束后跳转回 App”是两个最关键的切换动作。传统的方案通常将状态标志写入 Flash 的特定扇区，但这种做法会引发擦写耗时并加剧 Flash 物理磨损。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为了实现零损耗、高实时性的状态传递，本文设计了基于 “No-Init RAM（非初始化内存）” 的共享数据机制：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 内存属性定义：在 attribute.h 中定义了宏 SECTION(".share")，配合链接脚本，在 RAM 中强行开辟了一段独立区域，并在底层启动文件（reset.c）的初始化流中刻意绕开了对该区域的清零操作。这意味着，只要芯片未发生物理掉电（即仅通过软件指令触发的 Soft Reset），该区域的数据将持续驻留。
    + 数据结构与防篡改机制：在 load.c 中定义了共享结构体 load_config_t，其中封装了启动目标（LOAD_APP_USER / LOAD_APP_OEM）、错误码（如 LOAD_ERROR_VERIFY）、差分包大小及操作标志。为了防止上电瞬间 RAM 数据随机性带来的误触发，系统为该结构体引入了严格的 algo_crc16 循环冗余校验。
    + 状态机流转：当用户在 App 中触发下载并暂存了 .patch 差分包后，App 会修改 load_config_t 的标志位并更新 CRC16 校验值，随后触发 NVIC_SystemReset()（软件复位）。系统重启进入 Loader 后，会第一时间读取并校验该共享结构体，若 CRC 匹配且指令合法，则直接启动升级状态机；升级完成后，Loader 再次修改该共享参数，重定向至 USER 区并触发跳转。
  ]
  #par[]

  === BKPRAM（备份 RAM）的持久化应用

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    针对特殊应用场景，系统还在 specification.h 中启用了 4KB 的 BKPRAM（备份 RAM，起始地址 0x38800000）。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在 ram_init() 初始化流中，系统使能了电源控制寄存器（PWR->CR1 |= PWR_CR1_DBP）的后备域访问权限。该区域挂载在 Vbat 后备电池域下，即使主电源完全断电，其数据也不会丢失。通过 SECTION(".backup") 宏修饰，该区域被用于保存极其关键的系统级日志（如升级中断的历史记录或设备防篡改时间戳），进一步提升了设备在恶劣工业现场环境下的抗掉电追溯能力。
  ]
  #par[]

  = 核心底层机制与RTOS集成

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    对于一款支持复杂差分算法与高可靠在线升级的 Bootloader 而言，底层的运行机制决定了系统的上限。传统的裸机开发模式高度依赖芯片厂商预编译的汇编启动代码，且在面对大体量固件传输和高耗时解压算法时，容易出现系统阻塞。针对这一痛点，本文在底层机制上进行了深度重构。本章首先详细阐述了基于纯 C 语言重写的 MCU 启动文件与复位流程，随后介绍了轻量级实时操作系统 RT-Thread Nano 的集成过程，最后论述了如何利用内核硬件特性构建精确的 CPU 使用率监控系统，从而为多任务调度与升级算法的稳定运行提供坚实的底层保障。
  ]
  #par[]

  == 基于C语言的启动文件深度重写

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在 ARM Cortex-M 架构的传统开发中，启动文件（如 startup_stm32h743xx.s）通常由数百行晦涩的汇编代码构成，负责初始化堆栈、清零 BSS 段、搬运 DATA 段以及调用 SystemInit 和 main 函数。这种高度硬件耦合的做法极大地限制了代码的跨平台可移植性，且导致 Bootloader 与 User App 之间难以共享底层初始化逻辑。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为此，本文摒弃了常规的纯汇编启动架构，采用“极简汇编向量表 + 纯C语言复位逻辑”的混合架构，对系统的启动（Reset_Handler）与 C 运行环境（C-Runtime）构建进行了彻底的深度重写。
  ]
  #par[]

  === 极简中断向量表设计与裸函数接管

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为了将控制权平滑地移交给 C 语言，系统在 vector.s 中仅保留了最基础的中断向量表（vector_table）结构声明。向量表的首个字定义为初始堆栈指针（#str("_stack_start")），第二个字即指向了复位处理程序（reset_handler）。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在 reset.c 模块中，本文利用 GCC 编译器的 #str("__attribute__((naked))") 属性宏（在系统代码中封装为 NAKED 宏），定义了纯 C 语言的复位处理函数 reset_handler(void)。NAKED 属性能够阻止编译器自动插入函数序言（Prologue）和跋语（Epilogue），确保复位后的第一条指令完全受控。进入该函数后，系统第一时间调用 #str("__set_MSP()") 强行刷新主栈指针，确保后续的 C 语言函数调用拥有安全的压栈空间。
  ]
  #par[]

  === 底层时钟树与硬件权限的提前初始化

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在进入 C 语言运行环境之前，必须确保关键硬件域的时钟已经就绪。在重写的 reset_handler 中，系统依次调用了底层硬件初始化接口：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + FPU权限开启（fpu_init）：通过配置系统控制块协处理器访问控制寄存器（SCB->CPACR），提前使能浮点运算单元（FPU），以支持后续差分算法中可能涉及的高效运算。
    + 时钟树配置（rcc_init）：重新配置 Flash 访问延迟（Latency）并配置系统锁相环（PLL），使得 CPU 尽早进入最高主频运行状态，缩短系统启动耗时。
    + 高级 RAM 域使能（ram_init）：针对 STM32H7 系列多总线 RAM 的特性，主动开启 D2SRAM1/2/3 等高级内存域的总线时钟（RCC_AHB2ENR），并使能 BKPRAM 的电源后备域访问权限，为后续的数据搬运铺平物理通道。
  ]
  #par[]

  === 高效 C-Runtime (CRT) 的手动构建与循环展开优化

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    由于剥离了标准库的启动文件，本文在 C 语言中手动实现了原本由编译器隐式完成的 C-Runtime 环境构建。包括对全局变量初始值的搬运（.data 段处理）和未初始化变量的清零（.bss 段处理）。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    值得注意的是，针对 STM32H7 庞大的内存域划分（ITCM、DTCM、AXIRAM、AHBRAM），为了将数据从相对较慢的 Flash 搬运至不同总线的 RAM 中，本文在 reset.h 中设计了两个极具效率的内联函数：reset_copy_ram_init() 和 reset_clear_ram_uninit()。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 内存对齐与 32 位宽优化：通过位运算（((uintptr_t)dest & 0x3) != 0）对非对齐地址进行字节级修补，在地址对齐到 4 字节边界后，立刻切换为 32 位（uint32_t）指针进行宽字读写，将总线利用率提升了 4 倍。
    - 循环展开优化（Loop Unrolling）：在此基础上，运用了激进的“循环展开”算法。在处理大量数据时（while (len >= 16)），一次循环体内部直接连续处理 4 个 32 位字（即 16 字节）。这种写法大幅度降低了 CPU 在大内存块拷贝时由于循环跳转带来的流水线冲刷（Pipeline Flush）和条件分支开销，显著缩短了 detools 差分解压缓冲区庞大内存的初始化时间。
  ]
  #par[]

  === App启动检测与多态跳转机制的实现

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在纯 C 环境构建完成后，Bootloader 需要决定自身的运行去向，本文将其设计为“预检测跳转”机制。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在 reset_handler 中，紧随 ITCM 代码搬运之后，系统调用了 load.c 模块中的 load_app() 接口：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 状态机判定：系统读取基于共享 RAM（Shared RAM）的 load_config 结构体，通过比对启动标识（LOAD_APP_USER 或 LOAD_APP_OEM），判断当前是否满足跳转用户程序的条件。
    + 多态复位向量提取：若满足跳转条件，系统从对应的 Flash 分区（USER_START 或 OEM_START）提取该分区的初始堆栈指针与复位函数向量。
    + 无缝移交控制权：通过 #str("__disable_irq()") 关闭全局中断，修改系统中断向量表偏移寄存器（SCB->VTOR）重定向中断映射，刷新堆栈指针，最终通过强转的函数指针（new_reset_handler()）跨物理分区唤醒用户程序或厂商固件。
  ]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    若校验失败或当前存在升级任务，函数直接返回，系统继续执行剩余 RAM 区的数据加载，并最终进入 load_boot()，启动 RT-Thread 操作系统接管控制权。这种 C 语言层面的模块化接管，不仅实现了 Bootloader 对 App 跳转的强控，更由于 C 框架的通用性，使得该工程代码可作为标准模块直接移植到其他 Cortex-M 芯片项目中实现底层复用。
  ]
  #par[]

  == RT-Thread Nano操作系统的移植与应用

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在传统的 Bootloader 设计中，通常采用裸机（Bare-metal）前后台轮询的架构。然而，随着差分升级（涉及复杂的 Flash 擦写与解压算法计算）与 Ymodem 通信协议的引入，裸机架构容易导致阻塞，影响系统的实时性与稳定性。为此，本文在 Bootloader 中引入了极其轻量级的实时操作系统 RT-Thread Nano，以实现复杂业务的解耦。
  ]
  #par[]

  === 底层架构适配与上下文切换

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    针对本项目所采用的基于 ARM Cortex-M7 内核的单片机（STM32H743），系统的底层移植主要涵盖三个方面：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 系统心跳（Tick）配置：在 board.c 中，将 SysTick 定时器配置为 1000Hz（即每秒触发 1000 次中断），在 SysTick_Handler 中断服务函数中调用 rt_tick_increase()，为操作系统提供精准的时基。
    + 上下文切换（Context Switch）的汇编实现：重写了 PendSV_Handler 异常处理函数。由于 Cortex-M7 包含硬件浮点运算单元（FPU），在发生任务切换时，除了压栈 R4R11 等通用寄存器外，还加入了对 EXC_RETURN 标志位的判断（TST lr, #0x10）。若判断当前任务使用了 FPU，则利用 VSTMDBEQ 和 VLDMIANE 指令对 S16S31 浮点寄存器进行懒压栈（Lazy Stacking）和出栈，确保了差分解压算法中可能涉及的浮点运算数据的绝对安全。
    + 中断管理：通过实现 rt_hw_interrupt_disable 与 rt_hw_interrupt_enable 函数，利用 Cortex-M 的 CPSID I 和 CPSIE I 指令控制 PRIMASK 寄存器，提供底层的全局中断开关，用于实现操作系统的临界区（Critical Section）保护。
  ]
  #par[]

  === 内存管理与系统裁剪

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    由于 Bootloader 的 RAM 资源受限（需为用户 App 预留大部分空间），必须对 RTOS 进行深度裁剪：
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 配置精简：在 rtconfig.h 中，关闭了设备虚拟文件系统（VFS）、软件定时器（Software Timer）等不必要组件。仅保留了信号量、互斥锁和邮箱（Mailbox）等核心 IPC（进程间通信）机制。
    - 堆内存接管：开启了小内存管理算法（RT_USING_SMALL_MEM_AS_HEAP）。利用链接脚本（Linker Script）导出的 #str("_heap_start") 与 #str("_heap_end") 符号，在 rt_hw_mcu_init 阶段调用 rt_system_heap_init，将紧跟在数据段之后的常规 RAM 区域交给 RTOS 接管，使得系统能够使用 rt_malloc 和 rt_free 动态分配 Ymodem 接收缓冲区和差分算法的计算内存。
  ]
  #par[]

  === 启动流程的重构与组件自动初始化

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为避免汇编启动文件导致的跨平台兼容性问题，本文采用纯 C 语言设计了启动逻辑，并重构了操作系统的启动入口。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    系统调用 rtthread_launch() 后，不仅完成了 MCU 外设时钟的初始化（rt_hw_mcu_init），还引入了自动初始化机制。通过自定义的段属性宏（如 RT_LAUNCH_RUN_EXPORT），将各个外设模块和系统组件的初始化函数指针集中存放到特定的 Flash 段中。在 rt_hw_board_init 阶段，通过遍历该指针数组依次执行初始化，实现了 Bootloader 业务模块间的彻底解耦。
  ]
  #par[]

  === 多任务解耦与业务调度机制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    依托 RTOS 的调度能力，系统将复杂的 OTA 流程划分为多个独立线程：
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    系统调用 rtthread_launch() 后，不仅完成了 MCU 外设时钟的初始化（rt_hw_mcu_init），还引入了自动初始化机制。通过自定义的段属性宏（如 RT_LAUNCH_RUN_EXPORT），将各个外设模块和系统组件的初始化函数指针集中存放到特定的 Flash 段中。在 rt_hw_board_init 阶段，通过遍历该指针数组依次执行初始化，实现了 Bootloader 业务模块间的彻底解耦。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - Boot 守护线程：作为主控线程（优先级较高），负责轮询检测 load_config 标志位。当接收到差分包后，调用 detools_apply_patch 进行固件还原，并执行软复位（NVIC_SystemReset）。
    - Ymodem 通信线程：专门负责监听 UART 端口。由于 RTOS 提供了阻塞挂起机制，该线程在没有串口数据时会出让 CPU 权限，不再占用死循环。
    - 系统监视线程：用于监控系统健康状态和资源占用（详见 3.3 节）。
  ]
  #par[]

  == CPU使用率监视器的设计与实现

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在差分升级过程中，解压还原算法（detools/crle）属于 CPU 密集型任务，同时 Flash 擦写又属于 I/O 耗时型操作。为了精准评估 Bootloader 运行时的系统负载，为后续算法的内存与速度 trade-off（权衡）优化提供数据支撑，本文基于 RT-Thread Idle Hook（空闲钩子）机制与 MCU 硬件定时器，设计并实现了一套高精度的 CPU 使用率监视器。
  ]
  #par[]

  === 测量原理与硬件选型

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    常规的 CPU 使用率统计通常依赖操作系统的 Tick 计数，但由于 Tick 精度仅为毫秒级（1ms），且在系统进入休眠（Sleep）时容易出现统计误差，无法满足微观层面的性能分析需求。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    本文巧妙利用了 STM32H7 内部的 LPTIM（低功耗定时器） 作为统计核心。在 rt_hw_mcu_init 中，将 LPTIM1 配置为连续计数模式，使其在内核时钟下运行（理论 1 兆赫兹频率下，1 个 Count 等于 1 微秒）。相比于 SysTick，LPTIM 即使在内核执行 WFI（Wait For Interrupt）进入低功耗状态时依然能够独立精准计数。
  ]
  #par[]

  === 空闲任务钩子与睡眠时间统计

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    RT-Thread 的空闲任务（Idle Task）在系统中没有其他就绪线程时运行。本文通过 rt_thread_idle_sethook 注册了自定义的空闲钩子函数 idle_hook_wfi。其核心处理流程如下：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 记录入睡时间：在执行休眠指令前，读取当前 LPTIM1 的计数寄存器值（start = LPTIM1->CNT）。
    + 进入休眠：调用 ARM 内核专用的 #str("__WFI()") 指令，暂停 CPU 内核时钟，此时系统进入低功耗状态，但外设（如 UART 和 LPTIM）仍在工作。
    + 唤醒与时间累加：当系统被任何中断（如滴答定时器或串口接收中断）唤醒后，记录唤醒时间（end = LPTIM1->CNT）。
    + 溢出补偿计算：由于 LPTIM1 计数器为 16 位，算法中特别加入了溢出回环处理逻辑（0xFFFF - start + end + 1），计算出本次休眠的精准微秒数，并累加到一个 64 位全局变量 total_sleep_ticks 中，防止长时间运行导致的数值溢出。为防止计算被中断打断，上述操作均被包裹在临界区（关中断）内执行。
  ]
  #figure(
    caption: [空闲任务钩子函数实现],
    ```C
    // 累加睡眠的Tick数(虽然LPTIM是16位，但累加变量我们要用64位防止总数溢出)
    static volatile uint64_t total_sleep_ticks = 0;

    /**
     * @brief 空闲任务运行时的钩子函数。
     */
    ITCM static void idle_hook_wfi(void)
    {
        uint16_t start, end;
        rt_base_t level;

        // 关中断
        level = rt_hw_interrupt_disable();

        // 读开始时间
        start = (uint16_t)LPTIM1->CNT;

        __WFI();

        // 读结束时间
        end = (uint16_t)LPTIM1->CNT;

        // 开中断
        rt_hw_interrupt_enable(level);

        /* 计算差值并累加 (处理16位回环，逻辑很简单) */
        if (end >= start)
        {
            total_sleep_ticks += (end - start);
        }
        else
        {
            // 发生了回环 (例如 65535 -> 1)
            total_sleep_ticks += (0xFFFF - start + end + 1);
        }
    }
    ```,
  )
  #par[]

  === 监视器线程与占用率计算

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    为实现数据的周期性输出，系统创建了一个名为 monitor 的独立线程（定义于 monitor.c 中）。该线程采用较低的优先级，主要执行以下逻辑：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 绝对时间延时：利用 rt_thread_delay_until 函数实现严格的 1000 毫秒（1 秒）唤醒周期，消除了由于任务被抢占带来的周期抖动。
    + 数据安全提取：在唤醒后，使用 rt_enter_critical() 进入临界区，提取 total_sleep_ticks 的值并将其迅速清零，确保数据读取的一致性。
    + 计算与输出：理想情况下，1 秒钟内 LPTIM 应当走过 1,000,000 个微秒 Tick。CPU 使用率的计算公式定义为：
      #align(center)[
        $"CPU_Usage(%)" = "100%" - ("Sleep_Ticks" / "1,000,000") times "100%"$
      ]
  ]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    通过串口打印输出，开发者可以直观地观察到：系统在等待 Ymodem 握手阶段，CPU 占用率接近 0%（大部分时间处于 WFI 状态）；而在接收到差分包触发 detools 还原计算时，CPU 占用率会瞬间飙升至峰值。
  ]
  #par[]

  === 工程价值分析

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    该 CPU 监视器的实现仅占用了极少量的 RAM 与 ROM 资源，且几乎没有引入额外的系统开销。它不仅验证了 RT-Thread 在本 Bootloader 中的成功移植与高效调度，更为论述“差分算法在 MCU 端的计算资源开销”提供了最直接、最客观的数据佐证，大幅提升了整个系统的可观测性。
  ]
  #par[]

  = 固件传输协议与差分升级核心技术

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    本章重点论述 Bootloader 的两大核心业务逻辑：如何安全、可靠地获取新版本固件，以及如何在存储资源受限的 MCU 上通过差分算法还原出完整的新固件。系统采用 Ymodem 协议结合 UART 接口实现固件的灵活下发，并深度集成了针对嵌入式环境优化的 detools 差分还原引擎，实现了兼顾带宽与 Flash 擦写寿命的在线升级方案。
  ]
  #par[]

  == 基于UART与Ymodem协议的文件传输

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在嵌入式设备的本地升级与调试场景中，串行通信（UART）因其硬件实现简单、兼容性广而成为首选。然而，裸流传输无法保证数据的完整性与边界。为此，本系统引入了 Ymodem 协议作为文件传输的载体。
  ]
  #par[]

  === Ymodem 协议的工作机制与 RTOS 适配

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    Ymodem 是一种基于块（Block）的异步文件传输协议，相比于 Xmodem，它具有支持批处理、携带文件元数据（如文件名与大小）以及传输效率更高的优势。
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 多任务环境下的无阻塞接收：在裸机系统中，串口接收往往采用死循环查询，极大地浪费了 CPU 资源。本系统在 RT-Thread Nano 的调度下，专门创建了独立的 Ymodem 通信线程。依托操作系统的信号量（Semaphore）机制，当串口硬件未收到数据时，通信线程会被挂起（Suspend），交出 CPU 使用权；一旦 UART 触发接收中断，中断服务函数释放信号量，立即唤醒该线程进行数据包解析，既保证了响应的实时性，又降低了系统的基础功耗。
    + 数据完整性校验：系统调用了独立优化的 CRC16 算法（集成于 algo.c 中，采用查表法 crc16_table 以空间换时间，大幅提升计算速度），对 Ymodem 协议的 128 字节或 1024 字节数据包进行严格校验。一旦发现校验和不匹配，系统会向发送端回复 NAK 字符要求重传，确保写入 Flash 的每一块固件数据都绝对正确。
  ]
  #par[]

  === 固件分类识别与智能路由机制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    传统的 Bootloader 通常只支持单一固件的盲写。为了同时兼容“全量升级”与“差分升级”，本系统设计了一套基于 Ymodem 起始包（Packet 0）的智能分类机制。
  ]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 文件元数据提取：当 Ymodem 建立连接并接收到 Packet 0 时，解析引擎会提取其中的字符串信息（包含文件名和文件字节大小）。
    - 动态路由策略：系统根据文件名称或后缀执行分支逻辑：
      - 全量包逻辑：若识别为全量固件（如 app.bin），系统将擦除 USER 区，并在后续的数据包接收中，以流的方式将全量固件直接烧写到 USER 区。
      - 差分包逻辑：若识别为差分补丁包（如 patch.bin 或以 .patch 结尾），系统不会干扰当前正在运行的应用程序，而是将目标擦写地址指向 PATCH 区。接收完成后，系统调用底层参数配置接口（如 load_set_patch_size）将补丁包的实际大小写入掉电不丢失的共享 RAM/Flash 标志区中，为后续的差分还原做准备。
  ]
  #par[]

  == 基于detools的差分还原算法实现

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    传统的全量升级方案中，即使只修改了一行代码，也需要下发数百 KB 的完整固件，这不仅严重浪费通信带宽，也加剧了 Flash 扇区的擦写损耗。差分升级（OTA Delta Update）通过“只传差异”彻底解决了这一痛点。
  ]
  #par[]

  === 差分升级原理与 detools 选型优势

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    差分升级的本质是：在 PC 端对比新旧两个版本的固件，提取差异数据生成极小的 Patch（补丁）文件；在设备端，将旧固件（Base）与接收到的 Patch 文件进行数学运算，合成出完整的新固件。
  ]
  #par(
    first-line-indent: 12pt * 2,
  )[
    常见的差分算法如 bsdiff 依赖 bzip2 压缩，在解压时需要消耗数 MB 的 RAM 空间，这对于只有几百 KB RAM 的单片机是不可接受的。本系统选用了专门为深度嵌入式设备设计的开源 detools 框架，其底层采用 crle（游程编码压缩）或类似轻量级算法。该算法的显著优势在于：解压还原时的 RAM 开销极小（通常只需极小的缓冲区），完全契合 Cortex-M 系列 MCU 的资源限制。
  ]
  #par[]

  === 差分还原的流式处理（Streaming I/O）设计

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    在单片机环境中，无法将几百 KB 的固件一次性读入 RAM 中进行计算。本系统的 detools_apply_patch 深度结合了第二章规划的 Flash 物理分区，采用了流式处理（Streaming I/O）的架构来完成固件合成：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 输入流（Read Stream）：算法引擎同时开启两个读取通道。通道 A 指向 OEM 区（或当前 USER 区）的旧固件作为基准数据（Base data）；通道 B 指向存放于 PATCH 区的补丁数据。
    + 内存运算（In-RAM Computing）：detools 引擎在 RAM 中仅开辟几百字节的滑动窗口缓存。它以块为单位读取 Base 数据和 Patch 数据，根据 Patch 中的指令（如：复制某段数据、插入新数据、修改某些字节）进行快速的异或与拼接运算。
    + 输出流（Write Stream）：一旦缓存区拼装出完整的 Flash 扇区大小（如 1KB 或 4KB），系统立即调用底层 Flash 擦写接口（如 erase_user() ），将其流式写入目标分区（如 USER 区）。
  ]
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    这种“边读、边算、边写”的管线式设计，使得无论目标固件有多大，系统所需的 RAM 峰值开销始终保持在一个极低的常量水平。
  ]
  #par[]

  === 安全的状态机与跳转控制

  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    差分还原是一个耗时且不可逆的重构过程，系统在 boot.c 中设计了严格的状态机（detect_apply 与 detect_reset）以确保升级闭环的安全：
  ]
  #block()[
    #set enum(
      indent: 12pt * 2,
    )
    + 校验与擦除准备：在调用差分算法前，系统读取 load_config 中的策略（如 LOAD_APPLY_USER），确定基准地址（Base Address）与新应用地址（New App Address），并调用特定区域的擦除函数（如 erase_user(patch_size)）准备空间。
    + 执行还原与结果验证：调用 detools_apply_patch 执行流式合成。还原完成后，引擎会根据 Patch 包末尾携带的哈希值对新生成的固件进行完整性校验。
    + 标志位切换与软复位：若返回结果为 DETOOLS_OK，系统利用掉电保持的标志区接口（load_write_config_which(LOAD_APP_USER)）更新引导指向，随后调用 NVIC_SystemReset() 触发 MCU 软件复位。
    + Bootloader 二次接管：复位后，系统首先进入 LOADER 区的纯 C 语言启动文件（reset_handler），通过检查启动参数无误后，更新主栈指针（#str("__set_MSP")）并修改向量表偏移（SCB->VTOR），最终跳转执行全新的 App 程序，完成整个差分升级的生命周期闭环。
  ]
  #par[]

  = 系统测试与分析

  #par[]

  == 测试环境配置
  
  #par[]
  #par(
    first-line-indent: 12pt * 2,
  )[
    交代测试的基础条件，保证实验的“可重复性”。
  ]
  #par[]

  === 硬件平台说明

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - MCU型号：STM32H743IIT6，主频480MHz，Flash总容量2MB，RAM总容量1MB
    - 开发板：STM32H743IIT6核心系统板
    - 烧录器：DAP-Link
    - 日志打印：USART1，波特率：115200
    - 文件传输：UART4，波特率：115200
  ]
  #par[]

  === 软件与工具链配置

  #par[]
  #block()[
    #set list(
      indent: 12pt * 2,
    )
    - 代码编辑器：VS Code 与 EIDE 插件
    - 工具链：arm-none-eabi-gcc，版本：15.2.1 20251203
    - c 标准：gnu23
    - 优化等级：-Og
    - RT-Thread-Nano 版本号：4.1.1
    - detools 版本号：0.53.0
    - 串口终端：MobaXterm，版本号：25.4
    - 文件传输：Tera Term，版本号：5.6.0
  ]
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
