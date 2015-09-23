@echo off

::------------------------------------------------------------------------

sslyze\sslyze ^
--sslv2 --sslv3 --tlsv1 --tlsv1_1 --tlsv1_2 ^
--reneg ^
--resum ^
--certinfo=basic ^
--hide_rejected_ciphers ^
--compression ^
--heartbleed ^
--hsts ^
--chrome_sha1 ^
%1

::--http_get ^
::--ca_file=.\sslyze\data\trust_stores\CertSrv_20290523.pem ^
::--xml_out=%1.xml

::------------------------------------------------------------------------

@echo on
