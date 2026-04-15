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
 * 设置引用样式为温哥华上标
 */
#set cite(style: "vancouver-superscript")
#show cite: it => {
  super("[" + it + "]")
}

/**
 * 为所有代码块设置背景与字体
 */
#show raw: set block(fill: rgb("#f5f5f5"), inset: 8pt, radius: 8pt)
#show raw: set text(font: (
  (name: "Consolas"),
  "STKaiti",
))

/**
 * 设置图表标题的类型
 */
#set figure(supplement: [图])
#show figure.where(kind: table): set figure(supplement: [表])

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
      #par[
        毕业论文（设计）作者签名：#box(image("assets/signature.png", width: 15%), baseline: 16pt)
      ]
      #par[]
      #par[]
      #par[#today.display("[year]年[month]月[day]日")]
      #par[]
      #par[]
    ]
  ]
]