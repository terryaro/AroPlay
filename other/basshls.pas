{
  BASSHLS 2.4 Delphi unit
  Copyright (c) 2015-2019 Un4seen Developments Ltd.

  See the BASSHLS.CHM file for more detailed documentation
}

unit BassHLS;

interface

{$IFDEF MSWINDOWS}
uses BASS, Windows;
{$ELSE}
uses BASS;
{$ENDIF}

const
  // additional BASS_SetConfig options
  BASS_CONFIG_HLS_DOWNLOAD_TAGS	= $10900;
  BASS_CONFIG_HLS_BANDWIDTH		= $10901;
  BASS_CONFIG_HLS_DELAY			= $10902;

  // additional sync type
  BASS_SYNC_HLS_SEGMENT        = $10300;

  // additional tag types
  BASS_TAG_HLS_EXTINF          = $14000; // segment's EXTINF tag : UTF-8 string
  BASS_TAG_HLS_STREAMINF       = $14001; // EXT-X-STREAM-INF tag : UTF-8 string
  BASS_TAG_HLS_DATE            = $14002; // EXT-X-PROGRAM-DATE-TIME tag : UTF-8 string

  // additional BASS_StreamGetFilePosition mode
  BASS_FILEPOS_HLS_SEGMENT     = $10000; // segment sequence number

const
{$IFDEF MSWINDOWS}
  basshlsdll = 'basshls.dll';
{$ENDIF}
{$IFDEF LINUX}
  basshlsdll = 'libbasshls.so';
{$ENDIF}
{$IFDEF MACOS}
  basshlsdll = 'libbasshls.dylib';
{$ENDIF}

function BASS_HLS_StreamCreateFile(mem:BOOL; fl:pointer; offset,length:QWORD; flags:DWORD): HSTREAM; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF}; external basshlsdll;
function BASS_HLS_StreamCreateURL(url:PChar; flags:DWORD; proc:DOWNLOADPROC; user:Pointer): HSTREAM; {$IFDEF MSWINDOWS}stdcall{$ELSE}cdecl{$ENDIF}; external basshlsdll;

implementation

end.