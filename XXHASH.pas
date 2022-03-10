unit XXHASH;

interface
uses Sysutils,Classes,xxhashlib
{$IFDEF YWLIB}  //If you also installed my YWRTL package
                //YWRTL package: https://github.com/YWtheGod/YWRTL
  ,fastinttostr //For a faster BinToHex
  ,BufferPool   //For a no lock buffer allocating
{$ENDIF}        //use a system buildin implement instead will be just fine.
  ;
type
  //XXH3 128bits
  THashXXH3 = record
  private
    state : XXH3_state_t;
    procedure Update(const AData: PByte; ALength: NativeInt); overload; inline;
  public
    class function Create: THashXXH3; static; inline;
    class function SeedCreate(Seed:UInt64):THashXXH3; static; inline;
    procedure reset; inline;
    procedure SeedReset(Seed :UInt64); inline;
    procedure Update(const AData; const ALength: NativeInt); overload; inline;
    procedure Update(const AData: TBytes; const ALength: NativeInt = 0);
      overload; inline;
    procedure Update(const Input: string); overload; inline;
    procedure Update(const Input: string; const Encoding : TEncoding); overload;
      inline;
    procedure Update(const st: TStream; var size: NativeInt); overload; inline;
    function HashAsBytes : TBytes; overload; inline;
    function HashAsString: string; overload; inline;
    function HashAsUUID : TGuid; overload; inline;
    class function HashAsUUID(const B:Pointer; const L : NativeInt) : TGuid;
      overload; inline; static;
    class function HashAsUUID(const Input : string):TGuid; overload; inline;
      static;
    class function HashAsUUID(const Input : string; const Encoding : TEncoding):
      TGuid; overload; inline; static;
    class function HashAsUUID(const AData: TBytes; const ALen: NativeInt = 0):
      TGuid; overload; inline; static;
    class function HashAsUUID(const st : TStream; var size : NativeInt):TGuid;
      overload; inline; static;
    class function HashAsBytes(const B:Pointer; const L : NativeInt) : TBytes;
      overload; inline; static;
    class function HashAsBytes(const AData: TBytes; const ALen: NativeInt = 0):
      TBytes; overload; inline; static;
    class function HashAsBytes(const Input: string):TBytes; overload; inline;
      static;
    class function HashAsBytes(const Input: string; const Encoding: TEncoding):
      TBytes; overload; inline; static;
    class function HashAsBytes(const st : TStream; var size : NativeInt):TBytes;
      overload; inline; static;
    class function HashAsString(const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function HashAsString(const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function HashAsString(const Input: string):string; overload; inline;
      static;
    class function HashAsString(const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function HashAsString(const st: TStream; var size: NativeInt):string;
      overload; inline; static;

    class function SeedHashAsUUID(const Seed:UInt64; const B:Pointer; const L : NativeInt) : TGuid;
      overload; inline; static;
    class function SeedHashAsUUID(const Seed:UInt64; const Input : string):TGuid; overload; inline;
      static;
    class function SeedHashAsUUID(const Seed:UInt64; const Input : string; const Encoding : TEncoding):
      TGuid; overload; inline; static;
    class function SeedHashAsUUID(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt = 0):
      TGuid; overload; inline; static;
    class function SeedHashAsUUID(const Seed:UInt64; const st : TStream; var size : NativeInt):TGuid;
      overload; inline; static;
    class function SeedHashAsBytes(const Seed:UInt64; const B:Pointer; const L : NativeInt) : TBytes;
      overload; inline; static;
    class function SeedHashAsBytes(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt = 0):
      TBytes; overload; inline; static;
    class function SeedHashAsBytes(const Seed:UInt64; const Input: string):TBytes; overload; inline;
      static;
    class function SeedHashAsBytes(const Seed:UInt64; const Input: string; const Encoding: TEncoding):
      TBytes; overload; inline; static;
    class function SeedHashAsBytes(const Seed:UInt64; const st : TStream; var size : NativeInt):TBytes;
      overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const Input: string):string; overload; inline;
      static;
    class function SeedHashAsString(const Seed:UInt64; const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const st: TStream; var size: NativeInt):string;
      overload; inline; static;
  end;

  //XXH64
  THashXXH64 = record
  private
    state : XXH64_state_t;
    procedure Update(const AData: PByte; ALength: NativeInt); overload; inline;
  public
    class function Create: THashXXH64; static; inline;
    class function SeedCreate(Seed:UInt64):THashXXH64; static; inline;
    procedure reset; inline;
    procedure SeedReset(Seed :UInt64); inline;
    procedure Update(const AData; const ALength: NativeInt); overload; inline;
    procedure Update(const AData: TBytes; const ALength: NativeInt = 0);
      overload; inline;
    procedure Update(const Input: string); overload; inline;
    procedure Update(const Input: string; const Encoding : TEncoding); overload;
      inline;
    procedure Update(const st: TStream; var size: NativeInt); overload; inline;
    function HashAsString: string; overload; inline;
    function Hash : UInt64; overload; inline;
    class function Hash(const B:Pointer; const L : NativeInt) : UInt64;
      overload; inline; static;
    class function Hash(const Input : string):UInt64; overload; inline;
      static;
    class function Hash(const Input : string; const Encoding : TEncoding):
      UInt64; overload; inline; static;
    class function Hash(const AData: TBytes; const ALen: NativeInt = 0):
      UInt64; overload; inline; static;
    class function Hash(const st : TStream; var size : NativeInt):UInt64;
      overload; inline; static;
    class function HashAsString(const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function HashAsString(const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function HashAsString(const Input: string):string; overload; inline;
      static;
    class function HashAsString(const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function HashAsString(const st: TStream; var size: NativeInt):string;
      overload; inline; static;

    class function SeedHash(const Seed:UInt64; const B:Pointer; const L : NativeInt) : UInt64;
      overload; inline; static;
    class function SeedHash(const Seed:UInt64; const Input : string):UInt64; overload; inline;
      static;
    class function SeedHash(const Seed:UInt64; const Input : string; const Encoding : TEncoding):
      UInt64; overload; inline; static;
    class function SeedHash(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt = 0):
      UInt64; overload; inline; static;
    class function SeedHash(const Seed:UInt64; const st : TStream; var size : NativeInt):UInt64;
      overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const Input: string):string; overload; inline;
      static;
    class function SeedHashAsString(const Seed:UInt64; const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:UInt64; const st: TStream; var size: NativeInt):string;
      overload; inline; static;
  end;

  //XXH32
  THashXXH32 = record
  private
    state : XXH32_state_t;
    procedure Update(const AData: PByte; ALength: NativeInt); overload; inline;
  public
    class function Create: THashXXH32; static; inline;
    class function SeedCreate(Seed:Cardinal):THashXXH32; static; inline;
    procedure reset; inline;
    procedure SeedReset(Seed :Cardinal); inline;
    procedure Update(const AData; const ALength: NativeInt); overload; inline;
    procedure Update(const AData: TBytes; const ALength: NativeInt = 0);
      overload; inline;
    procedure Update(const Input: string); overload; inline;
    procedure Update(const Input: string; const Encoding : TEncoding); overload;
      inline;
    procedure Update(const st: TStream; var size: NativeInt); overload; inline;
    function HashAsString: string; overload; inline;
    function Hash : Cardinal; overload; inline;
    class function Hash(const B:Pointer; const L : NativeInt) : Cardinal;
      overload; inline; static;
    class function Hash(const Input : string):Cardinal; overload; inline;
      static;
    class function Hash(const Input : string; const Encoding : TEncoding):
      Cardinal; overload; inline; static;
    class function Hash(const AData: TBytes; const ALen: NativeInt = 0):
      Cardinal; overload; inline; static;
    class function Hash(const st : TStream; var size : NativeInt):Cardinal;
      overload; inline; static;
    class function HashAsString(const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function HashAsString(const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function HashAsString(const Input: string):string; overload; inline;
      static;
    class function HashAsString(const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function HashAsString(const st: TStream; var size: NativeInt):string;
      overload; inline; static;

    class function SeedHash(const Seed:Cardinal; const B:Pointer; const L : NativeInt) : Cardinal;
      overload; inline; static;
    class function SeedHash(const Seed:Cardinal; const Input : string):Cardinal; overload; inline;
      static;
    class function SeedHash(const Seed:Cardinal; const Input : string; const Encoding : TEncoding):
      Cardinal; overload; inline; static;
    class function SeedHash(const Seed:Cardinal; const AData: TBytes; const ALen: NativeInt = 0):
      Cardinal; overload; inline; static;
    class function SeedHash(const Seed:Cardinal; const st : TStream; var size : NativeInt):Cardinal;
      overload; inline; static;
    class function SeedHashAsString(const Seed:Cardinal; const B: Pointer; const L : NativeInt): string;
      overload; inline; static;
    class function SeedHashAsString(const Seed:Cardinal; const AData: TBytes; const ALen: NativeInt = 0):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:Cardinal; const Input: string):string; overload; inline;
      static;
    class function SeedHashAsString(const Seed:Cardinal; const Input: string; const Encoding: TEncoding):
      string; overload; inline; static;
    class function SeedHashAsString(const Seed:Cardinal; const st: TStream; var size: NativeInt):string;
      overload; inline; static;
  end;

implementation
uses Hash;

function Hex128(const t : XXH128_hash_t):string; inline
begin
  {$IFDEF YWLIB}
  Result := BinToHex2(@t,sizeof(XXH128_hash_t));
  {$ELSE}
  setlength(Result,sizeof(XXH128_hash_t)*2);
  BinToHex(t,PWideChar(Result),sizeof(XXH128_hash_t));
  {$ENDIF}
end;

function Hex64(const t : XXH64_hash_t):string; inline
begin
  {$IFDEF YWLIB}
  Result := BinToHex2(@t,sizeof(XXH64_hash_t));
  {$ELSE}
  setlength(Result,sizeof(XXH64_hash_t)*2);
  BinToHex(t,PWideChar(Result),sizeof(XXH64_hash_t));
  {$ENDIF}
end;

function Hex32(const t : XXH32_hash_t):string; inline
begin
  {$IFDEF YWLIB}
  Result := BinToHex2(@t,sizeof(XXH32_hash_t));
  {$ELSE}
  setlength(Result,sizeof(XXH32_hash_t)*2);
  BinToHex(t,PWideChar(Result),sizeof(XXH32_hash_t));
  {$ENDIF}
end;

procedure GetBuffer(var b : PByte); inline;
begin
  {$IFDEF YWLIB}
  b := bufferpool128k.GetBuffer;
  {$ELSE}
  Getmem(b,_BufSize);
  {$ENDIF}
end;

procedure FreeBuffer(var b : PByte); inline;
begin
  {$IFDEF YWLIB}
  bufferpool128k.FreeBuffer(b);
  {$ELSE}
  FreeMem(b);
  {$ENDIF}
end;

function TrueLen(const AData: TBytes; const ALength:NativeInt):NativeInt;inline;
begin
  Result := Length(AData);
  if (ALength>0)and(ALength<Result) then Result := ALength;
end;

{ THashXXH3 }

class function THashXXH3.Create: THashXXH3;
begin
  Result.reset;
end;

class function THashXXH3.SeedCreate(Seed: UInt64): THashXXH3;
begin
  Result.SeedReset(Seed);
end;

function THashXXH3.HashAsBytes: TBytes;
begin
  SetLength(Result,sizeof(XXH128_hash_t));
  PXXH128_hash_t(Result)^ := XXH3_128bits_digest(state);
end;

function THashXXH3.HashAsUUID: TGuid;
begin
  XXH128_hash_t(Result) := XXH3_128bits_digest(state);
end;

function THashXXH3.HashAsString: string;
begin
  Result := Hex128(XXH3_128bits_digest(state));
end;

procedure THashXXH3.reset;
begin
  if XXH3_128bits_reset(state)<>XXH_OK then
    raise EHashException.Create('XXH3_128bits_reset Error!');
end;

procedure THashXXH3.SeedReset(Seed: UInt64);
begin
  if XXH3_128bits_reset_withSeed(state,Seed)<>XXH_OK then
    raise EHashException.Create('XXH3_128bits_reset Error!');
end;

procedure THashXXH3.Update(const Input: string; const Encoding: TEncoding);
begin
  Update(Encoding.GetBytes(input));
end;

procedure THashXXH3.Update(const AData: PByte; ALength: NativeInt);
begin
   if XXH3_128bits_update(state,AData,ALength)<>XXH_OK then
     raise EHashException.Create('XXH3_128bits_update ERROR!');
end;

procedure THashXXH3.Update(const AData; const ALength: NativeInt);
begin
  Update(PByte(@AData), ALength);
end;

procedure THashXXH3.Update(const st: TStream; var size: NativeInt);
var b : PByte;
    s,u : integer;
    t : NativeInt;
begin
  t := 0;
  GetBuffer(b);
  try
    u := 128*1024;
    repeat
      if (size>0)and(size<t+128*1024) then u :=size-t;
      s := st.Read(b^,u);
      Update(b,s);
      inc(t,s);
    until s<128*1024;
  finally
    size := t;
    FreeBuffer(b);
  end;
end;

procedure THashXXH3.Update(const AData: TBytes; const ALength: NativeInt);
begin
  Update(PByte(AData), TrueLen(AData,ALength));
end;

procedure THashXXH3.Update(const Input: string);
begin
  Update(Input,TEncoding.UTF8);
end;

class function THashXXH3.HashAsBytes(const B: Pointer; const L: NativeInt):
  TBytes;
begin
  SetLength(Result,sizeof(XXH128_hash_t));
  PXXH128_hash_t(Result)^ := XXH3_128bits(B,L);
end;

class function THashXXH3.HashAsBytes(const AData: TBytes; const ALen: NativeInt)
  :TBytes;
begin
  Result:=HashAsBytes(Pointer(AData),TrueLen(Adata,ALen));
end;

class function THashXXH3.HashAsString(const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex128(XXH3_128bits(B,L))
end;

class function THashXXH3.HashAsUUID(const B: Pointer; const L: NativeInt):
  TGuid;
begin
  XXH128_hash_t(Result) := XXH3_128bits(B,L);
end;

class function THashXXH3.HashAsUUID(const Input: string): TGuid;
begin
  Result:=HashAsUUID(Input,TEncoding.UTF8);
end;

class function THashXXH3.HashAsUUID(const Input: string;
  const Encoding: TEncoding): TGuid;
begin
  Result:=HashAsUUID(Encoding.getbytes(Input));
end;

class function THashXXH3.HashAsUUID(const AData: TBytes; const ALen: NativeInt):
  TGuid;
begin
  Result:=HashAsUUID(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH3.HashAsBytes(const Input: string;
  const Encoding: TEncoding): TBytes;
begin
  Result := HashAsBytes(Encoding.GetBytes(Input));
end;

class function THashXXH3.HashAsString(const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=HashAsString(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH3.HashAsString(const Input: string): string;
begin
  Result := HashAsString(Input,TEncoding.UTF8);
end;

class function THashXXH3.HashAsString(const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := HashAsString(Encoding.GetBytes(Input));
end;

class function THashXXH3.HashAsBytes(const Input: string): TBytes;
begin
  Result := HashAsBytes(Input,TEncoding.UTF8);
end;

class function THashXXH3.HashAsUUID(const st: TStream;
  var size: NativeInt): TGuid;
var X : THashXXH3;
begin
  X.reset;
  X.Update(st,size);
  Result := X.HashAsUUID;
end;

class function THashXXH3.HashAsBytes(const st: TStream;
  var size: NativeInt): TBytes;
var X : THashXXH3;
begin
  X.reset;
  X.Update(st,size);
  Result := X.HashAsBytes;
end;

class function THashXXH3.HashAsString(const st: TStream;
  var size: NativeInt): string;
var X : THashXXH3;
begin
  X.reset;
  X.Update(st,size);
  Result := X.HashAsString;
end;


class function THashXXH3.SeedHashAsBytes(const Seed:UInt64; const B: Pointer; const L: NativeInt):
  TBytes;
begin
  SetLength(Result,sizeof(XXH128_hash_t));
  PXXH128_hash_t(Result)^ := XXH3_128bits_withSeed(B,L,Seed);
end;

class function THashXXH3.SeedHashAsBytes(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt)
  :TBytes;
begin
  Result:=SeedHashAsBytes(Seed,Pointer(AData),TrueLen(Adata,ALen));
end;

class function THashXXH3.SeedHashAsString(const Seed:UInt64; const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex128(XXH3_128bits_withSeed(B,L,Seed))
end;

class function THashXXH3.SeedHashAsUUID(const Seed:UInt64; const B: Pointer; const L: NativeInt):
  TGuid;
begin
  XXH128_hash_t(Result) := XXH3_128bits_withSeed(B,L,Seed);
end;

class function THashXXH3.SeedHashAsUUID(const Seed:UInt64; const Input: string): TGuid;
begin
  Result:=SeedHashAsUUID(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH3.SeedHashAsUUID(const Seed:UInt64; const Input: string;
  const Encoding: TEncoding): TGuid;
begin
  Result:=SeedHashAsUUID(Seed,Encoding.getbytes(Input));
end;

class function THashXXH3.SeedHashAsUUID(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt):
  TGuid;
begin
  Result:=SeedHashAsUUID(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH3.SeedHashAsBytes(const Seed:UInt64; const Input: string;
  const Encoding: TEncoding): TBytes;
begin
  Result := SeedHashAsBytes(Seed,Encoding.GetBytes(Input));
end;

class function THashXXH3.SeedHashAsString(const Seed:UInt64; const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=SeedHashAsString(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH3.SeedHashAsString(const Seed:UInt64; const Input: string): string;
begin
  Result := SeedHashAsString(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH3.SeedHashAsString(const Seed:UInt64; const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := SeedHashAsString(Seed,Encoding.GetBytes(Input));
end;

class function THashXXH3.SeedHashAsBytes(const Seed:UInt64; const Input: string): TBytes;
begin
  Result := SeedHashAsBytes(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH3.SeedHashAsUUID(const Seed:UInt64; const st: TStream;
  var size: NativeInt): TGuid;
var X : THashXXH3;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.HashAsUUID;
end;

class function THashXXH3.SeedHashAsBytes(const Seed:UInt64; const st: TStream;
  var size: NativeInt): TBytes;
var X : THashXXH3;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.HashAsBytes;
end;

class function THashXXH3.SeedHashAsString(const Seed:UInt64; const st: TStream;
  var size: NativeInt): string;
var X : THashXXH3;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.HashAsString;
end;

class function THashXXH64.Create: THashXXH64;
begin
  Result.reset;
end;

class function THashXXH64.SeedCreate(Seed: UInt64): THashXXH64;
begin
  Result.SeedReset(Seed);
end;

function THashXXH64.Hash: UInt64;
begin
  XXH64_hash_t(Result) := XXH64_digest(state);
end;

function THashXXH64.HashAsString: string;
begin
  Result := Hex64(XXH64_digest(state));
end;

procedure THashXXH64.reset;
begin
  if XXH64_reset(state,0)<>XXH_OK then
    raise EHashException.Create('XXH64_reset Error!');
end;

procedure THashXXH64.SeedReset(Seed: UInt64);
begin
  if XXH64_reset(state,Seed)<>XXH_OK then
    raise EHashException.Create('XXH64_reset Error!');
end;

procedure THashXXH64.Update(const Input: string; const Encoding: TEncoding);
begin
  Update(Encoding.GetBytes(input));
end;

procedure THashXXH64.Update(const AData: PByte; ALength: NativeInt);
begin
   if XXH64_update(state,AData,ALength)<>XXH_OK then
     raise EHashException.Create('XXH64_update ERROR!');
end;

procedure THashXXH64.Update(const AData; const ALength: NativeInt);
begin
  Update(PByte(@AData), ALength);
end;

procedure THashXXH64.Update(const st: TStream; var size: NativeInt);
var b : PByte;
    s,u : integer;
    t : NativeInt;
begin
  t := 0;
  GetBuffer(b);
  try
    u := 128*1024;
    repeat
      if (size>0)and(size<t+128*1024) then u :=size-t;
      s := st.Read(b^,u);
      Update(b,s);
      inc(t,s);
    until s<128*1024;
  finally
    size := t;
    FreeBuffer(b);
  end;
end;

procedure THashXXH64.Update(const AData: TBytes; const ALength: NativeInt);
begin
  Update(PByte(AData), TrueLen(AData,ALength));
end;

procedure THashXXH64.Update(const Input: string);
begin
  Update(Input,TEncoding.UTF8);
end;

class function THashXXH64.HashAsString(const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex64(XXH64(B,L,0))
end;

class function THashXXH64.Hash(const B: Pointer; const L: NativeInt):
  UInt64;
begin
  XXH64_hash_t(Result) := XXH64(B,L,0);
end;

class function THashXXH64.Hash(const Input: string): UInt64;
begin
  Result:=Hash(Input,TEncoding.UTF8);
end;

class function THashXXH64.Hash(const Input: string;
  const Encoding: TEncoding): UInt64;
begin
  Result:=Hash(Encoding.getbytes(Input));
end;

class function THashXXH64.Hash(const AData: TBytes; const ALen: NativeInt):
  UInt64;
begin
  Result:=Hash(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH64.HashAsString(const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=HashAsString(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH64.HashAsString(const Input: string): string;
begin
  Result := HashAsString(Input,TEncoding.UTF8);
end;

class function THashXXH64.HashAsString(const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := HashAsString(Encoding.GetBytes(Input));
end;

class function THashXXH64.Hash(const st: TStream;
  var size: NativeInt): UInt64;
var X : THashXXH64;
begin
  X.reset;
  X.Update(st,size);
  Result := X.Hash;
end;

class function THashXXH64.HashAsString(const st: TStream;
  var size: NativeInt): string;
var X : THashXXH64;
begin
  X.reset;
  X.Update(st,size);
  Result := X.HashAsString;
end;


class function THashXXH64.SeedHashAsString(const Seed:UInt64; const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex64(XXH64(B,L,Seed))
end;

class function THashXXH64.SeedHash(const Seed:UInt64; const B: Pointer; const L: NativeInt):
  UInt64;
begin
  XXH64_hash_t(Result) := XXH64(B,L,Seed);
end;

class function THashXXH64.SeedHash(const Seed:UInt64; const Input: string): UInt64;
begin
  Result:=SeedHash(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH64.SeedHash(const Seed:UInt64; const Input: string;
  const Encoding: TEncoding): UInt64;
begin
  Result:=SeedHash(Seed,Encoding.getbytes(Input));
end;

class function THashXXH64.SeedHash(const Seed:UInt64; const AData: TBytes; const ALen: NativeInt):
  UInt64;
begin
  Result:=SeedHash(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH64.SeedHashAsString(const Seed:UInt64; const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=SeedHashAsString(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH64.SeedHashAsString(const Seed:UInt64; const Input: string): string;
begin
  Result := SeedHashAsString(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH64.SeedHashAsString(const Seed:UInt64; const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := SeedHashAsString(Seed,Encoding.GetBytes(Input));
end;

class function THashXXH64.SeedHash(const Seed:UInt64; const st: TStream;
  var size: NativeInt): UInt64;
var X : THashXXH64;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.Hash;
end;

class function THashXXH64.SeedHashAsString(const Seed:UInt64; const st: TStream;
  var size: NativeInt): string;
var X : THashXXH64;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.HashAsString;
end;

class function THashXXH32.Create: THashXXH32;
begin
  Result.reset;
end;

class function THashXXH32.SeedCreate(Seed: Cardinal): THashXXH32;
begin
  Result.SeedReset(Seed);
end;

function THashXXH32.Hash: Cardinal;
begin
  XXH32_hash_t(Result) := XXH32_digest(state);
end;

function THashXXH32.HashAsString: string;
begin
  Result := Hex32(XXH32_digest(state));
end;

procedure THashXXH32.reset;
begin
  if XXH32_reset(state,0)<>XXH_OK then
    raise EHashException.Create('XXH32_reset Error!');
end;

procedure THashXXH32.SeedReset(Seed: Cardinal);
begin
  if XXH32_reset(state,Seed)<>XXH_OK then
    raise EHashException.Create('XXH32_reset Error!');
end;

procedure THashXXH32.Update(const Input: string; const Encoding: TEncoding);
begin
  Update(Encoding.GetBytes(input));
end;

procedure THashXXH32.Update(const AData: PByte; ALength: NativeInt);
begin
   if XXH32_update(state,AData,ALength)<>XXH_OK then
     raise EHashException.Create('XXH32_update ERROR!');
end;

procedure THashXXH32.Update(const AData; const ALength: NativeInt);
begin
  Update(PByte(@AData), ALength);
end;

procedure THashXXH32.Update(const st: TStream; var size: NativeInt);
var b : PByte;
    s,u : integer;
    t : NativeInt;
begin
  t := 0;
  GetBuffer(b);
  try
    u := 128*1024;
    repeat
      if (size>0)and(size<t+128*1024) then u :=size-t;
      s := st.Read(b^,u);
      Update(b,s);
      inc(t,s);
    until s<128*1024;
  finally
    size := t;
    FreeBuffer(b);
  end;
end;

procedure THashXXH32.Update(const AData: TBytes; const ALength: NativeInt);
begin
  Update(PByte(AData), TrueLen(AData,ALength));
end;

procedure THashXXH32.Update(const Input: string);
begin
  Update(Input,TEncoding.UTF8);
end;

class function THashXXH32.HashAsString(const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex32(XXH32(B,L,0))
end;

class function THashXXH32.Hash(const B: Pointer; const L: NativeInt):
  Cardinal;
begin
  XXH32_hash_t(Result) := XXH32(B,L,0);
end;

class function THashXXH32.Hash(const Input: string): Cardinal;
begin
  Result:=Hash(Input,TEncoding.UTF8);
end;

class function THashXXH32.Hash(const Input: string;
  const Encoding: TEncoding): Cardinal;
begin
  Result:=Hash(Encoding.getbytes(Input));
end;

class function THashXXH32.Hash(const AData: TBytes; const ALen: NativeInt):
  Cardinal;
begin
  Result:=Hash(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH32.HashAsString(const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=HashAsString(Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH32.HashAsString(const Input: string): string;
begin
  Result := HashAsString(Input,TEncoding.UTF8);
end;

class function THashXXH32.HashAsString(const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := HashAsString(Encoding.GetBytes(Input));
end;

class function THashXXH32.Hash(const st: TStream;
  var size: NativeInt): Cardinal;
var X : THashXXH32;
begin
  X.reset;
  X.Update(st,size);
  Result := X.Hash;
end;

class function THashXXH32.HashAsString(const st: TStream;
  var size: NativeInt): string;
var X : THashXXH32;
begin
  X.reset;
  X.Update(st,size);
  Result := X.HashAsString;
end;


class function THashXXH32.SeedHashAsString(const Seed:Cardinal; const B: Pointer; const L: NativeInt):
  string;
begin
  Result :=Hex32(XXH32(B,L,Seed))
end;

class function THashXXH32.SeedHash(const Seed:Cardinal; const B: Pointer; const L: NativeInt):
  Cardinal;
begin
  XXH32_hash_t(Result) := XXH32(B,L,Seed);
end;

class function THashXXH32.SeedHash(const Seed:Cardinal; const Input: string): Cardinal;
begin
  Result:=SeedHash(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH32.SeedHash(const Seed:Cardinal; const Input: string;
  const Encoding: TEncoding): Cardinal;
begin
  Result:=SeedHash(Seed,Encoding.getbytes(Input));
end;

class function THashXXH32.SeedHash(const Seed:Cardinal; const AData: TBytes; const ALen: NativeInt):
  Cardinal;
begin
  Result:=SeedHash(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH32.SeedHashAsString(const Seed:Cardinal; const AData: TBytes; const ALen:
  NativeInt): string;
begin
  Result:=SeedHashAsString(Seed,Pointer(AData),TrueLen(AData,ALen));
end;

class function THashXXH32.SeedHashAsString(const Seed:Cardinal; const Input: string): string;
begin
  Result := SeedHashAsString(Seed,Input,TEncoding.UTF8);
end;

class function THashXXH32.SeedHashAsString(const Seed:Cardinal; const Input: string;
  const Encoding: TEncoding): string;
begin
  Result := SeedHashAsString(Seed,Encoding.GetBytes(Input));
end;

class function THashXXH32.SeedHash(const Seed:Cardinal; const st: TStream;
  var size: NativeInt): Cardinal;
var X : THashXXH32;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.Hash;
end;

class function THashXXH32.SeedHashAsString(const Seed:Cardinal; const st: TStream;
  var size: NativeInt): string;
var X : THashXXH32;
begin
  X.SeedReset(Seed);
  X.Update(st,size);
  Result := X.HashAsString;
end;

end.
