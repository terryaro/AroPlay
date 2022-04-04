unit AudioRecord;

interface

uses Windows, Messages, Classes, SysUtils, Controls, Forms, MMSystem, Lame_Enc, Dialogs;

type
  TWaveInEvent = procedure(Data: Pointer; Count: Integer) of object;
  TSamplesPerSec = (s8K, s11K, s22K ,s32K, s38K, s44K, s48K, s96K );
  TBitsperSample = (bs8Bit, bs16Bit);
  TOutType = (WAVBuffer, WAVFileStream, Mp3Buffer, Mp3MemoryStream, Mp3FileStream);
  EWaveException = class(Exception);
  TAudioRecord = class(TComponent)
  private
    FHandle: HWND;
    FWaveID: PHWaveIn;
    FDataSize: Integer;
    FRecBufferSize: Integer;
    FOnData: TWaveInEvent;
    FActive: BOOL;
    FPause: BOOL;
    FFormat: TWaveFormatEx;
    FChannels: DWORD;
    FHeaderList: TList;
    FMp3Mode: LMODE;
    FMp3Quality: LQUALITY;
    FMp3BitRate: DWORD;
    FMp3MaxBitRate: DWORD;
    FMp3Private: BOOL;
    FMp3CRC: BOOL;
    FMp3CopyRight: BOOL;
    FMp3Original: BOOL;
    FMp3WriteVBRHeader: BOOL;
    FMp3EnableVBR: BOOL;
    FMp3VBRQuality: LVBRQUALITY;
    FOutType: TOutType;
    FEncBufferSize: Integer;
    FFileName: String;
    Ofs: TFileStream;
    Oms: TMemoryStream;
    Ebs: TMemoryStream;
    Ebc: Integer;
    procedure AddBuffer(Header: PWaveHdr);
    procedure DeleteBuffer(var Header: PWaveHdr);
    procedure SetBitsperSample(const Value: TBitsperSample);
    procedure SetChannels(const Value: LMODE);
    procedure SetSamplesPerSec(const Value: TSamplesPerSec);
    procedure SetRecBufferSize(const Value: Integer);
    procedure MakeWaveFormat(var Format: TWaveFormatEx; Channels, SamplesPerSec, BitsperSample: DWORD);
    procedure SetMp3BitRate(const Value: LBitRate);
    procedure SetMp3MaxBitRate(const Value: LMaxBitRate);
    procedure SetEncBufferSize(const Value: Integer);
    procedure FreeHeaderBuffer;
    procedure AddPrepareBuffer;
    procedure DoDataEvent(Data: Pointer; Count: Integer);
    procedure WaveInCallback (var msg:TMessage); message MM_WIM_DATA;
    function GetMp3BitRate: LBitRate;
    function GetMp3MaxBitRate: LMaxBitRate;
    function GetBitsperSample: TBitsperSample;
    function GetSamplesPerSec: TSamplesPerSec;
  protected
    procedure WndProc(var Message: TMessage); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Handle: HWND read FHandle;
    function InitWavFile(var Fs: TFileStream): Integer;
    function DeInitWavFile(var Fs: TFileStream): Integer;
    procedure SetMp3Enc;
    procedure Open;
    procedure Pause;
    procedure Continue;
    procedure Close;
  published
    property Active: BOOL read FActive;
    property isPause: BOOL read FPause;
    property OnData: TWaveInEvent read FOnData write FOnData;
    property RecBufferSize: Integer read FRecBufferSize write SetRecBufferSize;
    property RecChannels: LMODE read FMp3Mode write SetChannels;
    property RecSamplesPerSec: TSamplesPerSec read GetSamplesPerSec write SetSamplesPerSec;
    property RecBitsperSample: TBitsperSample read GetBitsperSample write SetBitsperSample;
    property Mp3Quality: LQUALITY read FMp3Quality write FMp3Quality;
    property Mp3BitRate: LBITRATE read GetMp3BitRate write SetMp3BitRate;
    property Mp3MaxBitRate: LMAXBITRATE read GetMp3MaxBitRate write SetMp3MaxBitRate;
    property Mp3Private: BOOL read FMp3Private write FMp3Private;
    property Mp3CRC: BOOL read FMp3CRC write FMp3CRC;
    property Mp3CopyRight: BOOL read FMp3CopyRight write FMp3CopyRight;
    property Mp3Original: BOOL read FMp3Original write FMp3Original;
    property Mp3WriteVBRHeader: BOOL read FMp3WriteVBRHeader write FMp3WriteVBRHeader;
    property Mp3EnableVBR: BOOL read FMp3EnableVBR write FMp3EnableVBR;
    property Mp3VBRQuality: LVBRQUALITY read FMp3VBRQuality write FMp3VBRQuality;
    property EncBufferSize: Integer read FEncBufferSize write SetEncBufferSize;
    property OutType: TOutType read FOutType write FOutType;
    property FileName: String read FFileName write FFileName;
  end;
  procedure Register;

