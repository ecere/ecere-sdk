.PHONY: all objdir cleantarget clean realclean distclean

# CORE VARIABLES

MODULE := curl
VERSION := 
CONFIG := release
ifndef COMPILER
COMPILER := default
endif

TARGET_TYPE = staticlib

# FLAGS

ECFLAGS =
ifndef DEBIAN_PACKAGE
CFLAGS =
LDFLAGS =
endif
PRJ_CFLAGS =
CECFLAGS =
OFLAGS =
LIBS =

ifdef DEBUG
NOSTRIP := y
endif

CONSOLE = -mwindows

# INCLUDES

_CF_DIR = .configs/

include $(_CF_DIR)crossplatform.mk
include $(_CF_DIR)$(TARGET_PLATFORM)-$(COMPILER).cf

# POST-INCLUDES VARIABLES

OBJ = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/

RES = 

TARGET = obj/$(CONFIG).$(PLATFORM)$(COMPILER_SUFFIX)$(DEBUG_SUFFIX)/$(LP)curl$(OUT)

ifdef WINDOWS_TARGET

_RCSOURCES = \
	lib/libcurl.rc

RCSOURCES = $(call shwspace,$(_RCSOURCES))

RCOBJECTS = $(call shwspace,$(addprefix $(OBJ),$(patsubst %.rc,%$(O),$(notdir $(_RCSOURCES)))))

else
RCSOURCES =
RCOBJECTS =
endif

_OBJECTS = $(_OBJECTS1) $(_OBJECTS2) $(_OBJECTS3) $(_OBJECTS4) $(_OBJECTS5)
_OBJECTS1 = \
	$(OBJ)cleartext$(O) \
	$(OBJ)cram$(O) \
	$(OBJ)digest$(O) \
	$(OBJ)digest_sspi$(O) \
	$(OBJ)krb5_gssapi$(O) \
	$(OBJ)krb5_sspi$(O) \
	$(OBJ)ntlm$(O) \
	$(OBJ)ntlm_sspi$(O) \
	$(OBJ)oauth2$(O) \
	$(OBJ)spnego_gssapi$(O) \
	$(OBJ)spnego_sspi$(O) \
	$(OBJ)vauth$(O) \
	$(OBJ)axtls$(O) \
	$(OBJ)cyassl$(O) \
	$(OBJ)darwinssl$(O) \
	$(OBJ)gskit$(O) \
	$(OBJ)gtls$(O) \
	$(OBJ)mbedtls$(O) \
	$(OBJ)nss$(O) \
	$(OBJ)openssl$(O) \
	$(OBJ)polarssl$(O) \
	$(OBJ)polarssl_threadlock$(O) \
	$(OBJ)schannel$(O) \
	$(OBJ)vtls$(O) \
	$(OBJ)amigaos$(O) \
	$(OBJ)asyn-ares$(O) \
	$(OBJ)asyn-thread$(O) \
	$(OBJ)base64$(O) \
	$(OBJ)conncache$(O) \
	$(OBJ)connect$(O)
_OBJECTS2 = \
	$(OBJ)content_encoding$(O) \
	$(OBJ)cookie$(O) \
	$(OBJ)curl_addrinfo$(O) \
	$(OBJ)curl_des$(O) \
	$(OBJ)curl_endian$(O) \
	$(OBJ)curl_fnmatch$(O) \
	$(OBJ)curl_gethostname$(O) \
	$(OBJ)curl_gssapi$(O) \
	$(OBJ)curl_memrchr$(O) \
	$(OBJ)curl_multibyte$(O) \
	$(OBJ)curl_ntlm_core$(O) \
	$(OBJ)curl_ntlm_wb$(O) \
	$(OBJ)curl_rtmp$(O) \
	$(OBJ)curl_sasl$(O) \
	$(OBJ)curl_sspi$(O) \
	$(OBJ)curl_threads$(O) \
	$(OBJ)dict$(O) \
	$(OBJ)dotdot$(O) \
	$(OBJ)easy$(O) \
	$(OBJ)escape$(O) \
	$(OBJ)file$(O) \
	$(OBJ)fileinfo$(O) \
	$(OBJ)formdata$(O) \
	$(OBJ)ftp$(O) \
	$(OBJ)ftplistparser$(O) \
	$(OBJ)getenv$(O) \
	$(OBJ)getinfo$(O) \
	$(OBJ)gopher$(O)
