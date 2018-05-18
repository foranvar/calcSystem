unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }
function eightToTen(number:integer; var str:string):integer;
var numberTen, i, Eight:integer;
begin
     numberTen:=0;
     Eight:=1;
     for i:=1 to length(str) do begin
            numberTen:=numberTen + (number mod 10) * Eight;
            number:=number div 10;
            Eight:=8 * Eight;
     end;
     eightToTen:=numberTen;
end;

function tenToEight(decimal:word;bin_oct:byte):string;
begin
     while decimal > 0 do begin
           tenToEight := chr(ord('0') + (decimal mod bin_oct)) + tenToEight;
           decimal := decimal div bin_oct
     end;
end;
function twoToTen(number: integer; var str:string):integer;
var numberTen, i, Two:integer;
begin
     numberTen:=0;
     Two:=1;
     for i:=1 to length(str) do begin
           numberTen:=numberTen + (number mod 10) * Two;
           number:= number div 10;
           Two:=2 * Two;
     end;
     twoToTen:=numberTen;
end;
function sixteenth(symbol:char):integer;
begin
     case symbol of
          '0': sixteenth:=0;
          '1': sixteenth:=1;
          '2': sixteenth:=2;
          '3': sixteenth:=3;
          '4': sixteenth:=4;
          '5': sixteenth:=5;
          '6': sixteenth:=6;
          '7': sixteenth:=7;
          '8': sixteenth:=8;
          '9': sixteenth:=9;
          'A': sixteenth:=10;
          'B': sixteenth:=11;
          'C': sixteenth:=12;
          'D': sixteenth:=13;
          'E': sixteenth:=14;
          'F': sixteenth:=15;
     end;
end;

function sixteenthToTen(number:string):integer;
var numberTen, SixteenthVal, i: integer;
begin
     numberTen:=0;
     SixteenthVal:=1;
     for i:=length(number) downto 1 do begin
           numberTen:=numberTen + sixteenth(number[i]) * SixteenthVal;
           SixteenthVal:=16 * SixteenthVal;
     end;
     sixteenthToTen:=numberTen;
end;

//из 10,2,16 в 8

procedure TForm2.Button1Click(Sender: TObject);
var numberOne, numberTwo, Eight: integer;
  str:string;
begin
     str:=edit1.text;
     numberOne:=eightToTen(strToInt(edit1.text), str);
     str:=edit2.text;
     numberTwo:=eightToTen(strToInt(edit2.text), str);
     case comboBox1.ItemIndex of
          0: edit3.text:=tenToEight(numberOne + numberTwo, 8);
          1: edit3.text:=tenToEight(numberOne - numberTwo, 8);
          2: edit3.text:=tenToEight(numberOne * numberTwo, 8);
          3: edit3.text:=tenToEight(numberOne div numberTwo, 8);
     end;
end;

procedure TForm2.Button2Click(Sender: TObject);
var value: integer;
  str: string;
begin
     str:=edit4.text;
     case comboBox2.itemIndex of
          0: begin
                  value:=strToInt(edit4.text);
                  edit5.text:=tenToEight(twoToTen(value, str), 8);
          end;
          1: begin
                  value:=strToInt(edit4.text);
                  edit5.text:=tenToEight(value, 8);
          end;
          2: edit5.text:=tenToEight(sixteenthToTen(str), 8);
     end;
end;

end.

