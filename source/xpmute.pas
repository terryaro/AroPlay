unit xpmute;

interface

uses MMSystem, Dialogs;

Type TDeviceName = (Master, Microphone, WaveOut, Synth);

function  GetVolume(DN:TDeviceName) : Word ;
procedure SetVolume(DN:TDeviceName; Value:Word);
function  GetVolumeMute(DN:TDeviceName) : Boolean;
procedure  SetVolumeMute(DN:TDeviceName; Value:Boolean);

implementation

uses main;

//获取音量
function GetVolume(DN:TDeviceName) : Word;
var
 hMix: HMIXER;
 mxlc: MIXERLINECONTROLS;
 mxcd: TMIXERCONTROLDETAILS;
 vol: TMIXERCONTROLDETAILS_UNSIGNED;
 mxc: MIXERCONTROL;
 mxl: TMixerLine;
 intRet: Integer;
 nMixerDevs: Integer;
begin
 // Check if Mixer is available
 nMixerDevs := mixerGetNumDevs();
 if (nMixerDevs < 1) then
 begin
   Exit;
 end;

 // open the mixer
 intRet := mixerOpen(@hMix, 0, 0, 0, 0);
 if intRet = MMSYSERR_NOERROR then
 begin
   case DN of
     Master :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
     Microphone :
             mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE;
     WaveOut : mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT;
     Synth  :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER;
   end;
   mxl.cbStruct := SizeOf(mxl);

   // get line info
   intRet := mixerGetLineInfo(hMix, @mxl, MIXER_GETLINEINFOF_COMPONENTTYPE);

   if intRet = MMSYSERR_NOERROR then
   begin
     FillChar(mxlc, SizeOf(mxlc),0);
     mxlc.cbStruct := SizeOf(mxlc);
     mxlc.dwLineID := mxl.dwLineID;
     mxlc.dwControlType := MIXERCONTROL_CONTROLTYPE_VOLUME;
     mxlc.cControls := 1;
     mxlc.cbmxctrl := SizeOf(mxc);

     mxlc.pamxctrl := @mxc;
     intRet := mixerGetLineControls(hMix, @mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE);

     if intRet = MMSYSERR_NOERROR then
     begin
       FillChar(mxcd, SizeOf(mxcd),0);
       mxcd.dwControlID := mxc.dwControlID;
       mxcd.cbStruct := SizeOf(mxcd);
       mxcd.cMultipleItems := 0;
       mxcd.cbDetails := SizeOf(Vol);
       mxcd.paDetails := @vol;
       mxcd.cChannels := 1;

       intRet := mixerGetControlDetails(hMix, @mxcd,MIXER_SETCONTROLDETAILSF_VALUE);

       Result := vol.dwValue ;

       if intRet <> MMSYSERR_NOERROR then
         ShowMessage('GetControlDetails Error');
     end
     else
       ShowMessage('GetLineInfo Error');
   end;
   intRet := mixerClose(hMix);
 end;
end;

//设置音量
procedure setVolume(DN:TDeviceName; Value : Word);
var
 hMix: HMIXER;
 mxlc: MIXERLINECONTROLS;
 mxcd: TMIXERCONTROLDETAILS;
 vol: TMIXERCONTROLDETAILS_UNSIGNED;
 mxc: MIXERCONTROL;
 mxl: TMixerLine;
 intRet: Integer;
 nMixerDevs: Integer;
begin
 // Check if Mixer is available
 nMixerDevs := mixerGetNumDevs();
 if (nMixerDevs < 1) then
 begin
   Exit;
 end;

 // open the mixer
 intRet := mixerOpen(@hMix, 0, 0, 0, 0);
 if intRet = MMSYSERR_NOERROR then
 begin
   case DN of
     Master :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
     Microphone :
             mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE;
     WaveOut : mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT;
     Synth  :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER;
   end;
   mxl.cbStruct := SizeOf(mxl);

   // get line info
   intRet := mixerGetLineInfo(hMix, @mxl, MIXER_GETLINEINFOF_COMPONENTTYPE);

   if intRet = MMSYSERR_NOERROR then
   begin
     FillChar(mxlc, SizeOf(mxlc),0);
     mxlc.cbStruct := SizeOf(mxlc);
     mxlc.dwLineID := mxl.dwLineID;
     mxlc.dwControlType := MIXERCONTROL_CONTROLTYPE_VOLUME;
     mxlc.cControls := 1;
     mxlc.cbmxctrl := SizeOf(mxc);

     mxlc.pamxctrl := @mxc;
     intRet := mixerGetLineControls(hMix, @mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE);

     if intRet = MMSYSERR_NOERROR then
     begin
       FillChar(mxcd, SizeOf(mxcd),0);
       mxcd.dwControlID := mxc.dwControlID;
       mxcd.cbStruct := SizeOf(mxcd);
       mxcd.cMultipleItems := 0;
       mxcd.cbDetails := SizeOf(Vol);
       mxcd.paDetails := @vol;
       mxcd.cChannels := 1;

       vol.dwValue := Value;

       intRet := mixerSetControlDetails(hMix, @mxcd,MIXER_SETCONTROLDETAILSF_VALUE);

       if intRet <> MMSYSERR_NOERROR then
         ShowMessage('SetControlDetails Error');
     end
     else
       ShowMessage('GetLineInfo Error');
   end;
   intRet := mixerClose(hMix);
 end;
end;

