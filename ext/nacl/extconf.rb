require 'mkmf'

unless nacl = ENV['NACL_HOME']
	puts "NACL_HOME environment variable missing"
	exit
end

hostname = `hostname`.chomp
builddir = "#{nacl}/build/#{hostname}"
okabi = `#{builddir}/bin/okabi`.chomp
libdir = "#{builddir}/lib/#{okabi}"
incdir = "#{builddir}/include/#{okabi}"

$LDFLAGS << "-Wl,-Bsymbolic-functions -fPIC -lnacl #{libdir}/randombytes.o -L#{libdir}"
$CFLAGS  << " -fPIC -I#{incdir} "

have_library "nacl"
create_makefile('nacl/nacl')
