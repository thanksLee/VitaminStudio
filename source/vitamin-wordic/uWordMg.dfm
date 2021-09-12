object frmWordMg: TfrmWordMg
  Left = 231
  Top = 30
  Caption = 'Word Manager Ver0.9.1'
  ClientHeight = 542
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 921
    Height = 41
    Cursor = crHandPoint
    AutoSize = True
    ButtonHeight = 37
    ButtonWidth = 67
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    Images = frmMain.imglst
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbn_Reload: TToolButton
      Tag = 1
      Left = 0
      Top = 0
      Hint = #45800#50612#47484' '#45796#49884' DB '#50640#49436' Reload '#54633#45768#45796'.'
      AutoSize = True
      Caption = #45796#49884#51069#44592
      ImageIndex = 43
      OnClick = tbn_ReloadClick
    end
    object ToolButton6: TToolButton
      Left = 59
      Top = 0
      Width = 7
      Caption = 'ToolButton6'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object tbn_WordInsert: TToolButton
      Tag = 2
      Left = 66
      Top = 0
      Hint = #45800#50612#46321#47197#51012' '#54624' '#49688' '#51080#49845#45768#45796'.'
      AutoSize = True
      Caption = #45800#50612#46321#47197
      ImageIndex = 72
      OnClick = tbn_WordInsertClick
    end
    object tbn_WordEdit: TToolButton
      Tag = 3
      Left = 125
      Top = 0
      Hint = #49440#53469#54620' '#45800#50612#47484' '#49688#51221' '#54633#45768#45796'.'
      Caption = #45800#50612#49688#51221
      ImageIndex = 70
      OnClick = tbn_WordInsertClick
    end
    object tbn_WordDel: TToolButton
      Tag = 4
      Left = 192
      Top = 0
      Hint = #49440#53469#54620' '#45800#50612#47484' '#49325#51228' '#54633#45768#45796'.'
      AutoSize = True
      Caption = #45800#50612#49325#51228
      ImageIndex = 71
      OnClick = tbn_WordDelClick
    end
    object ToolButton1: TToolButton
      Left = 251
      Top = 0
      Width = 7
      Caption = 'ToolButton1'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object tbn_Approval: TToolButton
      Tag = 5
      Left = 258
      Top = 0
      Hint = #48120#49849#51064#46108' '#45800#50612#47484' '#49849#51064#52376#47532' '#54633#45768#45796'.'
      AutoSize = True
      Caption = #49849#51064#45824#44592
      ImageIndex = 29
    end
    object ToolButton4: TToolButton
      Left = 317
      Top = 0
      Width = 7
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbn_DataSave: TToolButton
      Tag = 6
      Left = 324
      Top = 0
      Hint = #54788#51116' Data '#47484' Excel '#47196' '#45796#50868#47196#46300' '#48155#49845#45768#45796'.'
      AutoSize = True
      Caption = #45936#51060#53552#51200#51109
      ImageIndex = 54
      OnClick = tbn_DataSaveClick
    end
    object ToolButton7: TToolButton
      Left = 395
      Top = 0
      Width = 7
      Caption = 'ToolButton7'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object tbn_Close: TToolButton
      Tag = 7
      Left = 402
      Top = 0
      Hint = 'Word Manager '#47484' '#51333#47308' '#54633#45768#45796'.'
      AutoSize = True
      Caption = #45803#44592'(&X)'
      ImageIndex = 11
      OnClick = tbn_CloseClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 921
    Height = 27
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object sbtn_DataSearch: TSpeedButton
      Tag = 14
      Left = 529
      Top = 1
      Width = 27
      Height = 24
      Cursor = crHandPoint
      Hint = #45936#51060#53552' '#44160#49353#51012' '#49884#51089#54633#45768#45796'.'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
        FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
        FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
        FF0A444444444444444D444444444444444A444444444444444D}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtn_DataSearchClick
    end
    object Bevel1: TBevel
      Left = 202
      Top = 4
      Width = 10
      Height = 19
      Shape = bsLeftLine
    end
    object Bevel2: TBevel
      Left = 561
      Top = 4
      Width = 13
      Height = 19
      Shape = bsLeftLine
    end
    object cmb_SearchList: TComboBox
      Left = 267
      Top = 4
      Width = 112
      Height = 20
      Cursor = crHandPoint
      BevelOuter = bvRaised
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = clSilver
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ItemIndex = 0
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = #54620#44544#47749
      Items.Strings = (
        #54620#44544#47749
        #50689#47928#47749
        #50689#47928#50557#50612#47749)
    end
    object txt_DataSearch: TEdit
      Tag = 1
      Left = 382
      Top = 1
      Width = 146
      Height = 24
      Hint = #52286#51012' '#53580#51060#48660' '#47749#51012' '#51201#49845#45768#45796'.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentFont = False
      TabOrder = 1
      OnKeyDown = txt_DataSearchKeyDown
    end
    object chb_Count: TCheckBox
      Left = 566
      Top = 5
      Width = 127
      Height = 17
      Cursor = crHandPoint
      Hint = #52404#53356#49884' DB '#50640' '#48512#54616#47484' '#51460#49688' '#51080#49845#45768#45796'.'
      Caption = #44148#49688#48372#44592
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = chb_CountClick
    end
    object cmb_WordSort: TComboBox
      Left = 85
      Top = 4
      Width = 120
      Height = 20
      Cursor = crHandPoint
      BevelOuter = bvRaised
      Style = csDropDownList
      CharCase = ecUpperCase
      Color = clSilver
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = cmb_WordSortChange
    end
    object StaticText7: TStaticText
      Left = 6
      Top = 6
      Width = 75
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      Caption = #45800#50612#51333#47448' : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object StaticText1: TStaticText
      Left = 209
      Top = 6
      Width = 55
      Height = 16
      AutoSize = False
      BevelKind = bkFlat
      Caption = #44160' '#49353' :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object me_Clipboard: TMemo
    Left = 44
    Top = 330
    Width = 185
    Height = 233
    BevelKind = bkFlat
    BorderStyle = bsNone
    Ctl3D = False
    ImeName = 'Microsoft IME 2003'
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
    WordWrap = False
  end
  object shg_WordList: TCRDBGrid
    Left = 0
    Top = 68
    Width = 921
    Height = 474
    Align = alClient
    DataSource = dts_WordLst
    ImeName = 'Microsoft IME 2010'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = HANGEUL_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = []
    OnDrawColumnCell = shg_WordListDrawColumnCell
    OnDblClick = shg_WordListDblClick
    OnKeyDown = shg_WordListKeyDown
    OnMouseDown = shg_WordListMouseDown
    OnTitleClick = shg_WordListTitleClick
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #49692#48264
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #50689#47928#47749
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #50689#47928' '#50557#50612#47749
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #54620#44544#47749
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 184
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #46020#47700#51064#50668#48512
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 86
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #45800#50612#51333#47448
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #45800#50612#54805#53468
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #51221#51032
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 192
        Visible = True
      end>
  end
  object Qry_WordLst: TUniQuery
    Connection = frmMain.UniConn
    Left = 88
    Top = 264
  end
  object dts_WordLst: TUniDataSource
    DataSet = Qry_WordLst
    Left = 160
    Top = 248
  end
  object Qry_Dml: TUniQuery
    Connection = frmMain.UniConn
    Left = 128
    Top = 392
  end
end
