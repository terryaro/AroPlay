unit Lame_Enc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls;

const
  BE_CONFIG_MP3  = 0;
  BE_CONFIG_LAME = 256;

type
  THBESTREAM = ULONG;
  PHBESTREAM = ^THBESTREAM;
  PSHORT     = ^SHORT;
  PBYTE      = ^Byte;
  LMODE = (STEREO, JSTEREO, DUALCHANNEL, MONO);
  LBITRATE = (b32, b48, b64, b96, b128, b160, b192, b224, b256, b320);
  LMAXBITRATE = (m160, m192, m224, m256 ,m320);
  lQUALITY = (NORMAL, LOW, HIGH, VOICE);
  LVBRQUALITY = (v0, v1, v2, v3, v4, v5, v6, v7, v8 ,v9);
  PLHV1 = ^TLHV1;
  TLHV1 = packed record
    dwStructVersion : DWORD;
    dwStructSize    : DWORD;
    dwSampleRate    : DWORD;
    dwReSampleRate  : DWORD;
    nMode    : Integer;
    dwBitRate       : DWORD;
    dwMaxBitRate    : DWORD;
    nQuality        : DWORD;
    dwMpegVersion   : DWORD;
    dwPsyModel      : DWORD;
    dwEmphasis      : DWORD;
    bPrivate        : BOOL;
    bCRC            : BOOL;
    bCopyRight      : BOOL;
    bOriginal       : BOOL;
    bWriteVBRHeader : BOOL;
    bEnableVBR    : BOOL;
    nVBRQuality     : Integer;
    btReserved      : array [0..255] of Byte;
  end;
  PLameMP3 = ^TLameMP3;
  TLameMP3 = packed record
    dwSampleRate : DWORD;
    byMode       : Byte;
    wBitrate     : WORD;
    bPrivate     : BOOL;
    bCRC         : BOOL;
    bCopyright   : BOOL;
    bOriginal    : BOOL;
  end;
  PFormat = ^TFormat;
  TFormat = packed record
    case dwConfig : DWord of
      BE_CONFIG_MP3   : (MP3: TLameMP3);
      BE_CONFIG_LAME  : (LHV1: TLHV1);
  end;
  PBECONFIG = ^TBECONFIG;
  TBECONFIG = packed record
  Format: TFormat;
  end;
  function beInitStream(var pbeConfig: TBEConfig; var dwSamples: DWORD; var dwBufferSize: DWORD; var phbeStream: THBESTREAM): ULONG; cdecl; external 'LAME_ENC.DLL';
  function beEncodeChunk(hbeStream: THBEStream; nSamples:DWORD; pSamples: PShort;  pOutput: PByte; var pdwOutput: DWORD): ULONG; cdecl; external 'LAME_ENC.DLL';
  function beDeinitStream(hbeStream: THBEStream; pOutput:PByte; var pdwOutput : DWORD): ULONG; cdecl; external 'LAME_ENC.DLL';
  function beCloseStream(var hbeStream: THBEStream): ULONG; cdecl; external 'LAME_ENC.DLL';
  function beInit: Integer;
  function beEnc(var Ms: TMemoryStream; var Md: TMemoryStream): Integer; overload;
  function beEnc(var Ms: TMemoryStream; var Fd: TFileStream): Integer; overload;
  function beEnc(var sBuf: Pointer; sLen: Integer; var Md: TMemoryStream): Integer; overload;
  function beEnc(var sBuf: Pointer; sLen: Integer; var Fd: TFileStream): Integer; overload;
  function beEnc(var sBuf: Pointer; var sLen: Integer): Integer; overload;
  function beDeinit: Integer; overload;
  function beDeinit(var Md: TMemoryStream): Integer; overload;
  function beDeinit(var Fd: TFileStream): Integer; overload;
var
  Done          : DWORD;
  dwWrite       : DWORD;
  toRead        : DWORD;
  isRead        : DWORD;
  toWrite       : DWORD;
  IsWritten     : DWORD;
  sLength       : DWORD;
  FNumSamples   : DWORD;
  FBufSize      : DWORD;
  InputBufSize  : DWORD;
  FMp3BlockAlign: DWORD;
  vConfig       : TBeConfig;
  FHBeStream    : THBeStream;
  FInputBuf     : Pointer;
  FOutputBuf    : Pointer;

implementation

function beInit: Integer;
begin
  try
    Result:= BeInitStream(vConfig, FNumSamples, FBufSize, FHBeStream);
    if Result <> 0 then Exit;
    InputBufSize:=FNumSamples*FMp3BlockAlign;
    GetMem(FInputBuf,InputBufSize);
    GetMem(FOutputBuf,FBufSize*32);
  except
    Result:=9;
  end;
end;