const
  SamplesPerSecValue: array [TSamplesPerSec] of DWORD = (8000, 11025, 22050, 32000, 38000, 44100, 48000, 96000);
  BitsperSampleValue: array [TBitsperSample] of WORD = (8, 16);
  PCMFormat: TWaveFormatEx = (
    wFormatTag: 1;
    nChannels: 2;
    nSamplesPerSec: 44100;
    nAvgBytesPerSec: 176400;
    nBlockAlign: 4;
    wBitsperSample: 16;
    cbSize: 0 );

implementation

constructor TAudioRecord.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHandle := AllocateHWND(WndProc);
  FHeaderList:= TList.Create;
  Ebs:= TMemoryStream.Create;
  FOutType:= WAVBuffer;
  FFormat:= PCMFormat;
  FActive:= False;
  FWaveID:= nil;
  FDataSize:= 0;
  FRecBufferSize:= 4;
  FChannels:= 2;
  FMp3Mode:= STEREO;
  FMp3BitRate:= 128;
  FMp3MaxBitRate:= 320;
  FMp3CRC:= True;
  FMp3VBRQuality:= v4 ;
end;

destructor TAudioRecord.Destroy;
begin
  Close;
  FHeaderList.Free;
  Ebs.Free;
  DeallocateHWND(FHandle);
  inherited Destroy;
end;

procedure TAudioRecord.WndProc(var Message: TMessage);
begin
  if Message.Msg = WM_QUERYENDSESSION then Message.Result := 1 else
  try
    Dispatch(Message);
  except
    Application.HandleException(Self);
  end;
end;

procedure TAudioRecord.MakeWaveFormat(var Format: TWaveFormatEx; Channels, SamplesPerSec, BitsperSample: DWORD);
begin
  with Format do begin
    wFormatTag:= 1;
    nChannels:= Channels;
    nSamplesPerSec:= SamplesPerSec;
    wBitsperSample:= BitsperSample;
    nBlockAlign:= nChannels * (wBitsperSample div 8);
    nAvgBytesPerSec:= nBlockAlign * nSamplesPerSec;
    cbSize:= 0;
  end;
end;

function GetLen(S: string): Integer;
var
  Len: Integer;
