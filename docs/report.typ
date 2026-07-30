#import "@preview/cmarker:0.1.10"
#let report = "Análise de Dados de um Reator"
#set document(
  title: [#report],
)
#set page(
  "a4",
  footer: context [
    #emph[#report]
    #h(1fr)
    #counter(page).display(
      "1/1",
      both: true,
    )
  ],
  columns: 2,
)
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: (x, y) => (
    if x == 0 { right } else { left }
  ),
)
#set quote(block: true, quotes: false)
#set text(lang: "pt")

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em,
)[
  #align(center)[
    *Universidad Federal da Paraíba* \
    Engenharia Química \
    Iniciação à Computação 2026.1 \
    Professora Elizabet Medeiros \
    *Prova Final*
    #title() \
    Nome do aluno
  ]

  #v(20pt)

  #align(center)[
    #set par(justify: false)
    *Resumo* \
    #lorem(80)
  ]
]

== Introdução

Este relatório apresenta uma análise detalhada dos dados coletados do reator, incluindo visualizações gráficas, estatísticas descritivas e interpretações dos resultados.

== Soluções

=== Questão 1

#quote()[
  Crie um histograma para cada uma das colunas numéricas.
]

A figura da coluna de temperatura do reator está em @reactor_temp.

#figure(
  image("../images/results/reactor_temp.png", width: 100%),
  placement: auto,
  caption: [
    Uma imagem de exemplo.
  ],
) <reactor_temp>

=== Questão 2

#quote()[
  Calcule a média ($mu$, `.mean()`) e o desvio padrão ($sigma$, `.std()`), e os valores mínimo e máximo para cada uma das colunas numéricas.
]

Os resultados estão em @resultados.

#figure(
  placement: auto,
  caption: [
    Uma imagem de exemplo.
  ],
  table(
    columns: 2,
    [*Quantidade*], [*Ingrediente*],
    [360g], [Farinha para panificação],
    [250g], [Manteiga (temperatura ambiente)],
    [150g], [Açúcar mascavo],
    [100g], [Açúcar de cana],
    [100g], [Chocolate 70% cacau],
    [100g], [Chocolate 35-40% cacau],
    [2], [Ovos],
    [Pitada], [Sal],
    [Fio], [Extrato de baunilha],
    table.hline(),
  ),
) <resultados>

=== Questão 3

#quote()[
  Calcule a média ($mu$, `.mean()`) e o desvio padrão ($sigma$, `.std()`), e os valores mínimo e máximo para cada uma das colunas numéricas.
]

A fórmula utilizada para calcular a soma dos primeiros n números inteiros é:

$
  sum_(k=0)^n k & = 1 + ... + n \
                & = (n(n+1)) / 2
$

=== Questão 4

#quote()[
  Calcule a média ($mu$, `.mean()`) e o desvio padrão ($sigma$, `.std()`), e os valores mínimo e máximo para cada uma das colunas numéricas.
]

== Conclusão

- Primeira conclusão do relatório.
- Segunda conclusão do relatório.
- Terceira conclusão do relatório.
