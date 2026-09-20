#!/usr/bin/env perl
# -*- mode: perl; -*-
#
# Configuración de latexmk para los apuntes de Homotopía Estable.
#
# Objetivo: que TODOS los archivos de compilación (aux, log, toc, bcf, bbl,
# pdf, synctex, ...) se guarden en la carpeta build/, de modo que la raíz del
# repositorio quede limpia. Los archivos fuente (.tex, .bib) y las imágenes
# siguen viviendo en la raíz y en sus subcarpetas.
#
# Uso:
#   latexmk            -> compila y abre el visor (por defecto)
#   latexmk -pdf       -> compila sin abrir visor (si $pdf_previewer está vacío)
#   latexmk -pvc       -> compilación continua mientras se edita
#   latexmk -C         -> borra todo lo generado (dentro de build/)
#   latexmk -c         -> borra solo los auxiliares (conserva el pdf)
#
# El PDF final queda en build/main.pdf.

# ---------------------------------------------------------------------------
# Zona horaria (para las marcas de tiempo de la compilación)
# ---------------------------------------------------------------------------
$ENV{'TZ'} = 'America/Mexico_City';

# ---------------------------------------------------------------------------
# Carpeta de salida
# ---------------------------------------------------------------------------
# $out_dir hace que pdflatex escriba sus archivos en build/. latexmk además
# coloca main.bcf / main.bbl en la raíz por comodidad; $aux_dir fuerza que
# también esos auxiliares de la bibliografía vayan a build/, de modo que la
# raíz quede totalmente limpia. Biber y biblatex localizan el .bcf y el .bbl
# a través de LaTeX, así que no hace falta tocar \addbibresource ni main.tex.

$out_dir = 'build';
$aux_dir = 'build';

# ---------------------------------------------------------------------------
# Motor y bibliografía
# ---------------------------------------------------------------------------
@default_files = ('main.tex');

$pdf_mode = 1;                 # 1 = pdflatex
$postscript_mode = $dvi_mode = 0;

$bibtex_use = 2;               # usa biber/bibtex y no se detiene si faltan citas
$biber = 'biber %O %S';        # motor de bibliografía (biblatex + biber)
$biblatex = 1;

# ---------------------------------------------------------------------------
# Ejecución de LaTeX
# ---------------------------------------------------------------------------
# -interaction=nonstopmode evita que la compilación se cuelgue pidiendo
# entrada cuando hay un error. -file-line-error da mensajes más útiles.
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# Número máximo de pasadas. latexmk calcula la bibliografía en una pasada
# extra, así que este valor es holgado.
$max_repeat = 5;

# ---------------------------------------------------------------------------
# Visor
# ---------------------------------------------------------------------------
# Se deja vacío para que `latexmk` no intente abrir un visor externo: el
# visor de PDF se abre a mano (o desde el editor). Si prefieres que se abra
# solo, comenta la línea siguiente.
$pdf_previewer = '';

# ---------------------------------------------------------------------------
# Limpieza
# ---------------------------------------------------------------------------
# Extensiones extra que `latexmk -c` debe borrar además de las de fábrica.
$clean_ext = 'synctex.gz run.xml bbl blg fdb_latexmk fls';

# La carpeta build/ se elimina por completo con `latexmk -C`.
$cleanup_includes_generated = 1;
$cleanup_includes_cusdep_generated = 1;
