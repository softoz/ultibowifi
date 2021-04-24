unit overrides;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, platform, logoutput, globalconfig, globalconst;

procedure myloggingoutputhandler(AFacility,ASeverity:LongWord;const ATag,AContent:String);

implementation

procedure myloggingoutputhandler(AFacility,ASeverity:LongWord;const ATag,AContent:String);
begin
//  if (atag <> 'USB') and (atag <> 'Device') then
    if (atag = 'WIFIdevice') or (atag = 'MMC') then
      log('('+atag+')' + ' ' + acontent);
end;


initialization
  MMC_AUTO_DEVICE_CREATE := False;
  MMC_AUTOSTART := False;
  CONSOLE_REGISTER_LOGGING := True;
  CONSOLE_LOGGING_DEFAULT := True;
  CONSOLE_LOGGING_POSITION := CONSOLE_POSITION_BOTTOM;

  // at the moment we don't want auto init because the USB device where the firmware
  // is loaded from is not available until after initialisation.

  WIFI_AUTO_INIT := False;

end.

