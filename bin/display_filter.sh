#!/bin/sh
sed -e '
s/\[\-\- Autoview using .*$//
s/\[\-\- Type: .*$//
s/\[\-\- Attachment .*$//
s/\[\-\- OpenSSL output follows .*$//
s/\[\-\- End of OpenSSL output \-\-\]$//
s/\[\-\- The following data is signed \-\-\]$//
s/\[\-\- End of signed data \-\-\]$//
s/\[\-\- The following data is S\/MIME encrypted \-\-\].*//g
s/\[\-\- End of S\/MIME encrypted data\. \-\-\].*$//g
'

