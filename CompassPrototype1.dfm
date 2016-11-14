object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Connect to Compass Webservice with Chilkat library'
  ClientHeight = 476
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 635
    Height = 435
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 13
      Top = 9
      Width = 244
      Height = 25
      Caption = 'Connect to Compass via Web Service'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
