@echo off

::------------------------------------------------------------------------
:: PROXY ::
:: SET PROXY="http://username:password@proxy-host:port"
SET PROXY="http://127.0.0.1:3128"

::------------------------------------------------------------------------

sslyze_cli\sslyze_cli.exe ^
--https_tunnel=%PROXY% ^
--regular ^
--hsts ^
--ca_file=.\sslyze_cli\data\trust_stores\BAY_Root_CA.crt ^
%1

::--xml_out=%1.xml

::------------------------------------------------------------------------

@echo on