_OBJECTS3 = \
	$(OBJ)hash$(O) \
	$(OBJ)hmac$(O) \
	$(OBJ)hostasyn$(O) \
	$(OBJ)hostcheck$(O) \
	$(OBJ)hostip$(O) \
	$(OBJ)hostip4$(O) \
	$(OBJ)hostip6$(O) \
	$(OBJ)hostsyn$(O) \
	$(OBJ)http$(O) \
	$(OBJ)http2$(O) \
	$(OBJ)http_chunks$(O) \
	$(OBJ)http_digest$(O) \
	$(OBJ)http_negotiate$(O) \
	$(OBJ)http_ntlm$(O) \
	$(OBJ)http_proxy$(O) \
	$(OBJ)idn_win32$(O) \
	$(OBJ)if2ip$(O) \
	$(OBJ)imap$(O) \
	$(OBJ)inet_ntop$(O) \
	$(OBJ)inet_pton$(O) \
	$(OBJ)krb5$(O) \
	$(OBJ)ldap$(O) \
	$(OBJ)llist$(O) \
	$(OBJ)md4$(O) \
	$(OBJ)md5$(O) \
	$(OBJ)memdebug$(O) \
	$(OBJ)mprintf$(O) \
	$(OBJ)multi$(O) \
	$(OBJ)netrc$(O)
_OBJECTS4 = \
	$(OBJ)non-ascii$(O) \
	$(OBJ)nonblock$(O) \
	$(OBJ)nwlib$(O) \
	$(OBJ)nwos$(O) \
	$(OBJ)openldap$(O) \
	$(OBJ)parsedate$(O) \
	$(OBJ)pingpong$(O) \
	$(OBJ)pipeline$(O) \
	$(OBJ)pop3$(O) \
	$(OBJ)progress$(O) \
	$(OBJ)rtsp$(O) \
	$(OBJ)security$(O) \
	$(OBJ)select$(O) \
	$(OBJ)sendf$(O) \
	$(OBJ)share$(O) \
	$(OBJ)slist$(O) \
	$(OBJ)smb$(O) \
	$(OBJ)smtp$(O) \
	$(OBJ)socks$(O) \
	$(OBJ)socks_gssapi$(O) \
	$(OBJ)socks_sspi$(O) \
	$(OBJ)speedcheck$(O) \
	$(OBJ)splay$(O) \
	$(OBJ)ssh$(O) \
	$(OBJ)strcase$(O) \
	$(OBJ)strdup$(O) \
	$(OBJ)strerror$(O) \
	$(OBJ)strtok$(O) \
	$(OBJ)strtoofft$(O)
_OBJECTS5 = \
	$(OBJ)system_win32$(O) \
	$(OBJ)telnet$(O) \
	$(OBJ)tftp$(O) \
	$(OBJ)timeval$(O) \
	$(OBJ)transfer$(O) \
	$(OBJ)url$(O) \
	$(OBJ)version$(O) \
	$(OBJ)warnless$(O) \
	$(OBJ)wildcard$(O) \
	$(OBJ)x509asn1$(O)

OBJECTS = $(_OBJECTS) $(RCOBJECTS)

