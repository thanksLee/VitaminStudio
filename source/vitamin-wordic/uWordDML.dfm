object frmWordDML: TfrmWordDML
  Left = 277
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmWordDML'
  ClientHeight = 373
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 292
    Height = 332
    Align = alLeft
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'St_Word'
      object gb_Word: TGroupBox
        Left = 0
        Top = 0
        Width = 289
        Height = 332
        Align = alLeft
        Caption = #54364#51456#50612' '#51221#48372
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Bevel3: TBevel
          Left = 2
          Top = 294
          Width = 285
          Height = 36
          Align = alBottom
        end
        object sbtn_WordSave: TSpeedButton
          Tag = 105
          Left = 171
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #45800#50612#47484' '#51200#51109#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000008000
            0000008000008080000000008000800080000080800080808000C0C0C000FF00
            000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
            8888888800008888888888888888888800008888888888888888888800008888
            00000000000008880000888066000000FF0608880000888066000000FF060888
            0000888066000000FF0608880000888066000000000608880000888066666666
            666608880000888066000000006608880000888060FFFFFFFF06088800008880
            60FFFFFFFF0608880000888060FFFFFFFF0608880000888060FFFFFFFF060888
            0000888060FFFFFFFF0008880000888060FFFFFFFF0F08880000888000000000
            0000088800008888888888888888888800008888888888888888888800008888
            88888888888888880000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordSaveClick
        end
        object sbtn_DelWord: TSpeedButton
          Tag = 103
          Left = 94
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #46321#47197#46108' '#45800#50612#47484' '#49325#51228#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAAD77777777777777D000000000000007A0FBFBFBFB00FB0770BFBFBFBF08
            0F0710FBFBFBFB0B800711BFBF71BF000007717BF717FBFBFB07D117B11FBFBF
            BF07A71111FBFBFBFB07D7111FBFBFBFBF07711117000000000D117A117ADADA
            DADAADADA117ADADADADDADADA117ADADADAADADADADADADADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_DelWordClick
        end
        object sbtn_NewWord: TSpeedButton
          Tag = 101
          Left = 57
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #49352#47196#50868' '#45800#50612#47484' '#52628#44032#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
            0F07A0FBFBFBFB0B8007D0BFBFBFBF000007F0F7BFBFBBFBFB077BB7FB7BFFBF
            BF07A7F7B7BFBBFBFB07777F7FBFBFBFBF07FB7BF7777000000DD7B7B7BADADA
            DADA7BA7FD7BADADADADBAD7BAD7DADADADAADA7FDADADADADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_NewWordClick
        end
        object sbtn_WordClear: TSpeedButton
          Tag = 104
          Left = 134
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #54200#51665#51473#51064' '#45236#50857#51012' Clear '#54633#45768#45796
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAADADADA0ADADADADDADADA000ADADADA000DADA0ADAD000D00DADAD0DADA
            D00A0D0DADA0ADAD0D0DDAD0DAD0DAD0DADAADAD0DA0AD0DADADDADADADADADA
            DADAADAD00000DADADADDAD0888800DADADAADAD0888080DADADDADAD0FFF070
            DADAADADAD0FFF080DADDADADAD0FFF00ADAADADADAD0000ADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordClearClick
        end
        object sbtn_NewSynWord: TSpeedButton
          Tag = 100
          Left = 247
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #51060#51020#46041#51032#50612#47484' '#54200#51665' '#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAADA1A4ADADADADADDA11D4DADADADADAA111A4ADADADADAD1111D4DADADA
            DADAA111A4ADADADADADDA11D0000000DADAADA1A0FFFFF0ADADDADAD0F777F0
            DADAADADA0FFFFF0ADADDADAD0F777F0DADAADADA0FFFFF0ADADDADAD0FF0000
            0000ADADA0000FBFBFB0DADADADA0BFBFBF0ADADADAD00000000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_NewSynWordClick
        end
        object sbtn_WordCancel: TSpeedButton
          Tag = 106
          Left = 208
          Top = 299
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #54200#51665#51012' '#52712#49548' '#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
            03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
            030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
            F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
            010101F8030303030303030303F8FF030303030303FFF8030303030303030303
            030101010101F80303030303030303030303F8FF0303030303F8030303030303
            0303030303F901010101F8030303030303030303030303F8FF030303F8030303
            0303030303030303F90101010101F8030303030303030303030303F803030303
            F8FF030303030303030303F9010101F8010101F803030303030303030303F803
            03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
            03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
            0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordCancelClick
        end
        object pan_WordControl: TPanel
          Left = 2
          Top = 14
          Width = 285
          Height = 280
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object StaticText9: TStaticText
            Left = 5
            Top = 37
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #50689'  '#47928'  '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object txt_EFWord: TEdit
            Tag = 101
            Left = 96
            Top = 34
            Width = 185
            Height = 20
            Hint = #50689#47928#45800#50612#47484' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeMode = imSAlpha
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 50
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object StaticText1: TStaticText
            Left = 5
            Top = 63
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #50689#47928#50557#50612' '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
          end
          object txt_ESWord: TEdit
            Tag = 102
            Left = 96
            Top = 60
            Width = 185
            Height = 20
            Hint = #50689#47928#50557#50612#47749#51012' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeMode = imSAlpha
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 20
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object StaticText2: TStaticText
            Left = 6
            Top = 137
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #51221'      '#51032
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
          end
          object mem_Memo: TMemo
            Tag = 106
            Left = 5
            Top = 159
            Width = 277
            Height = 116
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            MaxLength = 1000
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object StaticText3: TStaticText
            Left = 6
            Top = 10
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #54620'  '#44544'  '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
          end
          object txt_HFWord: TEdit
            Tag = 103
            Left = 96
            Top = 8
            Width = 185
            Height = 20
            Hint = #54620#44544#47749#51012' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeMode = imSHanguel
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 50
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object StaticText4: TStaticText
            Left = 6
            Top = 87
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #45800' '#50612' '#51333' '#47448
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
          end
          object StaticText5: TStaticText
            Left = 6
            Top = 113
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #45800' '#50612' '#54805' '#53468
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
          end
          object cmb_Wordform: TComboBox
            Tag = 105
            Left = 96
            Top = 111
            Width = 185
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
            TabOrder = 5
          end
          object cmb_WordSort: TComboBox
            Tag = 103
            Left = 96
            Top = 85
            Width = 185
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
            TabOrder = 4
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'not_St_Word'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 290
        Height = 332
        Align = alLeft
        Caption = #51060#51020#46041#51032#50612' '#51221#48372
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Bevel1: TBevel
          Left = 2
          Top = 294
          Width = 286
          Height = 36
          Align = alBottom
          ParentShowHint = False
          ShowHint = True
        end
        object sbtn_SynWordSave: TSpeedButton
          Tag = 204
          Left = 170
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #46041#51020#51060#51032#50612#47484' '#51200#51109#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000000000000000000008000
            0000008000008080000000008000800080000080800080808000C0C0C000FF00
            000000FF0000FFFF00000000FF00FF00FF0000FFFF00FFFFFF00888888888888
            8888888800008888888888888888888800008888888888888888888800008888
            00000000000008880000888066000000FF0608880000888066000000FF060888
            0000888066000000FF0608880000888066000000000608880000888066666666
            666608880000888066000000006608880000888060FFFFFFFF06088800008880
            60FFFFFFFF0608880000888060FFFFFFFF0608880000888060FFFFFFFF060888
            0000888060FFFFFFFF0008880000888060FFFFFFFF0F08880000888000000000
            0000088800008888888888888888888800008888888888888888888800008888
            88888888888888880000}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_SynWordSaveClick
        end
        object sbtn_SynDelWord: TSpeedButton
          Tag = 202
          Left = 93
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #46321#47197#46108' '#46041#51020#51060#51032#50612#47484' '#49325#51228#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADA0A0A0A0A
            DADAADADADADAD00ADADDADA0000000B0ADAADAD0FFFFF0B0DADDADA0F99990B
            B0DAADAD0FFFFFF0B0ADDADA0F999990BB0AA1AD0FFFFFFF0000D11A0F99199F
            0110A717FF717FFF000DDA117711FF0007DAAD71111FFF0F0DADDA7111FFFF00
            DADAA711117F000DADADD117D117DADADADAADADAD117DADADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_DelWordClick
        end
        object sbtn_SynNewWord: TSpeedButton
          Tag = 201
          Left = 56
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #49352#47196#50868' '#46041#51020#51060#51032#50612#47484' '#52628#44032#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADA0A0A0A0A
            DADAADADADADAD00ADADDAD00000000B0ADAADA0FFFFFF0B0DADDAD0F999990B
            B0DAADA0FFFFFFF0B0ADDAD0F9999990BB0AADA0FFFFFFFF0000DAD0F999999F
            0110BDF7FFFFFFFF000D7BB7F979F0000ADAA7F7B7BFF0F0ADAD777F7FFFF00A
            DADAFB7BF77770ADADADD7B7B7BADADADADA7BA7FD7BADADADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_NewWordClick
        end
        object sbtn_WordNew: TSpeedButton
          Tag = 200
          Left = 247
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #54364#51456#45800#50612#47484' '#54200#51665' '#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADAD444444444444DADA477777777774ADAD488888888084
            DADA480080080004ADAD488888888000DADA4800800800B70DAD4888888880B8
            0ADA44444444440B70AD4F44F44F440B80DA444444444440B70DDADADADADAD0
            B70AADADADADADAD0050DADADADADADA0550ADADADADADADA00D}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordNewClick
        end
        object sbtn_SynWordClear: TSpeedButton
          Tag = 203
          Left = 133
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #54200#51665#51473#51064' '#45236#50857#51012' Clear '#54633#45768#45796
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAADADADA0ADADADADDADADA000ADADADA000DADA0ADAD000D00DADAD0DADA
            D00A0D0DADA0ADAD0D0DDAD0DAD0DAD0DADAADAD0DA0AD0DADADDADADADADADA
            DADAADAD00000DADADADDAD0888800DADADAADAD0888080DADADDADAD0FFF070
            DADAADADAD0FFF080DADDADADAD0FFF00ADAADADADAD0000ADAD}
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordClearClick
        end
        object sbtn_SynWordCancel: TSpeedButton
          Tag = 205
          Left = 207
          Top = 298
          Width = 37
          Height = 30
          Cursor = crHandPoint
          Hint = #54200#51665#51012' '#52712#49548#54633#45768#45796'.'
          Flat = True
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303F8F80303030303030303030303030303030303FF03030303030303030303
            0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
            03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
            030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
            FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
            030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
            F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
            010101F8030303030303030303F8FF030303030303FFF8030303030303030303
            030101010101F80303030303030303030303F8FF0303030303F8030303030303
            0303030303F901010101F8030303030303030303030303F8FF030303F8030303
            0303030303030303F90101010101F8030303030303030303030303F803030303
            F8FF030303030303030303F9010101F8010101F803030303030303030303F803
            03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
            03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
            03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
            0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
            030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
            03030303030303030303030303030303030303030303030303F8F8F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtn_WordCancelClick
        end
        object pan_SynControl: TPanel
          Left = 2
          Top = 14
          Width = 286
          Height = 280
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 0
          object StaticText11: TStaticText
            Left = 6
            Top = 60
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #54620'  '#44544'  '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object txt_SynHFWord: TEdit
            Tag = 203
            Left = 96
            Top = 58
            Width = 184
            Height = 20
            Hint = #54620#44544#47749#51012' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 50
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object cmb_SynWordSort: TComboBox
            Tag = 204
            Left = 96
            Top = 84
            Width = 184
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
            TabOrder = 4
            Items.Strings = (
              #50689#47928#47749
              #50689#47928#50557#50612
              #54620#44544#47749)
          end
          object StaticText12: TStaticText
            Left = 6
            Top = 86
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #45800' '#50612' '#51333' '#47448
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
          end
          object StaticText13: TStaticText
            Left = 6
            Top = 111
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #45800' '#50612' '#54805' '#53468
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
          end
          object cmb_SynWordForm: TComboBox
            Tag = 205
            Left = 96
            Top = 111
            Width = 184
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
            TabOrder = 5
            Items.Strings = (
              #50689#47928#47749
              #50689#47928#50557#50612
              #54620#44544#47749)
          end
          object StaticText6: TStaticText
            Left = 6
            Top = 133
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #51221'      '#51032
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
          end
          object mem_SynMemo: TMemo
            Tag = 206
            Left = 5
            Top = 156
            Width = 277
            Height = 117
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeName = 'Microsoft IME 2003'
            MaxLength = 1000
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object StaticText7: TStaticText
            Left = 5
            Top = 9
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #50689'  '#47928'  '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
          end
          object txt_SynEFWord: TEdit
            Tag = 201
            Left = 96
            Top = 7
            Width = 185
            Height = 20
            Hint = #50689#47928#45800#50612#47484' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeMode = imSAlpha
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 50
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 1
          end
          object StaticText8: TStaticText
            Left = 5
            Top = 34
            Width = 84
            Height = 16
            AutoSize = False
            BevelKind = bkFlat
            Caption = #50689#47928#50557#50612' '#47749
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
          end
          object txt_SynESWord: TEdit
            Tag = 202
            Left = 96
            Top = 33
            Width = 185
            Height = 20
            Hint = #50689#47928#50557#50612#47749#51012' '#51077#47141#54616#49464#50836'.'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ImeMode = imSAlpha
            ImeName = #54620#44397#50612'('#54620#44544') (MS-IME98)'
            MaxLength = 10
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 2
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 332
    Width = 850
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object sbtn_Close: TSpeedButton
      Tag = 300
      Left = 769
      Top = 3
      Width = 78
      Height = 35
      Cursor = crHandPoint
      Caption = #45803#44592'(&X)'
      Flat = True
      Glyph.Data = {
        56070000424D5607000000000000360400002800000028000000140000000100
        0800000000002003000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030707070707
        070707070707070707070707070703FFFFFFFFFFFFFFFFFFFFFFFF0303030303
        03FFF8F8F8F8F8F8F8F8F8F8F8F8FF07FF07FF07F8F8F8F8F8F8F8F8F8F8F8F8
        F8F8030303030303F8F8F8F8F8F8F8F8F8F8F8F8F80707FF07FF07F8F8F8F8F8
        F8F8F8F8F8F8F8F8F8FF030303FFFFF8F8F80404040404040000F8F8F8FFFFFF
        040404040404F8F8F8F8F8F8F8F8F8F8F8030303F8F8F8F8F803030303030304
        FD05000007FFFFFF0403030303030303030303F8FFF8F8F8FF030303F8FF0303
        030303030303030405FD0500FFFFFFFF0403030303030303030303F8F807F8F8
        FF030303F8FF03030303030303030304FD05FD00FFFFFFFF0403030303030303
        030303F8FFF807F8FF030303F8FF0303030303030303030405FD0500FFFEFFFE
        0403030303030303030303F8F807F8F8FF030303F8FF03030303030303030304
        FD05FD00FFFFFFFF0403030303030303030303F8FFF807F8FF030303F8FF0303
        030303030303030405FD0500FFFEFFFE0403030303030303030303F8F807F8F8
        FF030303F8FF03030303030303030304FD05FD00FFFFFFFF0403030303030303
        030303F8FFF807F8FF030303F8FF0303030303030303030405FD0500FFFEFFFE
        0403030303030303030303F8F807F8F8FF030303F8FF03030303030303030304
        FD05FD00FEFFFEFF0403030303030303030303F8FFF807F8FF030303F8FF0303
        030303030303030405FD0500FFFEFFFE0403030303030303030303F8F807F8F8
        FF030303F8FF03030303030303030304FD05FD00FEFFFEFF0403030303030303
        030303F8FFF8FFF8FFFFFFFFF8FF030303030303030303040404040404040404
        0403030303030303030303F8F8F8F8F8F8F8F8F8F80303030303030303030303
        03030303030303030303030303030303030303030303FFFFFFFFFFFF03030303
        0303030303030303030000000000000303030303030303030303030303F8F8F8
        F8F8F8FF0303030303030303030303030300FAFAFAFA00030303030303030303
        0303030303F8FFFFFFFFF8FF0303030303030303030303030300000000000003
        03030303030303030303030303F8F8F8F8F8F803030303030303}
      NumGlyphs = 2
      OnClick = sbtn_CloseClick
    end
  end
  object me_DMLClipboard: TMemo
    Left = 316
    Top = 68
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
  object schg_WordLst: TCRDBGrid
    Left = 292
    Top = 0
    Width = 558
    Height = 332
    Align = alClient
    DataSource = dst_WordLst
    ImeName = 'Microsoft IME 2010'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = HANGEUL_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #44404#47548#52404
    TitleFont.Style = []
    OnCellClick = schg_WordLstCellClick
    OnDrawColumnCell = schg_WordLstDrawColumnCell
    OnKeyDown = schg_WordLstKeyDown
    OnMouseDown = schg_WordLstMouseDown
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
        Width = 60
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
        Width = 125
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
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #50689#47928#50557#50612#47749
        Title.Font.Charset = HANGEUL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = #44404#47548#52404
        Title.Font.Style = [fsBold]
        Width = 104
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
        Width = 73
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
        Width = 78
        Visible = True
      end>
  end
  object oraQry_WordLst: TUniQuery
    Connection = frmMain.UniConn
    Left = 352
    Top = 104
  end
  object dst_WordLst: TUniDataSource
    DataSet = oraQry_WordLst
    Left = 520
    Top = 128
  end
end
