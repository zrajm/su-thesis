# -*- perl -*-
# This is the config file for the 'latexmk' command. This config file is
# written in Perl. https://mg.readthedocs.io/latexmk.html

# A nice way to run `latexmk` is the following command (which will run latexmk
# on any file in the current directory whenever it is written to).
#
#   inotifywait -qmeCLOSE_WRITE *.tex | while read f _; do latexmk $f; done
#

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

# The below options are equivalent to 'latexmk -xelatex' and running XeLaTeX
# with the options '-interaction=nonstopmode' and '-halt-on-error' (which
# avoids XeLaTeX stopping and waiting for user for input in case of errors).
# [https://tex.stackexchange.com/questions/258814/]
#$pdflatex = "xelatex -interaction=nonstopmode -halt-on-error %O %S";

# This seems to be a better way of doing it, that doesn't produce as much
# output on the terminal. It uses grep to only display error messages preceded
# by '!' (the grep return value is inverted so that latexmk will react when an
# error is found). This will fail if there's ever an error message from xelatex
# that does not begin with '!'. [https://tex.stackexchange.com/q/198599/185988]
# (zrajm's answer)
$pdflatex = "! xelatex -halt-on-error %O %S |  grep -A3 '^!'";

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
# Newer versions of latexmk (like latexmk 4.67 that comes Ubuntu 20.04.03 LTS),
# supports the `ensule_path` function, so here we use that. (Previously, [with
# latexmk 4.41, January 2015, Ubuntu 18.04.4 LTS] I instead had to use the Perl
# snippet `$ENV{TEXINPUTS} = "./su-thesis/:" . ($ENV{TEXINPUTS} || "");`.)
ensure_path('BSTINPUTS', './su-thesis/:');
ensure_path('TEXINPUTS', './su-thesis/:');

#[eof]
