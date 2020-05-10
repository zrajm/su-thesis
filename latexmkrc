# -*- perl -*-
# This is the config file for the 'latexmk' command. This config file is
# written in Perl. https://mg.readthedocs.io/latexmk.html

################################################################################
# Latexmk percent sequences:
#   * %S - source
#   * %D - destination
#   * %B - base of current rule
#   * %R - root/base of primary tex file
#   * %O - options
#   * %T - texfile name
#   * %Y - $aux_dir1
#   * %Z - $out_dir1
#   * %% - literal '%'

# The below options are equivalent to 'latexmk -xelatex' + running XeLaTeX with
# the option '-interaction=nonstopmode' (to avoid having XeLaTeX prompting the
# user for input in case of errors).
# [https://tex.stackexchange.com/questions/258814/]
$pdflatex = "xelatex -interaction=nonstopmode -halt-on-error %O %S";
$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

################################################################################
# The following sets the environment variable '$TEXINPUTS', which tells LaTeX
# where to search for files when using the \usepackage and \includegraphics
# (and other?) commands. A trailing double slash ('//') in a $TEXINPUTS path
# indicates that LaTeX should search this directory AND all of its
# subdirectories (which can potentially take a long time if there are many
# files and subdirectories to read).
#
# With newer versions of latexmk, one could use the `ensule_path` function. But
# unfortunately the version (4.41, from January 2015) that comes with Ubuntu
# 18.04.4 LTS, is too old to have that, so I use the following Perl snippet.
#
#ensure_path('TEXINPUTS', './su-thesis/:');
$ENV{TEXINPUTS} = "./su-thesis/:" . ($ENV{TEXINPUTS} || "");

#[eof]
