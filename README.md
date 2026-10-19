# Apuntes de Homotopía Estable

Apuntes personales en español para el curso **Temas Selectos de Topología II: Homotopía Estable**, impartido en el Centro de Investigación en Matemáticas (CIMAT). El material organiza y complementa las clases con definiciones, demostraciones, ejemplos, diagramas y referencias bibliográficas. No es una publicación oficial del CIMAT.

## PDF

La versión compilada más reciente está disponible en [`build/main.pdf`](build/main.pdf) y se conserva en el repositorio junto con los archivos fuente.

## Compilación

Se requiere una instalación de TeX Live con `latexmk`, pdfLaTeX, Biber y los paquetes LaTeX utilizados por el documento. Desde la raíz del repositorio, ejecuta:

```sh
latexmk -pdf
```

El PDF se genera en `build/main.pdf`. La configuración de `latexmkrc` dirige allí también los archivos auxiliares. Para borrar los auxiliares y conservar el PDF, ejecuta `latexmk -c`; `latexmk -C` elimina todos los archivos generados, incluido el PDF.

## Organización

- `Apuntes/`: apuntes de las clases y archivo que los reúne.
- `Figuras/`: diagramas reutilizados por los apuntes.
- `Personalizacion/`: estilos, encabezados, títulos y entornos LaTeX.
- `Portada/`: portada y recursos gráficos.
- `Referencias.bib`: bibliografía del documento.
- `build/main.pdf`: PDF compilado para lectura.

## Licencia

Este repositorio no especifica una licencia abierta de reutilización. Para reutilizar o redistribuir su contenido, consulta al autor.