begin
  Result:= 1;
  Len:= Length(S);
  while not (S[Result] = #0) and (Result < Len) do Inc(Result);
end;

procedure FreePointer(var P: Pointer);
begin
  FreeMem(P);
  P:= nil;
end;


function TAudioRecord.GetBitsperSample: TBitsperSample;
begin
  Result:= bs8Bit;
  if FFormat.wBitsPerSample = BitsPerSampleValue[bs16Bit] then Result:= bs16Bit;
end;

function TAudioRecord.GetSamplesPerSec: TSamplesPerSec;
begin
  Result:= s11K;
  while FFormat.nSamplesPerSec <> SamplesPerSecValue[Result] do Inc(Result);
end;

procedure TAudioRecord.SetBitsperSample(const Value: TBitsperSample);
begin
  if RecBitsPerSample = Value then Exit;
  MakeWaveFormat(FFormat, FChannels,SamplesPerSecValue[RecSamplesPerSec], BitsPerSampleValue[Value]);
end;

procedure TAudioRecord.SetChannels(const Value: LMODE);
begin
  if FMp3Mode = Value then Exit;
  case Value of
    STEREO      : FChannels:= 2;
    JSTEREO     : FChannels:= 2;
    DUALCHANNEL : FChannels:= 2;
    MONO        : FChannels:= 1;
  end;
  FMp3Mode:= Value;
  MakeWaveFormat(FFormat, FChannels, SamplesPerSecValue[RecSamplesPerSec],BitsPerSampleValue[RecBitsPerSample]);
end;

procedure TAudioRecord.SetSamplesPerSec(const Value: TSamplesPerSec);
begin
  if RecSamplesPerSec = Value then Exit;
  MakeWaveFormat(FFormat, FChannels,SamplesPerSecValue[Value], BitsPerSampleValue[RecBitsPerSample]);
end;

procedure TAudioRecord.SetRecBufferSize(const Value: Integer);
begin
  if Value > 8 then FRecBufferSize:= 8 else FRecBufferSize:= Value;
end;

procedure TAudioRecord.SetMp3Enc;
begin
  vConfig.Format.dwConfig:=BE_CONFIG_LAME;
  with vConfig.Format.LHV1 do begin
    dwStructVersion :=1;
    dwStructSize    :=SizeOf(vConfig);
    dwSampleRate    :=SamplesPerSecValue[RecSamplesPerSec];
    dwReSampleRate  :=dwSampleRate;
    nMode    :=DWORD(FMp3Mode);
    dwBitRate       :=FMp3BitRate;
    dwMaxBitRate    :=FMp3MaxBitRate;
    nQuality        :=DWORD(FMp3Quality);
    dwMpegVersion   :=0;
    dwPsyModel      :=0;
    dwEmphasis      :=0;
    bCRC    :=FMp3CRC;
    bPrivate        :=FMp3Private;
    bCopyright      :=FMp3Copyright;
    bOriginal       :=FMp3Original;
    bWriteVBRHeader :=FMp3WriteVBRHeader;
    bEnableVBR      :=FMp3EnableVBR;
    nVBRQuality     :=DWORD(FMp3VBRQuality);
  end;
  FMp3BlockAlign:= FFormat.nBlockAlign;
  beInit;
end;

procedure TAudioRecord.SetMp3BitRate(const Value: LBITRATE);
begin
  case Value of
    b32: FMp3BitRate:= 32;
    b48: FMp3BitRate:= 48;
    b64: FMp3BitRate:= 64;
    b96: FMp3BitRate:= 96;
    b128: FMp3BitRate:= 128;
    b160: FMp3BitRate:= 160;
    b192: FMp3BitRate:= 192;
    b224: FMp3BitRate:= 224;
    b256: FMp3BitRate:= 256;
    b320: FMp3BitRate:= 320;
  end;
end;

function TAudioRecord.GetMp3BitRate: LBITRATE;
begin
  case FMp3BitRate of
    32: Result:= b32;
    48: Result:= b48;
    64: Result:= b64;
    96: Result:= b96;
    128: Result:= b128;
    160: Result:= b160;
    192: Result:= b192;
    224: Result:= b224;
    256: Result:= b256;
    320: Result:= b320;
  end;
end;

procedure TAudioRecord.SetMp3MaxBitRate(const Value: LMAXBITRATE);
begin
  case Value of
    m160: FMp3MaxBitRate:= 160;
    m192: FMp3MaxBitRate:= 192;
    m224: FMp3MaxBitRate:= 224;
    m256: FMp3MaxBitRate:= 256;
    m320: FMp3MaxBitRate:= 320;
  end;
end;

function TAudioRecord.GetMp3MaxBitRate: LMAXBITRATE;
begin
  case FMp3MaxBitRate of
    160: Result:= m160;
    192: Result:= m192;
    224: Result:= m224;
    256: Result:= m256;
    320: Result:= m320;
  end;
end;

procedure TAudioRecord.SetEncBufferSize(const Value: Integer);
begin
  if Value > 5 then FEncBufferSize:= 5 else FEncBufferSize:=Value;
end;

procedure TAudioRecord.AddBuffer(Header: PWaveHdr);
begin
  if FHeaderList.IndexOf(Header) = -1 then begin
    FHeaderList.Add(Header);
  end;
end;

procedure TAudioRecord.DeleteBuffer(var Header: PWaveHdr);
begin
  if FHeaderList.IndexOf(Header) <> -1 then begin
    FHeaderList.Delete(FHeaderList.IndexOf(Header));
    FreePointer(Pointer(Header^.lpData));
    FreePointer(Pointer(Header));
  end;
end;

procedure TAudioRecord.AddPrepareBuffer;
var
  Data: Pointer;
  Header: PWaveHdr;
begin
  GetMem(Data, FDataSize);
  GetMem(Header, SizeOf(TWaveHdr));
  with Header^ do begin
    lpData:= Data;
    dwBufferLength:= FDataSize;
    dwBytesRecorded:= 0;
    dwUser:= 0;
    dwFlags:= 0;
    dwLoops:= 0;
  end;
  AddBuffer(Header);
  WaveInPrepareHeader(FWaveID^, Header, SizeOf(TWaveHdr));
  WaveInAddBuffer(FWaveID^, Header, SizeOf(TWaveHdr));
end;

procedure TAudioRecord.FreeHeaderBuffer;
var
  I: Integer;
begin
  for I:= 0 to FHeaderList.Count - 1 do begin
    WaveInUnPrepareHeader(FWaveID^, FHeaderList[I], SizeOf(TWavehdr));
    FreeMem(PWaveHdr(FHeaderList[I])^.lpData);
    FreeMem(FHeaderList[I]);
  end;
  FHeaderList.Clear;
end;

procedure TAudioRecord.Open;
var
  I: Integer;
begin
  Ebc:= 0;
  if Not FActive and Not Assigned(FWaveID) then begin
    case FOutType of
      WAVFileStream: begin
        if FileExists(FFileName+'.wav') then if Application.MessageBox('目标文件已经存在，要覆盖吗？',Pchar(Application.Title),mb_yesno+mb_iconquestion) <> 6 then exit;
        Ofs:= TFileStream.Create(FFileName+'.wav', fmCreate);
        InitWavFile(Ofs)
      end;
      Mp3Buffer: SetMp3Enc;
      Mp3MemoryStream: begin
        Oms:= TMemoryStream.Create;
        SetMp3Enc;
      end;
      Mp3FileStream: begin
        if FileExists(FFileName+'.Mp3') then if Application.MessageBox('目标文件已经存在，要覆盖吗？',Pchar(Application.Title),mb_yesno+mb_iconquestion) <> 6 then exit;
        Ofs:= TFileStream.Create(FFileName+'.Mp3', fmCreate);
        SetMp3Enc;
      end;
    end;
    try
      FDataSize:= FFormat.nAvgBytesPerSec;
      GetMem(FWaveID,sizeof(HWaveIn));
      WaveInOpen(FWaveID, 0, @FFormat, Handle, 0, CALLBACK_WINDOW or WAVE_MAPPED);
      for I:= 1 to FRecBufferSize do AddPrepareBuffer;
      WaveInStart(FWaveID^);
      FActive:= true;
    except
      Close;
      raise;
    end;
  end;
end;

procedure TAudioRecord.Close;
begin
  if FActive and Assigned(FWaveID) then begin
    try
      WaveInStop(FWaveID^);
      WaveInReset(FWaveID^);
      WaveInClose(FWaveID^);
    finally
      FreeHeaderBuffer;
      FreePointer(Pointer(FWaveID));
      FActive:= False;
      FPause:= False;
      case FOutType of
        WAVFileStream: begin
          DeInitWavFile(Ofs);
          Ofs.Free;
        end;
        Mp3Buffer: beDeinit;
        Mp3MemoryStream: begin
          Ebs.SetSize(Ebs.Position);
          Ebs.Seek(0,0);
          beEnc(Ebs,Oms);
          beDeinit(Oms);
          FOnData(Oms, Oms.Size);
          Oms.Free;
        end;
        Mp3FileStream: begin
          Ebs.SetSize(Ebs.Position);
          Ebs.Seek(0,0);
          beEnc(Ebs,Ofs);
          beDeinit(Ofs);
          FOnData(Nil, Ofs.Size);
          Ofs.Free;
        end;
      end;
    end;
  end;
end;

procedure TAudioRecord.waveInCallback(var msg: TMessage);
var
  Header: PWaveHdr;
begin
  Header:= PWaveHdr(msg.lparam);
  if FActive then begin
    WaveInUnPrepareHeader(FWaveID^, Header, SizeOf(TWavehdr));
    with Header^ do begin
      DoDataEvent(lpData, dwBytesRecorded);
      FillMemory(lpData, FDataSize, 0);
      dwBufferLength:= FDataSize;
      dwBytesRecorded:= 0;
      dwUser:= 0;
      dwFlags:= 0;
      dwLoops:= 0;
    end;
    WaveInPrepareHeader(FWaveID^, Header, SizeOf(TWavehdr));
    WaveInAddBuffer(FWaveID^, Header, SizeOf(TWaveHdr));
  end
  else DeleteBuffer(Header);
end;

procedure TAudioRecord.DoDataEvent(Data: Pointer; Count: Integer);
begin
  if Assigned(FOnData) then begin
    case FOutType of
      WAVBuffer: FOnData(Data, Count);
      WAVFileStream: begin
        Ofs.Write(Data^, Count);
        FOnData(Nil, Ofs.Size);
      end;
      Mp3Buffer: begin
        beEnc(Data, Count);
        FOnData(Data, Count);
      end;
      Mp3MemoryStream: begin
        if FEncBufferSize <> 0 then begin
          if Ebc <= FEncBufferSize then Ebs.Write(Data^,Count);
          Inc(Ebc);
          if Ebc > FEncBufferSize then begin
            Ebc:= 0;
            Ebs.Seek(0,0);
            beEnc(Ebs,Oms);
            Ebs.Seek(0,0);
          end;
        end
        else beEnc(Data, Count, Oms);
        FOnData(Oms, Oms.Size);
      end;
      Mp3FileStream: begin
        if FEncBufferSize <> 0 then begin
          if Ebc <= FEncBufferSize then Ebs.Write(Data^,Count);
          Inc(Ebc);
          if Ebc > FEncBufferSize then begin
            Ebc:= 0;
            Ebs.Seek(0,0);
            beEnc(Ebs,Ofs);
            Ebs.Seek(0,0);
          end;
        end
        else beEnc(Data, Count, Ofs);
        FOnData(Nil, Ofs.Size);
      end;
    end;
  end;
end;

procedure TAudioRecord.Continue;
begin
  if FActive and FPause then begin
    WaveInStart(FWaveID^);
    FPause:= False;
  end;
end;

procedure TAudioRecord.Pause;
begin
  if FActive and Not FPause then begin
    WaveInStop(FWaveID^);
    FPause:= True;
  end;
end;

function TAudioRecord.InitWavFile(var Fs: TFileStream): Integer;
var
  Temp:string;
begin
  Result:=0;
  try
    Temp:='RIFF';
    Fs.Write(Temp[1],Length(Temp));
    Temp:=#0#0#0#0;
    Fs.Write(Temp[1],Length(Temp));
    Temp:='WAVE';
    Fs.Write(Temp[1],Length(Temp));
    Temp:='fmt ';
    Fs.Write(Temp[1],Length(Temp));
    Temp:=#$10#0#0#0;
    Fs.Write(Temp[1],Length(Temp));
    Temp:=#1#0;
    Fs.Write(Temp[1],Length(Temp));
    Fs.Write(FFormat.nChannels,2);
    fs.Write(FFormat.nSamplesPerSec,2);
    Temp:=#0#0;
    Fs.Write(Temp[1],Length(Temp));
    FS.Write(FFormat.nAvgBytesPerSec,4);
    FS.Write(FFormat.nBlockAlign,2);
    Fs.Write(FFormat.wBitsPerSample,2);
    Temp:='data';
    Fs.write(Temp[1],Length(Temp));
    Temp:=#0#0#0#0;
    Fs.write(Temp[1],Length(Temp));
  except
    Result:=1;
  end;
end;

function TAudioRecord.DeInitWavFile(var Fs: TFileStream): Integer;
var
  i: Integer;
begin
  Result:=0;
  try
    i:=Fs.Size;
    Fs.Seek(4,sobeginning);
    Fs.Write(i,4);
    Fs.Seek(40,sobeginning);
    i:=Fs.Size-44;
    Fs.Write(i,4);
  except
    Result:=1;
  end;
end;

procedure Register;
begin
  RegisterComponents('Standard', [TAudioRecord]);
end;

end.