SOURCES = $(SOURCES1) $(SOURCES2)
SOURCES1 = \
	lib/vauth/cleartext.c \
	lib/vauth/cram.c \
	lib/vauth/digest.c \
	lib/vauth/digest_sspi.c \
	lib/vauth/krb5_gssapi.c \
	lib/vauth/krb5_sspi.c \
	lib/vauth/ntlm.c \
	lib/vauth/ntlm_sspi.c \
	lib/vauth/oauth2.c \
	lib/vauth/spnego_gssapi.c \
	lib/vauth/spnego_sspi.c \
	lib/vauth/vauth.c \
	lib/vtls/axtls.c \
	lib/vtls/cyassl.c \
	lib/vtls/darwinssl.c \
	lib/vtls/gskit.c \
	lib/vtls/gtls.c \
	lib/vtls/mbedtls.c \
	lib/vtls/nss.c \
	lib/vtls/openssl.c \
	lib/vtls/polarssl.c \
	lib/vtls/polarssl_threadlock.c \
	lib/vtls/schannel.c \
	lib/vtls/vtls.c \
	lib/amigaos.c \
	lib/asyn-ares.c \
	lib/asyn-thread.c \
	lib/base64.c \
	lib/conncache.c \
	lib/connect.c \
	lib/content_encoding.c \
	lib/cookie.c \
	lib/curl_addrinfo.c \
	lib/curl_des.c \
	lib/curl_endian.c \
	lib/curl_fnmatch.c \
	lib/curl_gethostname.c \
	lib/curl_gssapi.c \
	lib/curl_memrchr.c \
	lib/curl_multibyte.c \
	lib/curl_ntlm_core.c \
	lib/curl_ntlm_wb.c \
	lib/curl_rtmp.c \
	lib/curl_sasl.c \
	lib/curl_sspi.c \
	lib/curl_threads.c \
	lib/dict.c \
	lib/dotdot.c \
	lib/easy.c \
	lib/escape.c \
	lib/file.c \
	lib/fileinfo.c \
	lib/formdata.c \
	lib/ftp.c \
	lib/ftplistparser.c \
	lib/getenv.c \
	lib/getinfo.c \
	lib/gopher.c \
	lib/hash.c \
	lib/hmac.c \
	lib/hostasyn.c \
	lib/hostcheck.c \
	lib/hostip.c \
	lib/hostip4.c \
	lib/hostip6.c \
	lib/hostsyn.c \
	lib/http.c \
	lib/http2.c \
	lib/http_chunks.c \
	lib/http_digest.c \
	lib/http_negotiate.c \
	lib/http_ntlm.c \
	lib/http_proxy.c \
	lib/idn_win32.c \
	lib/if2ip.c \
	lib/imap.c \
	lib/inet_ntop.c \
	lib/inet_pton.c \
	lib/krb5.c \
	lib/ldap.c \
	lib/llist.c \
	lib/md4.c
SOURCES2 = \
	lib/md5.c \
	lib/memdebug.c \
	lib/mprintf.c \
	lib/multi.c \
	lib/netrc.c \
	lib/non-ascii.c \
	lib/nonblock.c \
	lib/nwlib.c \
	lib/nwos.c \
	lib/openldap.c \
	lib/parsedate.c \
	lib/pingpong.c \
	lib/pipeline.c \
	lib/pop3.c \
	lib/progress.c \
	lib/rtsp.c \
	lib/security.c \
	lib/select.c \
	lib/sendf.c \
	lib/share.c \
	lib/slist.c \
	lib/smb.c \
	lib/smtp.c \
	lib/socks.c \
	lib/socks_gssapi.c \
	lib/socks_sspi.c \
	lib/speedcheck.c \
	lib/splay.c \
	lib/ssh.c \
	lib/strcase.c \
	lib/strdup.c \
	lib/strerror.c \
	lib/strtok.c \
	lib/strtoofft.c \
	lib/system_win32.c \
	lib/telnet.c \
	lib/tftp.c \
	lib/timeval.c \
	lib/transfer.c \
	lib/url.c \
	lib/version.c \
	lib/warnless.c \
	lib/wildcard.c \
	lib/x509asn1.c

RESOURCES =

ifdef USE_RESOURCES_EAR
RESOURCES_EAR = $(OBJ)resources.ear
else
RESOURCES_EAR = $(RESOURCES)
endif

LIBS += $(SHAREDLIB) $(EXECUTABLE) $(LINKOPT)

PRJ_CFLAGS += \
	 $(if $(DEBUG), -g, -O2 -ffast-math) $(FPIC) -Wall -DREPOSITORY_VERSION="\"$(REPOSITORY_VER)\"" \
			 -DBUILDING_LIBCURL \
			 -DCURL_DISABLE_LDAP \
			 -DCURL_STATICLIB \
			 -Iinclude \
			 -Ilib

ECFLAGS += -module $(MODULE)
CECFLAGS += -cpp $(_CPP)

# TARGETS

all: objdir $(TARGET)

objdir:
	$(if $(wildcard $(OBJ)),,$(call mkdir,$(OBJ)))

$(SYMBOLS): | objdir
$(OBJECTS): | objdir
$(TARGET): $(SOURCES) $(RCSOURCES) $(RESOURCES_EAR) $(SYMBOLS) $(OBJECTS) | objdir
	@$(call rm,$(OBJ)objects.lst)
	@$(call touch,$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS1),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS2),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS3),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS4),$(OBJ)objects.lst)
	$(call addtolistfile,$(_OBJECTS5),$(OBJ)objects.lst)
