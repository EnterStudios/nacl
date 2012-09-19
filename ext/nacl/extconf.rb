require 'mkmf'

$LDFLAGS << '-Wl,-Bsymbolic-functions -fPIC -lnacl /opt/pynacl/nacl-20110221/build/rep220/lib/amd64/randombytes.o -L/opt/pynacl/nacl-20110221/build/rep220/lib/amd64'

$CFLAGS << ' -fPIC -I/opt/pynacl/nacl-20110221/build/rep220/include/amd64 '

have_library "nacl"
create_makefile('nacl/nacl')