function beEnc(var Ms: TMemoryStream; var Md: TMemoryStream): Integer;
begin
  try
    sLength:= Ms.Size;
    Done:= 0;
    While Done <> sLength do begin
      if (Done + (InputBufSize) <= sLength) then toRead:= InputBufSize else toRead:= sLength - Done;
      isRead:= Ms.Read(FInputBuf^,toRead);
      if isRead <> toRead then Exception.Create('');
      Result:= beEncodeChunk(FHBeStream,(toRead div 2), FInputBuf, FOutputBuf, toWrite);
      if Result <> 0 then Exit;
      IsWritten:= Md.Write(FOutputBuf^,toWrite);
      if toWrite <> IsWritten then Exception.Create('');
      Done:= Done + toRead;
    end;
  except
    Result:= 9;
  end;
end;

function beEnc(var Ms: TMemoryStream; var Fd: TFileStream): Integer;
begin
  try
    sLength:= Ms.Size;
    Done:= 0;
    While Done <> sLength do begin
      if (Done + (InputBufSize) <= sLength) then toRead:= InputBufSize else toRead:= sLength - Done;
      isRead:= Ms.Read(FInputBuf^,toRead);
      if isRead <> toRead then Exception.Create('');
      Result:= beEncodeChunk(FHBeStream,(toRead div 2), FInputBuf, FOutputBuf, toWrite);
      if Result <> 0 then Exit;
      IsWritten:= Fd.Write(FOutputBuf^,toWrite);
      if toWrite <> IsWritten then Exception.Create('');
      Done:= Done + toRead;
    end;
  except
    Result:= 9;
  end;
end;

function beEnc(var sBuf: Pointer; sLen: Integer; var Md: TMemoryStream): Integer;
begin
  try
    Done:= 0;
    While Done <> sLen do begin
      if (Done + (InputBufSize) <= sLen) then toRead:= InputBufSize else toRead:= sLen - Done;
      Move(Pointer(Longint(sBuf) + Done)^, FInputBuf^, toRead);
      if isRead <> toRead then Exception.Create('');
      Result:= beEncodeChunk(FHBeStream,(toRead div 2), FInputBuf, FOutputBuf, toWrite);
      if Result <> 0 then Exit;
      IsWritten:= Md.Write(FOutputBuf^,toWrite);
      if toWrite <> IsWritten then Exception.Create('');
      Done:= Done + toRead;
    end;
  except
    Result:= 9;
  end;
end;

function beEnc(var sBuf: Pointer; sLen: Integer; var Fd: TFileStream): Integer;
begin
  try
    Done:= 0;
    While Done <> sLen do begin
      if (Done + (InputBufSize) <= sLen) then toRead:= InputBufSize else toRead:= sLen - Done;
      Move(Pointer(Longint(sBuf) + Done)^, FInputBuf^, toRead);
      if isRead <> toRead then Exception.Create('');
      Result:= beEncodeChunk(FHBeStream,(toRead div 2), FInputBuf, FOutputBuf, toWrite);
      if Result <> 0 then Exit;
      IsWritten:= Fd.Write(FOutputBuf^,toWrite);
      if toWrite <> IsWritten then Exception.Create('');
      Done:= Done + toRead;
    end;
  except
    Result:= 9;
  end;
end;

function beEnc(var sBuf: Pointer; var sLen: Integer): Integer;
begin
  Result:= beEncodeChunk(FHBeStream,(sLen div 2), sBuf, FOutputBuf, toWrite);
  sBuf:=FOutputBuf;
  sLen:=toWrite;
end;

function beDeinit: Integer;
begin
  try
    Result:= beDeinitStream(FHBeStream, FOutputBuf, dwWrite);
    Result:= beCloseStream(FHBeStream);
  finally
    FreeMem(FInputBuf);
    FreeMem(FOutputBuf);
    FInputBuf:= Nil;
    FOutputBuf:= Nil;
  end;
end;

function beDeinit(var Md: TMemoryStream): Integer;
begin
  try
    Result:= beDeinitStream(FHBeStream, FOutputBuf, dwWrite);
    Md.Write(FOutputBuf^,toWrite);
    Result:= beCloseStream(FHBeStream);
  finally
    FreeMem(FInputBuf);
    FreeMem(FOutputBuf);
    FInputBuf:= Nil;
    FOutputBuf:= Nil;
  end;
end;

function beDeinit(var Fd: TFileStream): Integer;
begin
  try
    Result:= beDeinitStream(FHBeStream, FOutputBuf, dwWrite);
    Fd.Write(FOutputBuf^,toWrite);
    Result:= beCloseStream(FHBeStream);
  finally
    FreeMem(FInputBuf);
    FreeMem(FOutputBuf);
    FInputBuf:= Nil;
    FOutputBuf:= Nil;
  end;
end;

end.