ifdef WINDOWS_TARGET
	$(call addtolistfile,$(RCOBJECTS),$(OBJ)objects.lst)
endif
ifndef STATIC_LIBRARY_TARGET
	$(LD) $(OFLAGS) @$(OBJ)objects.lst $(LIBS) -o $(TARGET) $(INSTALLNAME)
ifndef NOSTRIP
	$(STRIP) $(STRIPOPT) $(TARGET)
endif
else
ifdef WINDOWS_HOST
	$(AR) rcs $(TARGET) @$(OBJ)objects.lst $(LIBS)
else
	$(AR) rcs $(TARGET) $(OBJECTS) $(LIBS)
endif
endif
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(if $(basename $(VER)),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)),)
	$(if $(VER),ln -sf $(LP)$(MODULE)$(SO)$(VER) $(OBJ)$(LP)$(MODULE)$(SO),)
endif
endif
endif

# SYMBOL RULES

# C OBJECT RULES

# OBJECT RULES

$(OBJ)cleartext$(O): lib/vauth/cleartext.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/cleartext.c) -o $(call quote_path,$@)

$(OBJ)cram$(O): lib/vauth/cram.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/cram.c) -o $(call quote_path,$@)

$(OBJ)digest$(O): lib/vauth/digest.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/digest.c) -o $(call quote_path,$@)

$(OBJ)digest_sspi$(O): lib/vauth/digest_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/digest_sspi.c) -o $(call quote_path,$@)

$(OBJ)krb5_gssapi$(O): lib/vauth/krb5_gssapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/krb5_gssapi.c) -o $(call quote_path,$@)

$(OBJ)krb5_sspi$(O): lib/vauth/krb5_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/krb5_sspi.c) -o $(call quote_path,$@)

$(OBJ)ntlm$(O): lib/vauth/ntlm.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/ntlm.c) -o $(call quote_path,$@)

$(OBJ)ntlm_sspi$(O): lib/vauth/ntlm_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/ntlm_sspi.c) -o $(call quote_path,$@)

$(OBJ)oauth2$(O): lib/vauth/oauth2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/oauth2.c) -o $(call quote_path,$@)

$(OBJ)spnego_gssapi$(O): lib/vauth/spnego_gssapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/spnego_gssapi.c) -o $(call quote_path,$@)

$(OBJ)spnego_sspi$(O): lib/vauth/spnego_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/spnego_sspi.c) -o $(call quote_path,$@)

$(OBJ)vauth$(O): lib/vauth/vauth.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vauth/vauth.c) -o $(call quote_path,$@)

$(OBJ)axtls$(O): lib/vtls/axtls.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/axtls.c) -o $(call quote_path,$@)

$(OBJ)cyassl$(O): lib/vtls/cyassl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/cyassl.c) -o $(call quote_path,$@)

$(OBJ)darwinssl$(O): lib/vtls/darwinssl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/darwinssl.c) -o $(call quote_path,$@)

$(OBJ)gskit$(O): lib/vtls/gskit.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/gskit.c) -o $(call quote_path,$@)

$(OBJ)gtls$(O): lib/vtls/gtls.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/gtls.c) -o $(call quote_path,$@)

$(OBJ)mbedtls$(O): lib/vtls/mbedtls.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/mbedtls.c) -o $(call quote_path,$@)

$(OBJ)nss$(O): lib/vtls/nss.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/nss.c) -o $(call quote_path,$@)

$(OBJ)openssl$(O): lib/vtls/openssl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/openssl.c) -o $(call quote_path,$@)

$(OBJ)polarssl$(O): lib/vtls/polarssl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/polarssl.c) -o $(call quote_path,$@)

$(OBJ)polarssl_threadlock$(O): lib/vtls/polarssl_threadlock.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/polarssl_threadlock.c) -o $(call quote_path,$@)

$(OBJ)schannel$(O): lib/vtls/schannel.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/schannel.c) -o $(call quote_path,$@)

$(OBJ)vtls$(O): lib/vtls/vtls.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/vtls/vtls.c) -o $(call quote_path,$@)

