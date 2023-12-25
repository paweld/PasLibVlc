{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit PasLibVlcPlayer; 

interface

uses
  PasLibVlcUnit, PasLibVlcPlayerUnit, LazarusPackageIntf;

implementation

procedure Register; 
begin
  RegisterUnit('PasLibVlcPlayerUnit', @PasLibVlcPlayerUnit.Register); 
end; 

initialization
  RegisterPackage('PasLibVlcPlayer', @Register); 
end.
