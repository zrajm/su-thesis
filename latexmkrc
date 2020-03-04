# -*- perl -*-
# This is the config file for the 'latexmk' command. It is written in Perl.
# https://mg.readthedocs.io/latexmk.html

################################################################################
# Equivalent to command line option '-xelatex'.
#
$pdflatex = "xelatex %O %S";
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

################################################################################
# The following sets the environment variable '$TEXINPUTS', which tells LaTeX
# where to search for files when using the \usepackage and \includegraphics
# (and other?) commands. The trailing double slash ('//') indicates that LaTeX
# should search this directory AND all its subdirectories.
#
# With newer versions of latexmk, one could use the `ensule_path` function. But
# unfortunately the version (4.41, from January 2015) that comes with Ubuntu
# 18.04.4 LTS, is too old to have that, so I use the following Perl snippet.
#
#ensure_path('TEXINPUTS', './/');
$ENV{TEXINPUTS} = ".//:" . ($ENV{TEXINPUTS} || "");

#[eof]
