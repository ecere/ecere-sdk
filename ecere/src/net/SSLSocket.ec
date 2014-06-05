#undef __BLOCKS__
#ifndef ECERE_NOSSL
#define byte _byte
#define int64 _int64
#define uint _uint
#define set _set
#include <openssl/ssl.h>
#if defined(__WIN32__)
#include <openssl/applink.c>
#endif
#undef byte
#undef int64
#undef uint
#undef set
#endif

#ifdef BUILDING_ECERE_COM
import "Socket"
#else
public import "ecere"
#endif

#ifndef ECERE_NOSSL
/*
static char * pass = "password";

static int password_cb(char *buf) //,int num, int rwflag,void *userdata)
{
   // if(num<strlen(pass)+1) return(0);
   strcpy(buf,pass);
   return(strlen(pass));
}
*/

public class SSLSocket : Socket
{
   SSL_CTX *ctx;
   SSL *ssl;
   BIO *sbio;
   SSL_METHOD *meth;
   int s;
   bool autoEstablish;
   autoEstablish = true;

   SSLSocket()
   {
      static bool initialized = false;
      if(!initialized)
      {
         SSL_library_init();
         initialized = true;
      }
   }

   void OnDisconnect(int code)
   {
      if(sbio)
      {
         //BIO_free(sbio);
         sbio = null;
      }
      if(ssl)
      {
         //SSL_free(ssl);
         ssl = null;
      }
      if(ctx)
      {
         SSL_CTX_free(ctx);
         ctx = null;
      }
   }

   int ReceiveData(unsigned char * buffer, int count, unsigned int flags)
   {
      int n = ssl ? SSL_read(ssl, buffer, count) : Socket::ReceiveData(buffer, count, flags);
      return n;
   }

   int SendData(const unsigned char * buffer, int count, unsigned int flags)
   {
      int n = ssl ? SSL_write(ssl, buffer, count) : Socket::SendData(buffer, count, flags);
      return n;
   }

   bool EstablishConnection()
   {
      bool result;
      /*
      X509 *peer;
      char peer_CN[256];
      int cipherResult;
      */

      meth = (SSL_METHOD *)SSLv23_method();
      //meth = TLSv1_method();
      ctx = SSL_CTX_new(meth);
      // cipherResult = SSL_CTX_set_cipher_list(ctx, "ALL:!DH:!EXP:!RC4:@STRENGTH"); // TLS_RSA_WITH_3DES_EDE_CBC_SHA ?
      SSL_CTX_set_session_id_context(ctx, (void *)this, sizeof(SSLSocket));
      ssl = SSL_new(ctx);
      sbio = BIO_new_socket(s, BIO_NOCLOSE);
      SSL_set_bio(ssl,sbio,sbio);

      result = SSL_connect(ssl) > 0;

      /*
      if(result)
      {
         if(!(SSL_CTX_use_certificate_chain_file(ctx, "client.pem")))
            printf("Can't read certificate file");

         SSL_CTX_set_default_passwd_cb(ctx, password_cb);

         if(!(SSL_CTX_use_PrivateKey_file(ctx, "client.pem", SSL_FILETYPE_PEM)))
            printf("Can't read key file");

         if(!(SSL_CTX_load_verify_locations(ctx, "root.pem", 0)))
            printf("Can't read CA list");

         if(SSL_get_verify_result(ssl)!=X509_V_OK)
            printf("Certificate doesn't verify");

         peer=SSL_get_peer_certificate(ssl);
         X509_NAME_get_text_by_NID(X509_get_subject_name(peer),
         NID_commonName, peer_CN, 256);

         if(strcasecmp(peer_CN, host))
            printf("Common name doesn't match host name");
      }
      */
      return result;
   }

   bool OnEstablishConnection(int s)
   {
      this.s = s;
      if(autoEstablish)
         return EstablishConnection();
      else
         return true;
   }

   ~SSLSocket()
   {
      /*if(sbio)
         BIO_free(sbio);
      if(ssl)
         SSL_free(ssl);*/
      if(ctx)
         SSL_CTX_free(ctx);
   }
}
#endif