//获取静音
function  GetVolumeMute(DN:TDeviceName) : Boolean;
var
 hMix: HMIXER;
 mxlc: MIXERLINECONTROLS;
 mxcd: TMIXERCONTROLDETAILS;
 vol: TMIXERCONTROLDETAILS_UNSIGNED;
 mxc: MIXERCONTROL;
 mxl: TMixerLine;
 intRet: Integer;
 nMixerDevs: Integer;
 mcdMute: MIXERCONTROLDETAILS_BOOLEAN;
begin
 // Check if Mixer is available
 nMixerDevs := mixerGetNumDevs();
 if (nMixerDevs < 1) then
 begin
   Exit;
 end;

 // open the mixer
 intRet := mixerOpen(@hMix, 0, 0, 0, 0);
 if intRet = MMSYSERR_NOERROR then
 begin
   case DN of
     Master :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
     Microphone :
             mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE;
     WaveOut : mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT;
     Synth  :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER;
   end;
    mxl.cbStruct        := SizeOf(mxl);

   // mixerline info
   intRet := mixerGetLineInfo(hMix, @mxl, MIXER_GETLINEINFOF_COMPONENTTYPE);

   if intRet = MMSYSERR_NOERROR then
   begin
     FillChar(mxlc, SizeOf(mxlc),0);
     mxlc.cbStruct := SizeOf(mxlc);
     mxlc.dwLineID := mxl.dwLineID;
     mxlc.dwControlType := MIXERCONTROL_CONTROLTYPE_MUTE;
     mxlc.cControls := 1;
     mxlc.cbmxctrl := SizeOf(mxc);
     mxlc.pamxctrl := @mxc;

     // Get the mute control
     intRet := mixerGetLineControls(hMix, @mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE);

     if intRet = MMSYSERR_NOERROR then
     begin
       FillChar(mxcd, SizeOf(mxcd),0);
       mxcd.cbStruct := SizeOf(TMIXERCONTROLDETAILS);
       mxcd.dwControlID := mxc.dwControlID;
       mxcd.cChannels := 1;
       mxcd.cbDetails := SizeOf(MIXERCONTROLDETAILS_BOOLEAN);
       mxcd.paDetails := @mcdMute;

       // Get  mute
       intRet := mixerGetControlDetails(hMix, @mxcd, MIXER_SETCONTROLDETAILSF_VALUE);

       if mcdMute.fValue = 0 then Result:=false
       else Result := True;

       if intRet <> MMSYSERR_NOERROR then
         ShowMessage('SetControlDetails Error');
     end
     else
       ShowMessage('GetLineInfo Error');
   end;

   intRet := mixerClose(hMix);
 end;
end;

//设置静音
procedure  SetVolumeMute(DN:TDeviceName; Value:Boolean);
var
 hMix: HMIXER;
 mxlc: MIXERLINECONTROLS;
 mxcd: TMIXERCONTROLDETAILS;
 vol: TMIXERCONTROLDETAILS_UNSIGNED;
 mxc: MIXERCONTROL;
 mxl: TMixerLine;
 intRet: Integer;
 nMixerDevs: Integer;
 mcdMute: MIXERCONTROLDETAILS_BOOLEAN;
begin
 // Check if Mixer is available
 nMixerDevs := mixerGetNumDevs();
 if (nMixerDevs < 1) then
 begin
   Exit;
 end;

 // open the mixer
 intRet := mixerOpen(@hMix, 0, 0, 0, 0);
 if intRet = MMSYSERR_NOERROR then
 begin
   case DN of
     Master :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_DST_SPEAKERS;
     Microphone :
             mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE;
     WaveOut : mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT;
     Synth  :  mxl.dwComponentType := MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER;
   end;
    mxl.cbStruct        := SizeOf(mxl);

   // mixerline info
   intRet := mixerGetLineInfo(hMix, @mxl, MIXER_GETLINEINFOF_COMPONENTTYPE);

   if intRet = MMSYSERR_NOERROR then
   begin
     FillChar(mxlc, SizeOf(mxlc),0);
     mxlc.cbStruct := SizeOf(mxlc);
     mxlc.dwLineID := mxl.dwLineID;
     mxlc.dwControlType := MIXERCONTROL_CONTROLTYPE_MUTE;
     mxlc.cControls := 1;
     mxlc.cbmxctrl := SizeOf(mxc);
     mxlc.pamxctrl := @mxc;

     // Get the mute control
     intRet := mixerGetLineControls(hMix, @mxlc, MIXER_GETLINECONTROLSF_ONEBYTYPE);

     if intRet = MMSYSERR_NOERROR then
     begin
       FillChar(mxcd, SizeOf(mxcd),0);
       mxcd.cbStruct := SizeOf(TMIXERCONTROLDETAILS);
       mxcd.dwControlID := mxc.dwControlID;
       mxcd.cChannels := 1;
       mxcd.cbDetails := SizeOf(MIXERCONTROLDETAILS_BOOLEAN);
       mxcd.paDetails := @mcdMute;

       // Set and UnSet  mute
       mcdMute.fValue := Ord(Value);
       intRet := mixerSetControlDetails(hMix, @mxcd, MIXER_SETCONTROLDETAILSF_VALUE);

       if intRet <> MMSYSERR_NOERROR then
         ShowMessage('SetControlDetails Error');
     end
     else
       ShowMessage('GetLineInfo Error');
   end;

   intRet := mixerClose(hMix);
 end;
end;

end.
