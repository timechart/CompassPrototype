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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Calibri'
    Font.Style = []
    Lines.Strings = (
      'Hi Jim'
      ''
      'Order to call the methods in:'
      ''
      'liss.hello << to make sure connection is working'
      'liss.getStudents'
      'liss.getTeachers'
      'liss.publishClasses'
      'liss.publishRooms'
      'liss.publishTimetable'
      'liss.publishClassMemberships'
      'liss.publishDailyDeltas (we do not use liss.publishDailyData)'
      ''
      '- Do not call them concurrently'
      '- If one errors, don'#39't call further ones'
      ''
      
        'Please don'#39't hesitate to give me a call or drop me an email if y' +
        'ou would like to discuss further.'
      ''
      'Regards'
      ''
      'Lucas'
      ''
      ''
      '')
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -80
    ExplicitTop = -23
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
      Top = 10
      Width = 244
      Height = 25
      Caption = 'Connect to Compass via Web Service'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