$(OBJ)amigaos$(O): lib/amigaos.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/amigaos.c) -o $(call quote_path,$@)

$(OBJ)asyn-ares$(O): lib/asyn-ares.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/asyn-ares.c) -o $(call quote_path,$@)

$(OBJ)asyn-thread$(O): lib/asyn-thread.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/asyn-thread.c) -o $(call quote_path,$@)

$(OBJ)base64$(O): lib/base64.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/base64.c) -o $(call quote_path,$@)

$(OBJ)conncache$(O): lib/conncache.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/conncache.c) -o $(call quote_path,$@)

$(OBJ)connect$(O): lib/connect.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/connect.c) -o $(call quote_path,$@)

$(OBJ)content_encoding$(O): lib/content_encoding.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/content_encoding.c) -o $(call quote_path,$@)

$(OBJ)cookie$(O): lib/cookie.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/cookie.c) -o $(call quote_path,$@)

$(OBJ)curl_addrinfo$(O): lib/curl_addrinfo.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_addrinfo.c) -o $(call quote_path,$@)

$(OBJ)curl_des$(O): lib/curl_des.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_des.c) -o $(call quote_path,$@)

$(OBJ)curl_endian$(O): lib/curl_endian.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_endian.c) -o $(call quote_path,$@)

$(OBJ)curl_fnmatch$(O): lib/curl_fnmatch.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_fnmatch.c) -o $(call quote_path,$@)

$(OBJ)curl_gethostname$(O): lib/curl_gethostname.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_gethostname.c) -o $(call quote_path,$@)

$(OBJ)curl_gssapi$(O): lib/curl_gssapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_gssapi.c) -o $(call quote_path,$@)

$(OBJ)curl_memrchr$(O): lib/curl_memrchr.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_memrchr.c) -o $(call quote_path,$@)

$(OBJ)curl_multibyte$(O): lib/curl_multibyte.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_multibyte.c) -o $(call quote_path,$@)

$(OBJ)curl_ntlm_core$(O): lib/curl_ntlm_core.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_ntlm_core.c) -o $(call quote_path,$@)

$(OBJ)curl_ntlm_wb$(O): lib/curl_ntlm_wb.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_ntlm_wb.c) -o $(call quote_path,$@)

$(OBJ)curl_rtmp$(O): lib/curl_rtmp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_rtmp.c) -o $(call quote_path,$@)

$(OBJ)curl_sasl$(O): lib/curl_sasl.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_sasl.c) -o $(call quote_path,$@)

$(OBJ)curl_sspi$(O): lib/curl_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_sspi.c) -o $(call quote_path,$@)

$(OBJ)curl_threads$(O): lib/curl_threads.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/curl_threads.c) -o $(call quote_path,$@)

$(OBJ)dict$(O): lib/dict.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/dict.c) -o $(call quote_path,$@)

$(OBJ)dotdot$(O): lib/dotdot.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/dotdot.c) -o $(call quote_path,$@)

$(OBJ)easy$(O): lib/easy.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/easy.c) -o $(call quote_path,$@)

$(OBJ)escape$(O): lib/escape.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/escape.c) -o $(call quote_path,$@)

$(OBJ)file$(O): lib/file.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/file.c) -o $(call quote_path,$@)

$(OBJ)fileinfo$(O): lib/fileinfo.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/fileinfo.c) -o $(call quote_path,$@)

$(OBJ)formdata$(O): lib/formdata.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/formdata.c) -o $(call quote_path,$@)

$(OBJ)ftp$(O): lib/ftp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/ftp.c) -o $(call quote_path,$@)

$(OBJ)ftplistparser$(O): lib/ftplistparser.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/ftplistparser.c) -o $(call quote_path,$@)

$(OBJ)getenv$(O): lib/getenv.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/getenv.c) -o $(call quote_path,$@)

$(OBJ)getinfo$(O): lib/getinfo.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/getinfo.c) -o $(call quote_path,$@)

$(OBJ)gopher$(O): lib/gopher.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/gopher.c) -o $(call quote_path,$@)

$(OBJ)hash$(O): lib/hash.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hash.c) -o $(call quote_path,$@)

$(OBJ)hmac$(O): lib/hmac.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hmac.c) -o $(call quote_path,$@)

