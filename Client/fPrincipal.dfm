object Form1: TForm1
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pHeader: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 113
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 624
    object pTitulo: TPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = -6
      ExplicitWidth = 768
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 800
        Height = 64
        Align = alClient
        Alignment = taCenter
        Caption = 'Montreal - TaskClient'
        Color = clWhitesmoke
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 135
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        ExplicitWidth = 203
        ExplicitHeight = 28
      end
    end
    object pMenu: TPanel
      Left = 0
      Top = 64
      Width = 800
      Height = 49
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 0
      ExplicitWidth = 768
      ExplicitHeight = 64
      object btAtualizar: TPanel
        Left = 555
        Top = 0
        Width = 245
        Height = 49
        Align = alClient
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 344
        ExplicitWidth = 213
        object botaoAtualizar: TLabel
          Left = 0
          Top = 0
          Width = 245
          Height = 49
          Align = alClient
          Alignment = taCenter
          Caption = 'Atualizar'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = botaoAtualizarClick
          ExplicitWidth = 49
          ExplicitHeight = 15
        end
      end
      object Panel1: TPanel
        Left = 370
        Top = 0
        Width = 185
        Height = 49
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 336
        object botaoEstatistica: TLabel
          Left = 0
          Top = 0
          Width = 185
          Height = 49
          Align = alClient
          Alignment = taCenter
          Caption = 'Estat'#237'sticas'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = botaoEstatisticaClick
          ExplicitWidth = 60
          ExplicitHeight = 15
        end
      end
      object Panel2: TPanel
        Left = 185
        Top = 0
        Width = 185
        Height = 49
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        ExplicitLeft = 336
        object botaoTarefas: TLabel
          Left = 0
          Top = 0
          Width = 185
          Height = 49
          Align = alClient
          Alignment = taCenter
          Caption = 'Minhas Tarefas'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = botaoTarefasClick
          ExplicitWidth = 82
          ExplicitHeight = 15
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 49
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        ExplicitLeft = 336
        object Label8: TLabel
          Left = 0
          Top = 0
          Width = 185
          Height = 49
          Align = alClient
          Alignment = taCenter
          Caption = 'Montreal - TaskClient'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 118
          ExplicitHeight = 15
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 113
    Width = 185
    Height = 387
    Align = alLeft
    BevelOuter = bvNone
    Color = clDimgray
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 583
    ExplicitTop = 119
    ExplicitHeight = 355
    object SkSvg1: TSkSvg
      Left = 40
      Top = 128
      Width = 97
      Height = 97
      Svg.GrayScale = True
      Svg.OverrideColor = x00000087
      Svg.Source = 
        '<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.or' +
        'g/Graphics/SVG/1.1/DTD/svg11.dtd">'#13#10#13#10'<!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Transformed by: SVG Repo Mixer Tools -->'#13#10'<sv' +
        'g fill="#FF000087" height="800px" width="800px" version="1.1" id' +
        '="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http:/' +
        '/www.w3.org/1999/xlink" viewBox="0 0 470.767 470.767" xml:space=' +
        '"preserve" stroke="#FF000087">'#13#10#13#10'<g id="SVGRepo_bgCarrier" stro' +
        'ke-width="0"/>'#13#10#13#10'<g id="SVGRepo_tracerCarrier" stroke-linecap="' +
        'round" stroke-linejoin="round"/>'#13#10#13#10'<g id="SVGRepo_iconCarrier">' +
        ' <g> <path d="M362.965,21.384H289.62L286.638,7.99C285.614,3.323,' +
        '281.467,0,276.685,0h-82.618c-4.782,0-8.913,3.323-9.953,7.99 l-2.' +
        '967,13.394h-73.36c-26.835,0-48.654,21.827-48.654,48.662v352.06c0' +
        ',26.835,21.819,48.662,48.654,48.662h255.179 c26.835,0,48.67-21.8' +
        '27,48.67-48.662V70.046C411.635,43.211,389.8,21.384,362.965,21.38' +
        '4z M379.831,422.105 c0,9.295-7.563,16.858-16.866,16.858H107.786c' +
        '-9.287,0-16.85-7.563-16.85-16.858V70.046c0-9.295,7.563-16.857,16' +
        '.85-16.857h66.294 l-1.692,7.609c-0.684,3.02,0.062,6.188,1.988,8.' +
        '596c1.94,2.415,4.876,3.82,7.965,3.82h106.082c3.091,0,6.026-1.405' +
        ',7.951-3.82 c1.942-2.415,2.687-5.575,2.004-8.596l-1.692-7.609h66' +
        '.279c9.303,0,16.866,7.563,16.866,16.857V422.105z"/> <path d="M17' +
        '0.835,188.426h43.249l-10.279-7.019c-14.506-9.899-18.232-29.693-8' +
        '.325-44.197c9.893-14.489,29.693-18.239,44.197-8.324 l1.694,1.157' +
        'v-12.136c0-7.866-6.383-14.248-14.242-14.248h-56.294c-7.857,0-14.' +
        '24,6.383-14.24,14.248v56.271 C156.595,182.045,162.978,188.426,17' +
        '0.835,188.426z"/> <path d="M303.256,110.313l-49.85,47.194l-22.70' +
        '4-15.49c-7.221-4.962-17.13-3.083-22.099,4.162 c-4.954,7.251-3.09' +
        ',17.144,4.178,22.098l33.28,22.727c2.718,1.864,5.839,2.772,8.961,' +
        '2.772c3.96,0,7.888-1.474,10.933-4.356 l59.167-56.014c6.382-6.033' +
        ',6.645-16.104,0.62-22.479C319.686,104.552,309.637,104.28,303.256' +
        ',110.313z"/> <path d="M170.835,297.669H214.1l-10.295-7.027c-14.5' +
        '06-9.901-18.232-29.693-8.325-44.197c9.893-14.498,29.693-18.248,4' +
        '4.197-8.325 l1.694,1.158v-12.136c0-7.865-6.383-14.248-14.242-14.' +
        '248h-56.294c-7.857,0-14.24,6.383-14.24,14.248v56.279 C156.595,29' +
        '1.286,162.978,297.669,170.835,297.669z"/> <path d="M303.256,219.' +
        '555l-49.85,47.186l-22.704-15.49c-7.221-4.97-17.13-3.098-22.099,4' +
        '.162 c-4.954,7.253-3.09,17.144,4.178,22.099l33.28,22.727c2.718,1' +
        '.864,5.839,2.772,8.961,2.772c3.96,0,7.888-1.476,10.933-4.356 l59' +
        '.167-56.007c6.382-6.033,6.645-16.096,0.62-22.479C319.686,213.793' +
        ',309.637,213.529,303.256,219.555z"/> <path d="M227.129,322.135h-' +
        '56.294c-7.857,0-14.24,6.383-14.24,14.248v56.271c0,7.865,6.383,14' +
        '.248,14.24,14.248h56.294 c7.859,0,14.242-6.383,14.242-14.248v-56' +
        '.271C241.371,328.518,234.988,322.135,227.129,322.135z"/> </g> </' +
        'g>'#13#10#13#10'</svg>'
      Svg.WrapMode = Stretch
    end
    object Panel4: TPanel
      Left = 0
      Top = 367
      Width = 185
      Height = 20
      Align = alBottom
      BevelOuter = bvNone
      Color = 135
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 335
      ExplicitWidth = 768
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 185
        Height = 20
        Align = alClient
        Alignment = taCenter
        Caption = 'Vers'#227'o 1.0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -10
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        ExplicitWidth = 48
        ExplicitHeight = 12
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 108
    Width = 185
    Height = 5
    BevelOuter = bvNone
    Color = 135
    ParentBackground = False
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 185
    Top = 113
    Width = 615
    Height = 387
    ActivePage = tbMinhasTarefas
    Align = alClient
    MultiLine = True
    TabOrder = 3
    TabPosition = tpRight
    object tbMinhasTarefas: TTabSheet
      Caption = 'tbMinhasTarefas'
      TabVisible = False
      DesignSize = (
        607
        379)
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 88
        Height = 15
        Alignment = taCenter
        Caption = 'Lista de Tarefas:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object ListView1: TListView
        Left = 16
        Top = 37
        Width = 577
        Height = 265
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            AutoSize = True
            Caption = 'ID'
          end
          item
            AutoSize = True
            Caption = 'Descri'#231#227'o'
          end
          item
            Alignment = taCenter
            AutoSize = True
            Caption = 'Status'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Prioridade'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Data da Cria'#231#227'o'
          end
          item
            Alignment = taRightJustify
            AutoSize = True
            Caption = 'Data da Conclus'#227'o'
          end>
        TileColumns = <
          item
            Order = 1
          end
          item
            Order = 2
          end
          item
            Order = 3
          end
          item
            Order = 4
          end
          item
            Order = 5
          end>
        RowSelect = True
        SortType = stData
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel7: TPanel
        Left = 253
        Top = 324
        Width = 110
        Height = 23
        Anchors = [akTop, akRight, akBottom]
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 252
        object lbEditarTarefa: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Editar'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = lbEditarTarefaClick
          ExplicitWidth = 27
          ExplicitHeight = 12
        end
      end
      object Panel8: TPanel
        Left = 368
        Top = 324
        Width = 110
        Height = 23
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 2
        ExplicitLeft = 367
        object lbExcluirTarefa: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Excluir'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = lbExcluirTarefaClick
          ExplicitWidth = 32
          ExplicitHeight = 12
        end
      end
      object Panel9: TPanel
        Left = 483
        Top = 324
        Width = 110
        Height = 23
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = clPeru
        ParentBackground = False
        TabOrder = 3
        ExplicitLeft = 482
        object Label11: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Sair'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = Label11Click
          ExplicitLeft = 1
        end
      end
      object Panel10: TPanel
        Left = 138
        Top = 324
        Width = 110
        Height = 23
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 4
        ExplicitLeft = 137
        object lbInserirTarefa: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Inserir'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = lbInserirTarefaClick
          ExplicitWidth = 29
          ExplicitHeight = 12
        end
      end
    end
    object tbEstatistica: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object Panel11: TPanel
        Left = 16
        Top = 16
        Width = 177
        Height = 153
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 0
        object Label13: TLabel
          Left = 0
          Top = 112
          Width = 177
          Height = 41
          Align = alBottom
          Alignment = taCenter
          Caption = 'Total de Tarefas'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object lbTotalTarefas: TLabel
          Left = 0
          Top = 0
          Width = 177
          Height = 112
          Align = alClient
          Alignment = taCenter
          Caption = '4'
          Color = clWhitesmoke
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhitesmoke
          Font.Height = -50
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitWidth = 29
          ExplicitHeight = 67
        end
      end
      object Panel12: TPanel
        Left = 216
        Top = 16
        Width = 177
        Height = 153
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 1
        object Label14: TLabel
          Left = 0
          Top = 112
          Width = 177
          Height = 41
          Align = alBottom
          Alignment = taCenter
          Caption = 'Media Prioridade Pendentes'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object lbMediaPrioridade: TLabel
          Left = 0
          Top = 0
          Width = 177
          Height = 112
          Align = alClient
          Alignment = taCenter
          Caption = '2.5'
          Color = clWhitesmoke
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhitesmoke
          Font.Height = -50
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitTop = -6
        end
      end
      object Panel13: TPanel
        Left = 419
        Top = 16
        Width = 177
        Height = 153
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 2
        object lbConcluida7Dias: TLabel
          Left = 0
          Top = 112
          Width = 177
          Height = 41
          Align = alBottom
          Alignment = taCenter
          Caption = 'Conclu'#237'das '#250'ltimos 7 dias'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
        end
        object Label17: TLabel
          Left = 0
          Top = 0
          Width = 177
          Height = 112
          Align = alClient
          Alignment = taCenter
          Caption = '4'
          Color = clWhitesmoke
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhitesmoke
          Font.Height = -50
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          ExplicitLeft = 68
          ExplicitTop = 29
          ExplicitWidth = 29
          ExplicitHeight = 67
        end
      end
    end
    object tbEdicao: TTabSheet
      Caption = 'tbEdicao'
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        607
        379)
      object Panel14: TPanel
        Left = 491
        Top = 332
        Width = 110
        Height = 23
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = clPeru
        ParentBackground = False
        TabOrder = 0
        object botaoFechar: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Sair'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = botaoFecharClick
          ExplicitWidth = 18
          ExplicitHeight = 12
        end
      end
      object Panel15: TPanel
        Left = 376
        Top = 332
        Width = 110
        Height = 23
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = 135
        ParentBackground = False
        TabOrder = 1
        object Label19: TLabel
          Left = 0
          Top = 0
          Width = 110
          Height = 23
          Align = alClient
          Alignment = taCenter
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Ok'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -10
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Layout = tlCenter
          OnClick = Label19Click
          ExplicitWidth = 14
          ExplicitHeight = 12
        end
      end
    end
  end
end
