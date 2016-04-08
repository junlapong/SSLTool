@echo off

::------------------------------------------------------------------------

sslyze_cli\sslyze_cli.exe ^
--regular ^
--hsts ^
--ca_file=.\sslyze_cli\data\trust_stores\CertSrv_20290523.pem ^
%1

::--xml_out=%1.xml ^
::------------------------------------------------------------------------

@echo on
