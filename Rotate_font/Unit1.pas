unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Spin;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
 Image1.Canvas.Font.Size := 10;
 Image1.Canvas.Font.Name := 'Tahoma';
 Image1.Canvas.TextOut(100,75,'Test ROTATE');
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
var
 LogFont: TLogFont;
 OldFont, NewFont: HFONT;
begin
 //we set the Image font handle properties to our Log font structure
 GetObject(Image1.Canvas.Font.Handle, SizeOf(LogFont), @LogFont);
 //now all we have to do is change the angle
 LogFont.lfEscapement:= SpinEdit1.Value * 10; //this does the rotation

 //create font handle
 NewFont := CreateFontIndirect(LogFont);
 //save old font handle and assign new font handle
 OldFont := SelectObject(Image1.Canvas.Handle,NewFont);
 //Print the text
 Image1.Canvas.FillRect(Image1.Canvas.ClipRect);
 Image1.Canvas.TextOut(100, 75, 'Test ROTATE');
 //restore old font handle and get the 'new' one
 NewFont := SelectObject(Image1.Canvas.Handle,OldFont);
 //delete our crearted fon handle
 DeleteObject(NewFont);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 SpinEdit1.Value := 90;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 SpinEdit1.Value := 0;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
 SpinEdit1.Value := ScrollBar1.Position;
end;

end.