$(OBJ)hostasyn$(O): lib/hostasyn.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostasyn.c) -o $(call quote_path,$@)

$(OBJ)hostcheck$(O): lib/hostcheck.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostcheck.c) -o $(call quote_path,$@)

$(OBJ)hostip$(O): lib/hostip.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostip.c) -o $(call quote_path,$@)

$(OBJ)hostip4$(O): lib/hostip4.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostip4.c) -o $(call quote_path,$@)

$(OBJ)hostip6$(O): lib/hostip6.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostip6.c) -o $(call quote_path,$@)

$(OBJ)hostsyn$(O): lib/hostsyn.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/hostsyn.c) -o $(call quote_path,$@)

$(OBJ)http$(O): lib/http.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http.c) -o $(call quote_path,$@)

$(OBJ)http2$(O): lib/http2.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http2.c) -o $(call quote_path,$@)

$(OBJ)http_chunks$(O): lib/http_chunks.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http_chunks.c) -o $(call quote_path,$@)

$(OBJ)http_digest$(O): lib/http_digest.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http_digest.c) -o $(call quote_path,$@)

$(OBJ)http_negotiate$(O): lib/http_negotiate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http_negotiate.c) -o $(call quote_path,$@)

$(OBJ)http_ntlm$(O): lib/http_ntlm.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http_ntlm.c) -o $(call quote_path,$@)

$(OBJ)http_proxy$(O): lib/http_proxy.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/http_proxy.c) -o $(call quote_path,$@)

$(OBJ)idn_win32$(O): lib/idn_win32.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/idn_win32.c) -o $(call quote_path,$@)

$(OBJ)if2ip$(O): lib/if2ip.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/if2ip.c) -o $(call quote_path,$@)

$(OBJ)imap$(O): lib/imap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/imap.c) -o $(call quote_path,$@)

$(OBJ)inet_ntop$(O): lib/inet_ntop.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/inet_ntop.c) -o $(call quote_path,$@)

$(OBJ)inet_pton$(O): lib/inet_pton.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/inet_pton.c) -o $(call quote_path,$@)

$(OBJ)krb5$(O): lib/krb5.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/krb5.c) -o $(call quote_path,$@)

$(OBJ)ldap$(O): lib/ldap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/ldap.c) -o $(call quote_path,$@)

ifdef WINDOWS_TARGET

$(OBJ)libcurl$(O): lib/libcurl.rc
	$(WINDRES) $(WINDRES_FLAGS) $< "$(call escspace,$(call quote_path,$@))"
endif

$(OBJ)llist$(O): lib/llist.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/llist.c) -o $(call quote_path,$@)

$(OBJ)md4$(O): lib/md4.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/md4.c) -o $(call quote_path,$@)

$(OBJ)md5$(O): lib/md5.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/md5.c) -o $(call quote_path,$@)

$(OBJ)memdebug$(O): lib/memdebug.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/memdebug.c) -o $(call quote_path,$@)

$(OBJ)mprintf$(O): lib/mprintf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/mprintf.c) -o $(call quote_path,$@)

$(OBJ)multi$(O): lib/multi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/multi.c) -o $(call quote_path,$@)

$(OBJ)netrc$(O): lib/netrc.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/netrc.c) -o $(call quote_path,$@)

$(OBJ)non-ascii$(O): lib/non-ascii.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/non-ascii.c) -o $(call quote_path,$@)

$(OBJ)nonblock$(O): lib/nonblock.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/nonblock.c) -o $(call quote_path,$@)

$(OBJ)nwlib$(O): lib/nwlib.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/nwlib.c) -o $(call quote_path,$@)

$(OBJ)nwos$(O): lib/nwos.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/nwos.c) -o $(call quote_path,$@)

$(OBJ)openldap$(O): lib/openldap.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/openldap.c) -o $(call quote_path,$@)

$(OBJ)parsedate$(O): lib/parsedate.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/parsedate.c) -o $(call quote_path,$@)

$(OBJ)pingpong$(O): lib/pingpong.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/pingpong.c) -o $(call quote_path,$@)

$(OBJ)pipeline$(O): lib/pipeline.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/pipeline.c) -o $(call quote_path,$@)

$(OBJ)pop3$(O): lib/pop3.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/pop3.c) -o $(call quote_path,$@)

