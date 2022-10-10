object frmWordDicLogin: TfrmWordDicLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'WordDic Login'
  ClientHeight = 477
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object dxBevel1: TdxBevel
    Left = 8
    Top = 8
    Width = 399
    Height = 89
  end
  object dxBevel2: TdxBevel
    Left = 0
    Top = 439
    Width = 418
    Height = 38
    Align = alBottom
    ExplicitLeft = -8
  end
  object cxLabel1: TcxLabel
    Left = 19
    Top = 27
    Caption = #47196#44536#51064' '#50500#51060#46356' :'
  end
  object cxTxt_UserId: TcxTextEdit
    Left = 131
    Top = 26
    TabOrder = 1
    Text = 'cxTxt_UserId'
    Width = 165
  end
  object cxLabel2: TcxLabel
    Left = 19
    Top = 64
    Caption = #47196#44536#51064' '#48708#48128#48264#54840' :'
  end
  object cxTxt_UserPwd: TcxTextEdit
    Left = 131
    Top = 62
    Properties.EchoMode = eemPassword
    TabOrder = 3
    Text = 'cxTxt_UserPwd'
    OnKeyDown = cxTxt_UserPwdKeyDown
    Width = 165
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 112
    Caption = 'Word Dic DB '#51217#49549' '#51221#48372
    TabOrder = 4
    Height = 321
    Width = 401
    object cxLabel3: TcxLabel
      Left = 16
      Top = 28
      Caption = 'DB '#51333#47448' :'
    end
    object cxCmb_DbmsType: TcxComboBox
      Left = 80
      Top = 27
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'SQLite'
        'MariaDB'
        'Postgresql'
        'Oracle')
      Properties.OnChange = cxCmb_DbmsTypePropertiesChange
      TabOrder = 1
      Text = 'SQLite'
      Width = 199
    end
    object cxPgCtl_DbmsType: TcxPageControl
      Left = 2
      Top = 64
      Width = 397
      Height = 255
      Align = alBottom
      TabOrder = 2
      Properties.ActivePage = cxTab_SQLite
      Properties.CustomButtons.Buttons = <>
      Properties.Images = frmMain.MainCxImglst_16
      OnChange = cxPgCtl_DbmsTypeChange
      ClientRectBottom = 255
      ClientRectRight = 397
      ClientRectTop = 25
      object cxTab_SQLite: TcxTabSheet
        Caption = 'SQLite'
        ImageIndex = 52
        object cxLabel4: TcxLabel
          Left = 9
          Top = 16
          Caption = 'Database : '
        end
        object cxBtEdit_SQLite: TcxButtonEdit
          Left = 85
          Top = 15
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxBtEdit_SQLitePropertiesButtonClick
          Style.Color = clMenu
          TabOrder = 1
          Text = 'cxBtEdit_SQLite'
          Width = 297
        end
        object cxVGrd_SQLite: TcxVerticalGrid
          Left = 0
          Top = 56
          Width = 397
          Height = 174
          Align = alBottom
          OptionsView.RowHeaderWidth = 148
          OptionsData.Editing = False
          TabOrder = 2
          OnKeyDown = cxVGrd_SQLiteKeyDown
          Version = 1
        end
      end
      object cxTab_MariaDb: TcxTabSheet
        Caption = 'MariaDB'
        ImageIndex = 51
      end
      object cxTab_PostgreSql: TcxTabSheet
        Caption = 'PostgreSQL'
        ImageIndex = 53
      end
      object cxTab_Oralce: TcxTabSheet
        Caption = 'Oracle'
        ImageIndex = 50
      end
    end
  end
  object cxBtn_Login: TcxButton
    Left = 178
    Top = 445
    Width = 75
    Height = 25
    Action = act_Login
    TabOrder = 5
  end
  object cxBtn_Close: TcxButton
    Left = 335
    Top = 445
    Width = 75
    Height = 25
    Action = act_Close
    TabOrder = 6
  end
  object cxBtn_Logout: TcxButton
    Left = 253
    Top = 445
    Width = 82
    Height = 25
    Action = act_Logout
    TabOrder = 7
  end
  object ActList_WordDicLogin: TActionList
    Images = frmMain.MainCxImglst_16
    Left = 330
    Top = 73
    object act_Login: TAction
      Caption = #47196#44536#51064
      ImageIndex = 11
      OnExecute = act_LoginExecute
    end
    object act_Logout: TAction
      Caption = #47196#44536#50500#50883
      ImageIndex = 12
    end
    object act_Close: TAction
      Caption = #45803#44592
      ImageIndex = 54
      OnExecute = act_CloseExecute
    end
  end
  object OpenDlg_SQLiteDB: TOpenDialog
    Left = 224
    Top = 96
  end
end
