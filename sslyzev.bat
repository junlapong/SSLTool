@echo off

::------------------------------------------------------------------------

sslyze_cli\sslyze_cli.exe ^
--sslv2 --sslv3 --tlsv1 --tlsv1_1 --tlsv1_2 --reneg --resum ^
--certinfo_basic --http_get --hide_rejected_ciphers ^
--compression --openssl_ccs --fallback ^
--hsts ^
--ca_file=.\sslyze_cli\data\trust_stores\CertSrv_20290523.pem ^
%1

::--xml_out=%1.xml ^
::------------------------------------------------------------------------

@echo on
