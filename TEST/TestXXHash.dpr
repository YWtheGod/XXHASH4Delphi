program TestXXHash;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SysTem.Hash,
  Windows,
  XXHash;

const
  TestCount = $10000000;
var
  Data : array[0..TestCount-1] of Word;
  t1,t2 : Cardinal;
  s : string;
  M : THashMD5;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    randomize;
    for var i := 0 to TestCount-1 do Data[i] := Random(65536);
    Writeln(format('Data Size: %d bytes',[sizeof(Data)]));
    t1 := GetTickCount;
    M := THashMD5.Create;
    M.Update(Data,sizeof(Data));
    s := M.HashAsString;
    t2 := GetTickCount;
    writeln(format('MD5:%s  Run time:%dms',[s,t2-t1]));
    t1 := GetTickCount;
    s := THashXXH3.HashAsString(@Data,sizeof(Data));
    t2 := GetTickCount;
    writeln(format('XXH3:%s  Run time:%dms',[s,t2-t1]));
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
