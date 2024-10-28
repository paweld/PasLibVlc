{
   File generated automatically by Lazarus Package Manager

   fpmake.pp for PasLibVlcPlayer 3.0.7

   This file was generated on 10.08.2020
}

{$ifndef ALLPACKAGES} 
{$mode objfpc}{$H+}
program fpmake;

uses fpmkunit;
{$endif ALLPACKAGES}

procedure add_PasLibVlcPlayer(const ADirectory: string);

var
  P : TPackage;
  T : TTarget;

begin
  with Installer do
    begin
    P:=AddPackage('paslibvlcplayer');
    P.Version:='3.0.7';

    P.Directory:=ADirectory;

    P.Flags.Add('LazarusDsgnPkg');

    P.Dependencies.Add('lcl');
    P.Dependencies.Add('fcl');
    P.Options.Add('-MDelphi');
    P.Options.Add('-Scghi');
    P.Options.Add('-CX');
    P.Options.Add('-O4');
    P.Options.Add('-g');
    P.Options.Add('-gl');
    P.Options.Add('-gh');
    P.Options.Add('-Xg');
    P.Options.Add('-l');
    P.Options.Add('-vewnhibq');
    P.Options.Add('-dLCL');
    P.Options.Add('-dLCL$(LCLWidgetType)');
    P.UnitPath.Add('../source');
    P.UnitPath.Add('../source.vcl');
    P.UnitPath.Add('.');
    T:=P.Targets.AddUnit('PasLibVlcPlayer.pas');
    t.Dependencies.AddUnit('PasLibVlcUnit');
    t.Dependencies.AddUnit('PasLibVlcPlayerUnit');

    T:=P.Targets.AddUnit('..\source\PasLibVlcUnit.pas');
    T:=P.Targets.AddUnit('..\source.vcl\PasLibVlcPlayerUnit.pas');

    // copy the compiled file, so the IDE knows how the package was compiled
    P.InstallFiles.Add('PasLibVlcPlayer.compiled',AllOSes,'$(unitinstalldir)');

    end;
end;

{$ifndef ALLPACKAGES}
begin
  add_PasLibVlcPlayer('');
  Installer.Run;
end.
{$endif ALLPACKAGES}
