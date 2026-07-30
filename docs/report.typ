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
    *Universidade Federal da Paraíba* \
    Centro de Informática \
    Departamento de Computação Científica \
    Iniciação à Computação 2026.1 \
    Professora Elizabet Medeiros \
    *Avaliação*
    #title() \
    Nome do aluno
  ]

  #v(20pt)

  #align(center)[
    #set par(justify: false)
    *Resumo* \

    Escreva um resumo do relatório, destacando os principais pontos abordados e os resultados obtidos. O resumo deve ser conciso e informativo, fornecendo uma visão geral do conteúdo do relatório.
  ]
]

= Introdução

Este relatório apresenta uma análise de alguns dados coletados do reator, incluindo visualizações gráficas, estatísticas descritivas e interpretações dos resultados.

= Soluções aos problemas

Nas seções a seguir, apresentamos as soluções para os problemas propostos.

#divider()

Coloque aqui o endereço do repositório do GitHub onde o código-fonte do projeto está hospedado na sua conta pessoal. Certifique-se de que o repositório esteja público e acessível para que os avaliadores possam revisar o código.

#strong[
  #link("https://github.com/improbabilidades/prova-2026-1")[improbabilidades/prova-2026-1]
]

// Modifique o link e o texto acima para apontar para o seu repositório pessoal.

#divider()

== Problema 1

#quote()[
  Crie um histograma da temperatura do reator (coluna `reactor_temp`) para a condição de operação `A` (normal). O gráfico deve ter os eixos rotulados e um título apropriado.
]

O histograma da temperatura do reator está na @reactor_temp_histogram.

#figure(
  image("../images/results/example_histogram.png", width: 100%),
  placement: auto,
  caption: [
    Histograma da temperatura do reator (gráfico de exemplo, não representa os dados solicitados, lembre-se de substituir o nome da imagem pelo nome do arquivo que você gerou).
  ],
) <reactor_temp_histogram>

=== Comentário

Escriva um comentário sobre o histograma, destacando quaisquer padrões ou anomalias observadas.

== Problema 2

#quote()[
  Calcule a média $mu$ e o desvio padrão $sigma$ para as colunas numéricas `vibration_rms`, `motor_current` e `power_consumption_kw`. Apresente os resultados em uma tabela, com as colunas representando as estatísticas calculadas e as linhas representando cada variável numérica analisada, por exemplo:

  #table(
    columns: 3,
    align: (left, center, center),
    [*Variável*], [$mu$], [$sigma$],
    [vibration_rms], [valor], [valor],
    [motor_current], [valor], [valor],
    [power_consumption_kw], [valor], [valor],
  )
]

Os resultados estão na @resultados.

#figure(
  placement: auto,
  caption: [
    Coloque aqui uma descrição da tabela de resultados.
  ],
  table(
    columns: 3,
    align: (left, center, center),
    [*Variável*], [$mu$], [$sigma$],
    [vibration_rms], [valor], [valor],
    [motor_current], [valor], [valor],
    [power_consumption_kw], [valor], [valor],
    table.hline(),
  ),
) <resultados>

=== Comentário

Escreva um comentário sobre os resultados obtidos, destacando quaisquer padrões ou insights relevantes.

== Problema 3

#quote()[
  Mostre a evolução da pressão do reator (`reactor_pressure`) ao longo do tempo entre as datas (_timestamps_) `2024-02-16 08:00:00` e `2024-02-16 09:00:00`, utilizando um gráfico de linha. O eixo $x$ deve representar o tempo e o eixo $y$ a pressão do reator. Adicione um título e rótulos aos eixos.
]

O gráfico da pressão do reator está na @reactor_pressure_plot.

#figure(
  image("../images/results/example_plot.png", width: 100%),
  placement: auto,
  caption: [
    Evolução da pressão do reator ao longo do tempo (gráfico de exemplo, não representa os dados de pressão).
  ],
) <reactor_pressure_plot>

=== Comentário

Indique a interpretação do gráfico, destacando quaisquer tendências ou variações significativas na pressão do reator ao longo do tempo.

== Conclusão

- Primeira conclusão do relatório.
- Segunda conclusão do relatório.
- Terceira conclusão do relatório.
