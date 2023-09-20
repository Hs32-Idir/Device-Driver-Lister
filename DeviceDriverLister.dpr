{
  * Modules and drivers lister, Simple Delphi Source code to demonstrate
    how to use EnumDeviceDrivers API to list device driver full path.
     compatibile : recent win os.
     coder : Hs32-Idir.
     Web   : http://wWw.Hs32-Idir.tk.
     Type : Console Application.
}

program DrvList;

{$APPTYPE CONSOLE}

uses Windows,PsAPI;

var
  MyBuffer : array[0..$3FFF - 1] of DWORD;
  FullName : array[0..MAX_PATH]  of WChar;
  BaseName : array[0..MAX_PATH]  of WChar;
  FullList : array of Pointer;
  MaxCount : dword;
  iRecord  : Integer;
begin
  WriteLn('Driver and Module Lister');
  WriteLn('http://wWw.Hs32-Idir.tk');
  WriteLn('');
  EnumDeviceDrivers( @MyBuffer, SizeOf(MyBuffer), MaxCount );
  SetLength( FullList, MaxCount div SizeOf(DWORD) );
  Move( MyBuffer, FullList[0], MaxCount );

  For iRecord := low(FullList) to High(FullList) do
  begin
    if GetDeviceDriverBaseNameW( FullList[iRecord] , BaseName , Sizeof(BaseName) ) > 0 then
  //  Writeln(BaseName);
    if GetDeviceDriverFileNameW( FullList[iRecord] , FullName , Sizeof(FullName) ) > 0 then
    Writeln(FullName);
  end;

  Readln;
  
end.

