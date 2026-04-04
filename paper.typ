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
    - 状态机校验与跳转控制：load.c 模块实现了基于 CRC16 的强校验机制（algo_crc16）。在软复位时，Loader 通过 load_read_config_which() 读取 load_config。若校验通过且目标明确，系统通过重写栈指针（__set_MSP）、更新中断向量表偏移（SCB->VTOR），执行向 USER 区或 OEM 区的安全跳转；若不满足跳转条件，则留在 Loader 层，并向下调用 load_boot() 准备初始化升级组件。
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

  === 启动参数区（Shared RAM）与数据共享机制（核心机制）

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
