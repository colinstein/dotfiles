#!/bin/sh
pfile="${1}"
pdir="${HOME}/.mutt/tmp/print_messages"
pfmt="docx"

if [ ! -d ${pdir} ]; then
  mkdir -p ${pdir}
fi

rm -f ${pdir}/mutt_*

tmpfile="`mktemp ${pdir}/mutt_$$`"
mv -f ${tmpfile} ${tmpfile}.${pfmt}

textutil -stdin -convert ${pfmt} -fontsize 8 -font 'Sauce Code Powerline' -output ${tmpfile}.${pfmt}

open -a preview ${tmpfile}.${pfmt}
