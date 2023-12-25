(*
 *******************************************************************************
 *
 * Copyright (c) 2020 Robert Jędrzejczyk
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *******************************************************************************
 *)

{$I ..\..\source\compiler.inc}

program DemoStreamVideo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils,
  PasLibVlcUnit in '..\..\source\PasLibVlcUnit.pas';

var
  p_li : libvlc_instance_t_ptr;

// https://www.videolan.org/doc/streaming-howto/en/ch04.html

// multiple port streaming
// #transcode{vcodec=mp4v,acodec=mpga,vb=800,ab=128,deinterlace}:duplicate{dst=display,dst=rtp{mux=ts,dst=239.255.12.42,sdp=sap://,name="TestStream"},dst=rtp{mux=ts,dst=192.168.1.2,port=50006}}
const
  media_name  : PAnsiChar = 'Video streaming test';
  media_input : PAnsiChar = '..\..\_testFiles\Maximize.mp4';
//  media_sout  : PAnsiChar = '#transcode{vcodec=h264,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:8090/maximize.mp4}';
//  media_sout  : PAnsiChar = '#transcode{vcodec=h264,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:8090/maximize.mp4,sfilter=marq{marquee="MARQUEE",x=10,y=10}}';
//  media_sout  : PAnsiChar = '#transcode{vcodec=h264,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100}:http{mux=ts,dst=:8090/maximize.mp4,sfilter=logo{file="..\..\logo1.png",position=10}}';
  media_sout  : PAnsiChar = '#transcode{vcodec=h264,vb=800,scale=1,acodec=mpga,ab=128,channels=2,samplerate=44100,sfilter={marq{marquee="MARQUEE",x=10,y=10}:logo{file="..\..\logo1.png",position=10}}}:http{mux=ts,dst=:8090/}';
//  media_sout  : PAnsiChar = '#transcode{vcodec=h264,vb=800,scale=2,acodec=mp3,ab=128,channels=2,samplerate=44100,sfilter={marq{marquee="MARQUEE",x=10,y=10}:logo{file="..\..\logo1.png",position=10}}}:rtp{mux=ts,dst=127.0.0.1,port=8090}';

begin
  {$IFDEF DELPHI2007_UP}
  ReportMemoryLeaksOnShutdown := TRUE;
  {$ENDIF}
  
  try
    libvlc_dynamic_dll_init();

    if (libvlc_dynamic_dll_error <> '') then
    begin
      raise Exception.Create(libvlc_dynamic_dll_error);
    end;

    with TArgcArgs.Create([
      libvlc_dynamic_dll_path,
      '--intf=dummy',
      '--ignore-config',
      '--quiet',
      '--no-video-title-show',
      '--no-video-on-top'
      // '--vout=vdummy',
      // '--aout=adummy'
    ]) do
    begin
      p_li := libvlc_new(ARGC, ARGS);
      Free;
    end;

    libvlc_vlm_add_broadcast(p_li, media_name, media_input, media_sout, 0, NIL, 1, 1);
    libvlc_vlm_play_media(p_li, media_name);

    Sleep(60 * 1000);

    libvlc_vlm_stop_media(p_li, media_name);
    libvlc_vlm_release(p_li);

    libvlc_dynamic_dll_done();

  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
