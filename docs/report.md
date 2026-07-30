Também é possível escrever o documento em um arquivo de texto tipo Markdown (`.md`) e importá-lo no Typst. Para isso, dentro de Typst, importe o pacote `@preview/cmarker` ao começar o documento, como mostrado abaixo:

```typst
#import "@preview/cmarker:0.1.10"
```

No lugar desejado do documento, use o seguinte comando para importar o conteúdo do arquivo Markdown:

```typst
#cmarker.render(read("report.md"))
```
