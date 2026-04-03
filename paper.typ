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
 * 目录
 */
#counter(page).update(1)
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
 * 正文
 */
#counter(page).update(1)
#set heading(numbering: "1.1")
#page[
  = 摘要

  = 关键词

]

#page[
  = 参考文献

  = 致谢

]