$(OBJ)progress$(O): lib/progress.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/progress.c) -o $(call quote_path,$@)

$(OBJ)rtsp$(O): lib/rtsp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/rtsp.c) -o $(call quote_path,$@)

$(OBJ)security$(O): lib/security.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/security.c) -o $(call quote_path,$@)

$(OBJ)select$(O): lib/select.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/select.c) -o $(call quote_path,$@)

$(OBJ)sendf$(O): lib/sendf.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/sendf.c) -o $(call quote_path,$@)

$(OBJ)share$(O): lib/share.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/share.c) -o $(call quote_path,$@)

$(OBJ)slist$(O): lib/slist.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/slist.c) -o $(call quote_path,$@)

$(OBJ)smb$(O): lib/smb.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/smb.c) -o $(call quote_path,$@)

$(OBJ)smtp$(O): lib/smtp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/smtp.c) -o $(call quote_path,$@)

$(OBJ)socks$(O): lib/socks.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/socks.c) -o $(call quote_path,$@)

$(OBJ)socks_gssapi$(O): lib/socks_gssapi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/socks_gssapi.c) -o $(call quote_path,$@)

$(OBJ)socks_sspi$(O): lib/socks_sspi.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/socks_sspi.c) -o $(call quote_path,$@)

$(OBJ)speedcheck$(O): lib/speedcheck.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/speedcheck.c) -o $(call quote_path,$@)

$(OBJ)splay$(O): lib/splay.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/splay.c) -o $(call quote_path,$@)

$(OBJ)ssh$(O): lib/ssh.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/ssh.c) -o $(call quote_path,$@)

$(OBJ)strcase$(O): lib/strcase.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/strcase.c) -o $(call quote_path,$@)

$(OBJ)strdup$(O): lib/strdup.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/strdup.c) -o $(call quote_path,$@)

$(OBJ)strerror$(O): lib/strerror.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/strerror.c) -o $(call quote_path,$@)

$(OBJ)strtok$(O): lib/strtok.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/strtok.c) -o $(call quote_path,$@)

$(OBJ)strtoofft$(O): lib/strtoofft.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/strtoofft.c) -o $(call quote_path,$@)

$(OBJ)system_win32$(O): lib/system_win32.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/system_win32.c) -o $(call quote_path,$@)

$(OBJ)telnet$(O): lib/telnet.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/telnet.c) -o $(call quote_path,$@)

$(OBJ)tftp$(O): lib/tftp.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/tftp.c) -o $(call quote_path,$@)

$(OBJ)timeval$(O): lib/timeval.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/timeval.c) -o $(call quote_path,$@)

$(OBJ)transfer$(O): lib/transfer.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/transfer.c) -o $(call quote_path,$@)

$(OBJ)url$(O): lib/url.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/url.c) -o $(call quote_path,$@)

$(OBJ)version$(O): lib/version.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/version.c) -o $(call quote_path,$@)

$(OBJ)warnless$(O): lib/warnless.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/warnless.c) -o $(call quote_path,$@)

$(OBJ)wildcard$(O): lib/wildcard.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/wildcard.c) -o $(call quote_path,$@)

$(OBJ)x509asn1$(O): lib/x509asn1.c
	$(CC) $(CFLAGS) $(PRJ_CFLAGS) -c $(call quote_path,lib/x509asn1.c) -o $(call quote_path,$@)

cleantarget: objdir
	$(call rm,$(OBJ)objects.lst)
	$(call rm,$(TARGET))
ifdef SHARED_LIBRARY_TARGET
ifdef LINUX_TARGET
ifdef LINUX_HOST
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO)$(basename $(VER)))
	$(call rm,$(OBJ)$(LP)$(MODULE)$(SO))
endif
endif
endif

clean: cleantarget
	$(call rm,$(_OBJECTS1))
	$(call rm,$(_OBJECTS2))
	$(call rm,$(_OBJECTS3))
	$(call rm,$(_OBJECTS4))
	$(call rm,$(_OBJECTS5))
ifdef WINDOWS_TARGET
	$(call rm,$(_RCOBJECTS))
endif

realclean: cleantarget
	$(call rmr,$(OBJ))

distclean: cleantarget
	$(call rmr,obj/)
	$(call rmr,.configs/)
	$(call rm,*.ews)
	$(call rm,*.Makefile)
