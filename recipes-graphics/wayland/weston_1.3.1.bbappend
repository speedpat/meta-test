PRINC := "${@int(PRINC) + 1}"

EXTRA_OECONF += "--with-cairo=glesv2 \
                 --with-cairo-glesv2" 

