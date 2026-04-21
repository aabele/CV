#!/bin/sh
set -e

"$@"

if [ -f /work/cv.pdf ]; then
  gs -sDEVICE=pdfwrite \
     -dCompatibilityLevel=1.4 \
     -dPDFSETTINGS=/ebook \
     -dNOPAUSE -dQUIET -dBATCH \
     -sOutputFile=/work/cv.compressed.pdf /work/cv.pdf
  mv /work/cv.compressed.pdf /work/cv.pdf
fi

if [ -n "$HOST_UID" ] && [ -n "$HOST_GID" ] && [ -f /work/cv.pdf ]; then
  chown "$HOST_UID:$HOST_GID" /work/cv.pdf
fi
