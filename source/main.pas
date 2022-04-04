unit main;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  jpeg, ImgList,shellapi, IdDayTime, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient,registry, DB, ADODB, DBClient,MidasLib,OleCtrls,
  Clipbrd,TlHelp32, UrlMon,pngimage,WinInet,IniFiles,GIFImg,
  xmldom, XMLIntf, msxmldom, XMLDoc, IdHTTP,ShlObj,FileCtrl,DateUtils,
  Provider, SHDocVw, ExtDlgs, AppEvnts,
  CommCtrl,StrUtils,MMSystem,xpmute,Mmdevapi,ActiveX,Midas,bass,basshls,bassenc,bassenc_mp3,ComObj,
  IdSMTP,IdMessage, PlatformDefaultStyleActnCtrls, ActnList, ActnMan, HotKeyManager, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  System.Actions, System.ImageList, IdFTP, Vcl.Touch.GestureMgr;

resourcestring
DataBaseFileName= '\rde.cds';

const
Appname='AroPlay';
website='http://www.aroplay.com/';
baidupan='wpas';
LOCALIZED_KEYNAMES = True;
//ip='http://api.ip138.com/query/?datatype=xml';
//ip='http://2017.ip138.com/ic.asp';
//ip='http://ip138.com';
WM_INFO_UPDATE = WM_USER + 101;

type
  TDBGrid = class(DBGrids.TDBGrid)
  private
    FOldGridWnd: TWndMethod;
    SelectedRow: integer;
    procedure NewGridWnd(var Message: TMessage);
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged);
      message WM_WINDOWPOSCHANGED;
    Procedure WMNCCalcSize( Var msg: TMessage );
      message WM_NCCALCSIZE;
  protected
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;


  public

    constructor Create(AOwner: TComponent); override;

  end;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Timer1: TTimer;
    IdDayTime1: TIdDayTime;
    TrayIcon1: TTrayIcon;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    N13: TMenuItem;
    Label1: TLabel;
    N16: TMenuItem;
    N21: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N26: TMenuItem;
    Panel6: TPanel;
    TreeView1: TTreeView;
    ClientDataSet1: TClientDataSet;
    XMLDocument1: TXMLDocument;
    N25: TMenuItem;
    ImageList2: TImageList;
    IdHTTP1: TIdHTTP;
    Panel2: TPanel;
    N28: TMenuItem;
    N111: TMenuItem;
    N29: TMenuItem;
    N32: TMenuItem;
    N42: TMenuItem;
    N52: TMenuItem;
    N62: TMenuItem;
    N72: TMenuItem;
    N82: TMenuItem;
    Timer2: TTimer;
    N30: TMenuItem;
    Notebook1: TNotebook;
    ClientDataSet2: TClientDataSet;
    DBGrid2: TDBGrid;
    Timer3: TTimer;
    N33: TMenuItem;
    SaveDialog: TSaveDialog;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N5: TMenuItem;
    PopupMenu4: TPopupMenu;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    Label2: TLabel;
    N40: TMenuItem;
    N43: TMenuItem;
    N45: TMenuItem;
    Panel5: TPanel;
    N35: TMenuItem;
    N47: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    N39: TMenuItem;
    N44: TMenuItem;
    N53: TMenuItem;
    N60: TMenuItem;
    N41: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    Label4: TLabel;
    Label6: TLabel;
    PopupMenu5: TPopupMenu;
    N64: TMenuItem;
    Timer4: TTimer;
    Panel4: TPanel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ImageList4: TImageList;
    Label3: TLabel;
    ImageList3: TImageList;
    Label11: TLabel;
    N334: TMenuItem;
    N337: TMenuItem;
    N338: TMenuItem;
    N336: TMenuItem;
    Edit1: TEdit;
    N22: TMenuItem;
    WebBrowser1: TWebBrowser;
    Label18: TLabel;
    Label19: TLabel;
    N84: TMenuItem;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    PopupMenu9: TPopupMenu;
    N171: TMenuItem;
    N218: TMenuItem;
    Edit3: TEdit;
    N264: TMenuItem;
    N17: TMenuItem;
    N66: TMenuItem;
    N236: TMenuItem;
    N278: TMenuItem;
    TrackBar1: TTrackBar;
    ActionManager1: TActionManager;
    act1: TAction;
    Panel12: TPanel;
    Notebook2: TNotebook;
    Panel14: TPanel;
    Panel15: TPanel;
    Button1: TButton;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    TreeView2: TTreeView;
    TrackBar2: TTrackBar;
    Panel19: TPanel;
    Panel20: TPanel;
    ImageList5: TImageList;
    Label5: TLabel;
    Panel21: TPanel;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    Panel22: TPanel;
    WebBrowser2: TWebBrowser;
    ApplicationEvents1: TApplicationEvents;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel23: TPanel;
    N92: TMenuItem;
    PopupMenu10: TPopupMenu;
    N15: TMenuItem;
    N18: TMenuItem;
    Label8: TLabel;
    Panel24: TPanel;
    SpeedButton6: TSpeedButton;
    Panel25: TPanel;
    SpeedButton7: TSpeedButton;
    IdHTTP2: TIdHTTP;
    Label16: TLabel;
    N114: TMenuItem;
    N115: TMenuItem;
    N15X1: TMenuItem;
    N12X1: TMenuItem;
    N08X1: TMenuItem;
    N05X1: TMenuItem;
    N116: TMenuItem;
    N119: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Panel3: TPanel;
    Notebook3: TNotebook;
    Panel8: TPanel;
    SpeedButton9: TSpeedButton;
    PopupMenu12: TPopupMenu;
    N120: TMenuItem;
    N121: TMenuItem;
    SpeedButton13: TSpeedButton;
    PopupMenu13: TPopupMenu;
    N124: TMenuItem;
    N122: TMenuItem;
    Panel11: TPanel;
    Image2: TImage;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    ToolBar3: TToolBar;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    N34: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolBar5: TToolBar;
    ToolButton23: TToolButton;
    Panel9: TPanel;
    N61: TMenuItem;
    N63: TMenuItem;
    Panel10: TPanel;
    WebBrowser4: TWebBrowser;
    Panel26: TPanel;
    SpeedButton16: TSpeedButton;
    ToolButton24: TToolButton;
    SpeedButton10: TSpeedButton;
    PopupMenu6: TPopupMenu;
    N20: TMenuItem;
    N27: TMenuItem;
    N49: TMenuItem;
    N58: TMenuItem;
    N68: TMenuItem;
    Label14: TLabel;
    Timer7: TTimer;
    PaintBox1: TPaintBox;
    ComboBox2: TComboBox;
    Label9: TLabel;
    ToolButton25: TToolButton;
    Label10: TLabel;
    Panel7: TPanel;
    Label12: TLabel;
    Image4: TImage;
    Panel31: TPanel;
    Image5: TImage;
    TrackBar3: TTrackBar;
    Label15: TLabel;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    HotKeyManager1: THotKeyManager;
    Panel32: TPanel;
    Image6: TImage;
    Label20: TLabel;
    N69: TMenuItem;
    N71: TMenuItem;
    ClientDataSet3: TClientDataSet;
    ToolButton26: TToolButton;
    N19: TMenuItem;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    N6: TMenuItem;
    CheckBox1: TCheckBox;
    Notebook4: TNotebook;
    Panel13: TPanel;
    Panel33: TPanel;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    Label7: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    ToolBar6: TToolBar;
    ToolButton18: TToolButton;
    ProgressBar1: TProgressBar;
    IdFTP1: TIdFTP;
    ComboBox4: TComboBox;
    Timer5: TTimer;
    PopupMenu7: TPopupMenu;
    N201: TMenuItem;
    N301: TMenuItem;
    N601: TMenuItem;
    N801: TMenuItem;
    N901: TMenuItem;
    Panel34: TPanel;
    Image3: TImage;
    N11: TMenuItem;
    N46: TMenuItem;
    N51: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton5ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure b(Column: TColumn);
    procedure Timer3Timer(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure TrayIcon1BalloonClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N5Click(Sender: TObject);
    procedure TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FlyFlv1PlayProgress(ASender: TObject; TotalTime, CurrentTime,
      BufferLength: Single);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N12Click(Sender: TObject);
    procedure TreeView1Exit(Sender: TObject);
    procedure TreeView1Enter(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure QQ1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image9DblClick(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure AudioRecord1Data(Data: Pointer; Count: Integer);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure N41Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N61Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N64Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure janTracker1ChangedValue(sender: TObject; NewValue: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N30Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Label10MouseEnter(Sender: TObject);
    procedure Label12MouseEnter(Sender: TObject);
    procedure Label12MouseLeave(Sender: TObject);
    procedure Label10MouseLeave(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label11MouseLeave(Sender: TObject);
    procedure Label11MouseEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N337Click(Sender: TObject);
    procedure N338Click(Sender: TObject);
    procedure N336Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label9MouseEnter(Sender: TObject);
    procedure Label9MouseLeave(Sender: TObject);
    procedure Label13MouseLeave(Sender: TObject);
    procedure Label13MouseEnter(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure FlyFlv1ButterProgress(ASender: TObject; TotalBytes,
      LoadedBytes: Integer);
    procedure QQ2Click(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure PopupMenu8Popup(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure Label19Click(Sender: TObject);
    procedure Label18Click(Sender: TObject);
    procedure Label19MouseEnter(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure Label18MouseEnter(Sender: TObject);
    procedure Label20MouseEnter(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N171Click(Sender: TObject);
    procedure N218Click(Sender: TObject);
    procedure PG181Click(Sender: TObject);
    procedure PG182Click(Sender: TObject);
    procedure N481Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
//    procedure Button13Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label14MouseEnter(Sender: TObject);
    procedure Label14MouseLeave(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure N264Click(Sender: TObject);
    procedure N236Click(Sender: TObject);
    procedure N272Click(Sender: TObject);
    procedure N278Click(Sender: TObject);
    procedure N206Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure SpeedButton3click(Sender: TObject);
    procedure N283Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure LabeledEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure TrayIcon2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer6Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure WebBrowser2DownloadComplete(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N91Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure DBGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N92Click(Sender: TObject);
    procedure PG183Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure N112Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure EdgeWin101Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure N114Click(Sender: TObject);
    procedure Kindle1Click(Sender: TObject);
    procedure N115Click(Sender: TObject);
    procedure N116Click(Sender: TObject);
    procedure N117Click(Sender: TObject);
    procedure N118Click(Sender: TObject);
    procedure N119Click(Sender: TObject);
    procedure N120Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N122Click(Sender: TObject);
    procedure N124Click(Sender: TObject);
    procedure N126Click(Sender: TObject);
    procedure TreeView1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Image3Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure N15X1Click(Sender: TObject);
    procedure N12X1Click(Sender: TObject);
    procedure N08X1Click(Sender: TObject);
    procedure N05X1Click(Sender: TObject);
    procedure Kindle2Click(Sender: TObject);
    procedure PopupMenu10Change(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
    procedure ButtonedEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure ButtonedEdit2DblClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure WebBrowser3DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser3DownloadComplete(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure PopupMenu12Popup(Sender: TObject);
    procedure SpeedButton9MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu13Popup(Sender: TObject);
    procedure SpeedButton13MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton21Click(Sender: TObject);
    procedure Notebook3PageChanged(Sender: TObject);
    procedure Panel29Click(Sender: TObject);
    procedure Panel27Click(Sender: TObject);
    procedure Panel28Click(Sender: TObject);
    procedure Panel30Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label10Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Enter(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure Notebook2PageChanged(Sender: TObject);
    procedure WebBrowser4Enter(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure ComboBox2DblClick(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure ToolButton25Click(Sender: TObject);
    procedure HotKeyManager1HotKeyPressed(HotKey: Cardinal; Index: Word);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N69Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton26Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ToolButton2MouseEnter(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure N201Click(Sender: TObject);
    procedure N301Click(Sender: TObject);
    procedure N601Click(Sender: TObject);
    procedure N801Click(Sender: TObject);
    procedure N901Click(Sender: TObject);
    procedure N233Click(Sender: TObject);
    procedure TrackBar1Enter(Sender: TObject);
    procedure Label14MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N11Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
  private
     _FClosing:Boolean ;
     FOnTop: Boolean;
//     HotKeyIndex1,HotKeyIndex2,HotKeyIndex3,HotKeyIndex4,HotKeyIndex5,HotKeyIndex6,HotKeyIndex7,HotKeyIndex8,HotKeyIndex9,HotKeyIndex10: Word;
     fs:string;
//     FOnTop: Boolean;
    function iswin64:boolean; //判断是否64位
//    procedure CopyDbDataToExcel(Args: array of const);//把收藏夹电台导出到excel
    function MakeFileList(Path,FileExt:string):TStringList ;
    procedure Delrec;//删除记录
//    procedure SortCity(city:string);//菜单筛选类别，国家
    procedure loadll;//导入流量值
    procedure fft;//动态图谱
    procedure timezone; //各地时区
    procedure savell;//保存流量值
    procedure bass; //bass定位
    procedure GuessYoulike(name,coutry:string); //猜你喜欢
    procedure ShowUser; //  用户自定义窗口
    procedure regedit32(ie:integer); //32位注册信息
    procedure regedit64; //64位注册信息
    procedure ipv6; //禁用win7ipv6
    procedure ShowNet;//获取每日更新及听力内容
    procedure sync; //同步数据库
//    procedure WMHotkeyHandle(var Msg: TMessage); message WM_HOTKEY; //功能键设定
//    procedure dblplay;    //双击播放电台
//    procedure AutoUpdate; //自动安装更新
//    procedure GetComputersName;//获取计算机名称
    procedure VistaMute(value:Double);//关闭win7静音

    procedure Savecombobox; //保存查询记录
    procedure CICIvoice;//开机语音
    procedure WMQueryEndsession(var Message: TMessage); Message WM_QueryEndSession; //强制关闭桌面托盘
    procedure loadtree;//加载目录树
    procedure Randplay; //随机播放
    procedure Randplay1(kind:string); //随机播放特定类别
    procedure Randplay2(kind:string); //国内随机
    procedure Randplay3(kind:string); //国外随机
    procedure DeleteDirectory(const Name: string); //删除目录
    procedure Choosepicture(const Picture:string); //选择图片
    procedure Updatepg18; //下载pg18+
    function GetFilter: string;
    procedure localradio; //导入本地媒体
    procedure showkindle; //显示kindle书籍
//    procedure savekindle; //保存kindle设置
//    procedure loadkindle;
//    procedure savetree;//保存目录树

//    procedure Dplaytimer(Sender: TObject); //抓取更新日志


  public
    tvforcast,title,title1,title2,title3,title4,ip,title5,title8,title9,s2,s3,tvmemo,tvdate,update,update1,newforestradio,country,ipaddress,area,tvm,rkind,close:String ; //title9表示新浪电台地址,newforestradio表示节目预告电台名称
    flag,play,regeditaro,rdfile,detail,showstatus,playradio,tv,select,tvshow,sim,listentv:Boolean;  //sim判断treeview是否为简洁版本
    input: integer;
    mp:AnsiString;
    d:TDateTime ;
    mag,radiokind,videoadd,videokind,videonname,videoforcast,qq,address,name,rname,genre,tvname,tvtime,fn:string;
    youlikename,youlikecoutry,key,adver,webad,tvjh:string;//猜你喜欢电台名称，国家
//    WaveStream: TMemoryStream; //音频流
    start: TTime;   //录音时间显示
    number,directory,newradio,radiomemo,nowdate:string ; //最后播放的电台数字,存放的目录
    function CheckdirectoryName:Boolean ;//检测录音文件配置
    function IsMBCSChar(const ch: AnsiString): Boolean; //判断是否为汉字
    function ChangeProxy(const Proxy, Port,ByPass: string; const bEnabled: boolean = True): boolean;
    function CheckOffline: boolean; //检测是否联网
    function Regaro:Boolean; //网络验证
    function lyric:Boolean; //显示歌词
//    procedure fixdb(show:Boolean); //修复数据库
    procedure NewForest(Sender: TObject); //电台节目预告
    procedure ShowTv;  //播放视频
    procedure RecordRadio; //录制电台
    procedure emptylist;//清空播放列表
    procedure emptysc; //清空收藏夹
    procedure OverWater;//超过流量
    procedure AdjustToken;//获取操作系统权限
    procedure DirectoryCopy(dir1,dir2:string); //目录复制
    function TotalRecord:integer; //当前任务记录
    procedure Arecord;        //开始录音
    procedure Hotkey; //快捷键重置
    procedure tongji;//cnzz数据统计
    procedure Stayon; //始终显示在最前面
    procedure initbass; //初始化
    procedure SetAutoRun(ok: boolean);//设置开机启动
    function GetBuildInfo: string; //获取程序版本
    procedure OpenVolumn;//禁止静音
    procedure ShowSchool; //计划窗口
    procedure startjh; //电视预告窗体
    procedure deletepg18; //删除未注册用户的PG18列表
//    procedure dayplay; //每天运行
//    procedure weekplay;  //每周运行
    procedure Startcheck; //检查启动组
//    procedure UpdateDB;   //更新数据库
    procedure UpdateInputInfo ;
    procedure checkupdate; //检查更新
    procedure loaddata;    //导入数据显示
    procedure loadplan;    //导入计划
    procedure Saveradio; //保存预设电台
    procedure Loadradio; //导入预设电台
    procedure Killthunder; //关闭迅雷等下载工具
    procedure PlayMusic(const Filename:string); //播放内置电台
    procedure savetree;//保存目录树
    procedure Sendmail(name1,name2,name3,name4,name5:string);
//    procedure Createparams(Var Params:TCreateParams);override;
//    function sim:Boolean ; //判断目录树是否未简介版
//    procedure PlayRadio;  //播放电台
    function DownloadFile(Source, Dest: string): Boolean; //下载更新文件
    function Keycode(httpsr:string): Boolean; //检测是否为正版
    function GetSysDir:String;  //得到系统目录
    function isvista:Boolean ;  //判断是否为win7
    function GetShellFolders(strDir: string): string;//获取ini目录
    procedure WndProc(var Msg: TMessage); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function StartApp(apchOperation, apchFileName, apchParameters, apchDirectory: PChar; awrdShowCmd: Word): Cardinal;
    procedure DestroyProcess(hProcess: Cardinal);
//    procedure Stayon; //始终显示在最前面
 end;


var
  Form1: TForm1;
//  id,id1:Integer;
//  HotkeyId,HotkeyId1: THandle;
  strList: TStringList;
  id3:Integer;
  hApp: Cardinal;
//  MagneticWndProc : TSubClass_Proc;
  dummyHandled : boolean;
//  cthread1: DWORD = 0;
  chan: HSTREAM = 0;
  t: TTime;
  DontSeek:Boolean;
  interval:Cardinal ;
  i,K,l,buffertime,checktime,id2:Integer ; //all表示所有的电台记录数，s2表示cds2中的完成动作，i用于表示间隔数，K用来表示快捷键的定义,buffertime表示缓冲时间,l用来表示录音快捷键。
  ASC:Boolean=True ;
  playstatus:Byte ;  //用于设定不同的播放方式，来判断timer的显示
//  WaveHdr: WAVHDR;  // WAV header
//  rchan:   HRECORD;	// recording channel
//  chan:    HSTREAM;	// playback channel
  h1:THandle ;
  cthread: DWORD = 0;
  win: HWND = 0;
  s1,weibo,lweibo,netmobi:string;
  FFTData: array[0..512] of Single;
  bit: TBitmap;
  FFTPeacks  : array [0..128] of Integer;
  FFTFallOff : array [0..128] of Integer;

//  rchan: HRECORD = 0;
//  chan: HSTREAM = 0;

implementation

uses setting, add, update, time, tree, video, focast, DayplayThread, mini, pd,
  tuijian, pg18, backup, cloudy, sync, book, nl, buy, kindledr, waiting, pdset, zoom, filter, plus, code;


{$R *.dfm}
{$R uac.res}
{$R cici.res}



procedure TForm1.startjh;
begin
if CheckOffline then
begin
  if DownloadFile(website+'tv.xml',GetShellFolders('Personal')+'\ARO'+'\' + 'tv.xml')then
      begin
        XMLDocument1.LoadFromFile(GetShellFolders('Personal')+'\ARO'+'\' + 'tv.xml');

        if XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text> formatdatetime('yyyymmddhhmm',now)then
        begin
        if form1.tvjh<>XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text then
        begin
        detail :=false;
        tvjh:=XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text;
        tvforcast:=XMLDocument1.DocumentElement.ChildNodes[1].ChildNodes[0].Text;
        tvmemo:=XMLDocument1.DocumentElement.ChildNodes[2].ChildNodes[0].Text;
        tvdate:=XMLDocument1.DocumentElement.ChildNodes[3].ChildNodes[0].Text;
        tvtime:=XMLDocument1.DocumentElement.ChildNodes[4].ChildNodes[0].Text;
        form11:=TForm11.Create(self);
        Form11.Top := Screen.WorkAreaHeight;
        Form11.Height := 0;
          while Form11.Top > Screen.WorkAreaHeight - 175 do begin
            Form11.Top := Form11.Top - 1; Form11.Height := Form11.Height + 1;
            Form11.Left := Screen.WorkAreaWidth - Form11.Width - 1;
          end;
        Form11.show;
        end;
        end;
      end
      else
       Application.MessageBox('加载错误，请查看是否系统已联网！', appname, MB_OK +
            MB_ICONSTOP + MB_TOPMOST);


end
else
       Application.MessageBox('加载错误，请查看是否系统已联网！', appname, MB_OK +
            MB_ICONSTOP + MB_TOPMOST);
end;




procedure TForm1.Stayon;
begin
if FOnTop then
  begin
    //取消置顶
    SetWindowPos(Self.Handle,HWND_NOTOPMOST,Left,Top,Width,Height,0);
    FOnTop := False;
    SpeedButton10.Down:=False  ;
    SpeedButton10.Caption:='√';
    SpeedButton10.Hint:='置顶';
  end else begin
    //置顶
    FOnTop := True;
    SetWindowPos(Self.Handle,HWND_TOPMOST,Left,Top,Width,Height,0);
    SpeedButton10.Down:=True ;
    SpeedButton10.Caption:='Ø';
    SpeedButton10.Hint:='取消置顶';
  end;

//if FOnTop then
//  begin
//    //取消置顶
//    SetWindowPos(Self.Handle,HWND_NOTOPMOST,Left,Top,Width,Height,0);
//    FOnTop := False;
//    SpeedButton17.Down:=false;
//  end
//  else begin
//    //置顶
//    FOnTop := True;
//    SetWindowPos(Self.Handle,HWND_TOPMOST,Left,Top,Width,Height,0);
//    SpeedButton17.Down:=True ;
//  end;
end;

procedure TForm1.sync;
var
 cdsnew:TClientDataSet;
 filesize:integer;
 begin
try
Screen.Cursor:=crHourGlass ;
if form1.CheckOffline then
          begin
            form1.ClientDataSet1.filtered:=false;
            form1.ClientDataSet1.filter:='';
            form1.ClientDataSet1.filtered:=True ;
            Application.Minimize;
//               form1.TreeView1.Select(form1.TreeView1.Items[0]);
                  with form1.TrayIcon1 do
                    begin
                      BalloonTitle :=appname;
                      BalloonHint:='请稍后,数据库正在更新...';
                      BalloonFlags:=bfInfo ;
                      ShowBalloonHint;
                    end;
//                     Form12.hide;
                     SendMessage(handle,WM_CLOSE,0,0);
//                     Application.Minimize;
                     form1.Cursor :=crHourGlass;
                     try
                      cdsnew := Tclientdataset.Create(nil);
//                      MyStream := TMemoryStream.Create;
                      DeleteUrlCacheEntry(PWideChar(website +'download/cn/rd.cds'));
                      Form2.idftp1.Connect;
                      Form2.idftp1.ChangeDir('wwwroot/download/cn');
                      FileSize:= Form2.idftp1.Size('rd.cds');
//                      dr:=ExtractFilePath(Application.ExeName)+'rd.cds';
                      Form2.idftp1.Get('rd.cds', PChar(form1.GetShellFolders('Personal')+'\rd.cds'), True);
//                              IdHTTP1.Get(website + 'download/cn/rd.cds',MyStream);
//                              MyStream.SaveToFile(form1.GetShellFolders('Personal') + '\ARO' +'\' + 'rd.cds');
//                              if form1.DownloadFile(website+'download/cn/rd.cds',form1.GetShellFolders('Personal')+'\ARO\rd.cds') then
//                              LabeledEdit1.Text :=GetHomePath+'\rd.cds';
                              // cdsnew.LoadFromFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'rd.cds');
                               CopyFile(PChar(form1.GetShellFolders('Personal')+'\rd.cds'),PChar(GetHomePath + DataBaseFileName),False);
                               Form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
                               Screen.Cursor := crHourGlass;
//                              Form12.Close;
                              with form1.TrayIcon1 do
                              begin
                                BalloonTitle := appname;
                                BalloonHint := '数据库更新已完成！';
                                BalloonFlags := bfInfo;
                                ShowBalloonHint;
                              end;
                              screen.Cursor :=crDefault ;
                              DeleteFile(form1.GetShellFolders('Personal')+'\rd.cds');
//                              Application.Restore;
                            finally
                              cdsnew.Free;
//                              MyStream.Free;
                            end;
                          end
                          else begin
                          MessageBeep(16);
                            Application.MessageBox('更新失败，请检查是否联网或稍后再试！',
                              appname, MB_OK + MB_ICONWARNING);
                          with form1.TrayIcon1 do
                          begin
                            BalloonTitle := appname;
                            BalloonHint := '更新失败，请检查是否联网或稍后再试！';
                            BalloonFlags := bfInfo;
                            ShowBalloonHint;
                          end;
                          end;
//          end;
          Screen.Cursor:=crDefault ;
                        except
                          Application.MessageBox('导入错误，请检查数据库文件！', appname,
                            MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
                        end;
                      end;


procedure TForm1.Timer1Timer(Sender: TObject);
var
  Srect,Drect,PosForme:TRect;
  iWidth,iHeight,DmX,DmY:Integer;
  iTmpX,iTmpY:Real;
  C:TCanvas;
  hDesktop: Hwnd;
  Kursor:TPoint;
begin
 If not IsIconic(Application.Handle) then begin
  hDesktop:= GetDesktopWindow;
  GetCursorPos(Kursor);
 	PosForme:=Rect(panel31.Left,panel31.Top,panel31.Left+panel31.Width,panel31.Top+panel31.Height);
  If not PtInRect(PosForme,Kursor) then begin

//    If Panel32.Visible=True then Panel32.Visible:=False;
//    If Image5.Visible=False then Image5.Visible:=True;

 	 iWidth:=Image5.Width;
		 iHeight:=Image5.Height;
    Drect:=Rect(0,0,iWidth,iHeight);

    iTmpX:=iWidth / (TrackBar3.Position * 3);
    iTmpY:=iHeight / (TrackBar3.Position * 3);

    Srect:=Rect(Kursor.x,Kursor.y,Kursor.x,Kursor.y);
    InflateRect(Srect,Round(iTmpX),Round(iTmpY));
    // move Srect if outside visible area of the screen
    If Srect.Left<0 then OffsetRect(Srect,-Srect.Left,0);
    If Srect.Top<0 then OffsetRect(Srect,0,-Srect.Top);
    If Srect.Right>Screen.Width then OffsetRect(Srect,-(Srect.Right-Screen.Width),0);
    If Srect.Bottom>Screen.Height then OffsetRect(Srect,0,-(Srect.Bottom-Screen.Height));

   C:=TCanvas.Create;


   try
     C.Handle:=GetDC(GetDesktopWindow);
     Image5.Canvas.CopyRect(Drect,C,Srect);
    finally
      ReleaseDC(hDesktop, C.Handle);
      C.Free;
    end;
//    If checkbox1.Checked=True then begin // show crosshair
//    	with Image5.Canvas do begin
//        DmX:=TrackBar3.Position * 2 * (Kursor.X-Srect.Left);
//        DmY:=TrackBar3.Position * 2 * (Kursor.Y-Srect.Top);
//   		 MoveTo(DmX - (iWidth div 4),DmY); // -
//   		 LineTo(DmX + (iWidth div 4),DmY); // -
//    		 MoveTo(DmX,DmY - (iHeight div 4)); // |
//   		 LineTo(DmX,DmY + (iHeight div 4)); // |
//      end; // with image1.Canvas
//    end; // show crosshair
  	Application.ProcessMessages;
	end // Cursor not inside form
   else begin  // cursor inside form
//   	If Panel32.Visible=False then Panel32.Visible:=True;
//   	If Image5.Visible=True then Image5.Visible:=False;
  end;
 end; // IsIconic

//startjh;
//  If Win32Platform = VER_PLATFORM_WIN32_NT then
//  begin
//     SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
//     Application.ProcessMessages;
//  end;
//  if WindowsMediaPlayer1.isOnline  then
//  begin
//    ButtonedEdit1.RightButton.ImageIndex :=22;
//    ButtonedEdit1.RightButton.Hint :='当前在线'
//  end
//  else begin
//    ButtonedEdit1.RightButton.ImageIndex :=-1;
//    ButtonedEdit1.RightButton.Hint :='当前脱机'
//  end;
end;

procedure Error(es: string);
begin
  MessageBox(win, PChar(es + #13#10 + '(错误代码: ' + IntToStr(BASS_ErrorGetCode) +
    ')'), nil, 0);
end;

{ update stream title from metadata }

procedure DoMeta();
var
  meta: PAnsiChar;
  p: Integer;
begin
  meta := BASS_ChannelGetTags(chan, BASS_TAG_META);
  if (meta <> nil) then
  begin
    p := Pos('StreamTitle=', String(AnsiString(meta)));
    if (p = 0) then
      Exit;
    p := p + 13;
    SendMessage(win, WM_INFO_UPDATE, 7, DWORD(PAnsiChar(AnsiString(Copy(meta, p, Pos(';', String(meta)) - p - 1)))));
  end;
end;

procedure MetaSync(handle: HSYNC; channel, data: DWORD; user: Pointer); stdcall;
begin
  DoMeta();
end;

procedure StatusProc(buffer: Pointer; len: DWORD; user: Pointer); stdcall;
begin
  if (buffer <> nil) and (len = 0) then
    SendMessage(win, WM_INFO_UPDATE, 8, DWORD(PAnsiChar(buffer)));
end;


procedure TForm1.Timer2Timer(Sender: TObject);
var str,str1,si,sj,sc,sk,secpo:string; i,j,c,k,bypepos:Integer;
secpos:Double;  vol: single;

  begin
  BASS_ChannelGetAttribute(chan, BASS_ATTRIB_VOL, vol);
  if chan = 0 then Exit; {如果播放流没有建立则退出}
  case BASS_ChannelIsActive(chan) of
    BASS_ACTIVE_STOPPED:str:= 'Stopped: ';
    BASS_ACTIVE_PLAYING:str:= 'Playing: ';
    BASS_ACTIVE_STALLED:str:= 'Buffering...';
    BASS_ACTIVE_PAUSED:str:= 'Pause: ';
  end;
  str1:='';
  bypepos:=BASS_ChannelGetPosition(chan, BASS_POS_BYTE); // get current position in bytes
  secpos:=BASS_ChannelBytes2Seconds(chan, bypepos);
  //secpos:=strtoint(edit1.Text);
   k:=Round(secpos) mod 60;
   j:=Round(secpos) div 60;
   j:=j mod 60;
   c:=Round(secpos) div 3600;

   if k<10
   then sk:='0'+inttostr(k)
   else sk:= inttostr(k) ;

   if j<10
   then sj:='0'+inttostr(j)
   else sj:= inttostr(j);

   if c<10
   then sc:='0'+inttostr(c)
   else sc:= inttostr(c);

   str1:=sc+':'+sj+':'+sk;

  label6.Caption := str1;
  timezone;
  t:=IncSecond(t);
  case playstatus  of
    1:begin
        Label3.Caption :=str+#32+#32+title2;
        if regeditaro then
        begin
//          Form1.Caption:=Appname +label11.Caption;
          trayicon1.Hint:=appname+#13+title2+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
        end
        else
          trayicon1.Hint:=appname+#13+title2+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+#32+#32+'Record: '+ShortCutToText(form2.HotKey9.hotkey);
            if (vol=0) and (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
              begin
                Label3.Caption :=str+#32+#32+title2+#32+'-'+#32+'Mute';
//                TrayIcon1.IconIndex:=2;
                if regeditaro then
                begin
//                  Form1.Caption:=Appname +label11.Caption;
                  TrayIcon1.Hint:=appname+#13+title2+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey);
                end
                  else
                  TrayIcon1.Hint:=appname+#13+title2+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
              end
            else if vol=1 then
            begin
                Label3.Caption:=str+#32+#32+title2;

            end;
      end;
     2:begin
        Label3.Caption :=str+#32+#32+title5;
        if regeditaro then
        begin
//          Form1.Caption:=Appname +label11.Caption;
          trayicon1.Hint:=appname+#13+title5+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
        end
        else
          trayicon1.Hint:=appname+#13+title5+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey);

        if (vol=0) and (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
              begin
                Label3.Caption :=str+#32+#32+title5+#32+'-'+#32+'Mute';
//                TrayIcon1.IconIndex:=2;
                 if regeditaro then
                 begin
//                  Form1.Caption:=Appname+label11.Caption;
                  TrayIcon1.Hint:=appname+#13+title5+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
                 end
                else
                  TrayIcon1.Hint:=appname+#13+title5+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)

//                TrayIcon1.Hint:=appname+#13+title5+#13+'当前静音键为: '+form2.combobox1.Text
              end
            else if vol=1 then
            begin
                Label3.Caption:=str+#32+#32+title5;
//                TrayIcon1.IconIndex:=7;
            end;
        end;

      3:begin
        Label3.Caption :=str+#32+#32+number;
        if regeditaro then
        begin
//          Form1.Caption:=Appname +label11.Caption;
          trayicon1.Hint:=appname+#13+number+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
        end
        else
          trayicon1.Hint:=appname+#13+number+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+#32+#32+'Record: '+ShortCutToText(form2.HotKey9.hotkey);
            if (vol=0) and (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
              begin
                Label3.Caption :=str+#32+#32+number+#32+'-'+#32+'Mute';
//                TrayIcon1.IconIndex:=2;
                if regeditaro then
                begin
//                  Form1.Caption:=Appname +label11.Caption;
                  TrayIcon1.Hint:=appname+#13+number+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
                end
                  else
                  TrayIcon1.Hint:=appname+#13+number+#13+'Mute: '+ShortCutToText(form2.HotKey8.hotkey)+' | Record: '+ShortCutToText(form2.HotKey9.hotkey)
              end
            else if vol=1 then
            begin
                Label3.Caption:=str+#32+#32+number;
//                TrayIcon1.IconIndex:=7;
            end;
      end;
    end;
    if (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
      TrayIcon1.IconIndex:=7
    else
      TrayIcon1.IconIndex:=8;

    Timer7.Enabled:=true;
  end;


procedure TForm1.Timer3Timer(Sender: TObject);
begin
   AdjustToken ;
  if i>0 then
  begin
    i:=i-1;
  end
  else begin
    if form1.ToolButton1.Tag  <> 0 then
    begin
      form1.ToolButton1.Click ;
      form1.TreeView1.Select(TreeView1.Items[0]);
     end;
     BASS_ChannelStop(chan);
     BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 1);

      ToolButton23.tag:=0;
      PopupMenu1.items[5].items[3].tag:=0;
      PopupMenu1.items[5].items[3].caption:='Mute';
      ToolButton23.ImageIndex :=36;
      toolbutton23.Hint:='Mute';
      TrayIcon1.IconIndex:=3;
      form1.Timer3.Enabled :=false;
      Form1.Timer2.Enabled :=False  ;
      Form1.Timer7.Enabled :=False  ;
      title2:='';
      title5:='';
      label4.Caption :='';
      TrayIcon1.IconIndex :=8;
      rdfile :=false;
      Form1.toolbutton1.tag:=0;
      form1.toolbutton1.imageindex:=0;
      if Form1.s2='Shutdown' then
      ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE,0)//关闭计算机
    else if form1.s2='Sleep' then
      SetSystemPowerState(False ,True) //让计算机处于休眠状态
    else if form1.s2='Exit AroPlay' then
    Form1.N2.Click  //退出程序
    else if Form1.s2='Delete record' then
    Delrec;
//

      if form2.checkbox7.checked  then
              Form2.SpeedButton6.Click ;
              if Form2.CheckBox3.Checked then
            ShellExecute(handle,'open',PChar(Form2.netpan),nil,nil,SW_SHOWNORMAL );

  end;

end;


procedure TForm1.Timer4Timer(Sender: TObject);
var v:HWND;
begin
  AdjustToken ;
  if i>0 then
  begin
    i:=i-1;
  end
  else begin
    v:=FindWindow('TForm7',nil);
    PostMessage(v,WM_CLOSE,0,0);
      form1.Timer4.Enabled :=false;
      Form1.Timer2.Enabled :=False  ;
      Form1.Timer7.Enabled :=False  ;
      title2:='';
      title5:='';
      TrayIcon1.IconIndex :=8;
      label4.Caption :='';
      rdfile :=false;
      Form1.tv:=False;

      if Form1.s2='Shutdown' then
      ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE,0)//关闭计算机
    else if form1.s2='Sleep' then
      SetSystemPowerState(False ,True) //让计算机处于休眠状态
    else if form1.s2='Exit AroPlay' then
      Form1.N2.Click
     else if Form1.s2='Delete record' then
    Delrec;

end;
end;



procedure TForm1.Timer5Timer(Sender: TObject);
begin
AdjustToken ;
if close=formatdatetime('hhmmss',now) then
   ExitWindowsEx(EWX_SHUTDOWN or EWX_FORCE,0)//关闭计算机
end;


//end;


procedure TForm1.Timer6Timer(Sender: TObject);
begin
//  if FormatDateTime('hh:mm:ss',now)=FormatDateTime('hh:mm:ss',DateTimePicker1.Time) then
//  begin
//    case ComboBox1.ItemIndex of
//      0: showkindle('LE');
//      1: showkindle('NY');
//      2: showkindle('NYT');
//      3: showkindle('TE');
//      4: showkindle('Time');
//
//    end;
//  end;
  end;




procedure TForm1.Timer7Timer(Sender: TObject);
begin
fft;
end;

procedure TForm1.timezone;
begin
strList:= TStringList.Create;
strList.Add('Argentina');
strList.Add('Ireland');
strList.Add('Australia');
strList.Add('Pakistan');
strList.Add('Palestine');
strList.Add('Brazil');
strList.Add('Belgium');
strList.Add('Poland');
strList.Add('Germany');
strList.Add('Russia');
strList.Add('France');
strList.Add('Finland');
strList.Add('Guam');
strList.Add('South Korea');
strList.Add('Netherlans');
strList.Add('Canada');
strList.Add('Cambodia');
strList.Add('Kuwait');
strList.Add('Laos');
strList.Add('Romania');
strList.Add('Malaysia');
strList.Add('USA');
strList.Add('Mongolia');
strList.Add('Bangladesh');
strList.Add('Mexico');
strList.Add('South Africa');
strList.Add('Norway');
strList.Add('Japan');
strList.Add('Sweden');
strList.Add('Switzerland');
strList.Add('Saudi Arabia');
strList.Add('Slovakia');
strList.Add('Thailand');
strList.Add('Turkey');
strList.Add('Ukraine');
strList.Add('Uruguay');
strList.Add('Spain');
strList.Add('Greece');
strList.Add('Singapore');
strList.Add('New Zealand');
strList.Add('Hungary');
strList.Add('Israeli');
strList.Add('Italy');
strList.Add('India');
strList.Add('Indonesia');
strList.Add('United Kingdom');
strList.Add('Vietnam');
strList.Add('HKMACAOTAIWAN');
strList.Add('Portugal');
strList.Add('Egypt');
strList.Add('Nigeria');
strList.Add('Morocco');
strList.Add('Kenya');
strList.Add('Mozambique');
strList.Add('Iraq');
strList.Add('Iran');
strList.Add('Nepal');
strList.Add('Bulgaria');
strList.Add('Tunisia');
strList.Add('Denmark');
strList.Add('Czech Republic');
strList.Add('Austria');
strList.Add('Myanmar');
strList.Add('Philippines');
strList.Add('North Korea');
strList.Add('Cuba');
strList.Add('Columbia');
strList.Add('Paraguay');
strList.Add('Peru');
strList.Add('Iceland');
//country:=youlikecoutry;
//str:=country;
case strList.IndexOf(youlikecoutry) of
0: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*11);
1: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);
2: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*3);
3: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*3);
4: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
5: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*10);
6: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
7: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
8: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);
9: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
10: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
11: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
12: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*2);
13: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*1);
14: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
15: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*13);
16: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
17: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*3);
18: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
19: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
20: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now);
21: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*13);
22: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
23: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*2);
24: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*14);
25: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
26: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
27: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*1);
28: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
29: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
30: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*5);
31: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
32: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
33: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*5);
34: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
35: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*11);
36: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
37: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
38: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now);
39: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*5);
40: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
41: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
42: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
43: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*3);
44: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
45: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);
46: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1);
47: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now);
48: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);
49: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
50: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
51: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
52: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);
53: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
54: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
55: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*5);
56: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*4.5);
57: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*2.5);
58: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*6);
59: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
60: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
61: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
62: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*7);
63: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*1.5);
64: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now);
65: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now+1/24*1);
66: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*13);
67: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*13);
68: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*12);
69: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*13);
70: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*12);
71: image3.hint:=youlikecoutry+' '+formatdatetime('hh:mm',now-1/24*8);

else image3.hint:='Beijing: '+formatdatetime('hh:mm',now);
end;
end;

procedure TForm1.tongji;
var web:TWebBrowser;
begin
try
   try
    web:=Twebbrowser.create(nil);
    Web.Navigate(website+'1.html');
   finally
    web.free;
   end;

  except
  end;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
//  PlayMusic('');
end;



procedure TForm1.ToolButton16Click(Sender: TObject);
begin
TreeView1.Select(TreeView1.Items[0]);
end;

procedure TForm1.ToolButton18Click(Sender: TObject);
begin
if ToolButton18.down then
notebook4.PageIndex :=1
else
notebook4.PageIndex :=0;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
var id:DWORD;
begin

if form2.CheckBox6.Checked  then
        Killthunder ;
      Timer2.Enabled :=True ;
      title2:='';
      label14.Caption:='';
       tvname:=Form1.ClientDataSet1.fieldbyname('电台名称').asstring;
    if CheckOffline  then
    begin
        if form1.ClientDataSet1.FieldByName('视频类型').AsString <>'电视台' then
          begin
           if toolbutton1.tag=0 then
            begin
              if ClientDataSet1.FieldByName('电台类型').asstring='Common' then
                begin
                  if flag then
                      mp:=title1
                  else
                      mp:=title;
//                      BASS_ChannelStop(chan);
                    DBGrid1DblClick(Self);
                    title2:=ClientDataSet1.FieldByName('电台名称').asstring;
                    youlikecoutry:=ClientDataSet1.FieldByName('电台国家').asstring;
                    youlikename:=ClientDataSet1.FieldByName('电台类别').asstring;
                      playstatus :=1;
                end;
              if (form2.CheckBox9.Checked)
                and (ClientDataSet1.FieldByName('视频类型').asstring<>'电视台')  then
                SpeedButton13.Visible:=true;
              ToolButton1.ImageIndex :=1;
              ToolButton1.Tag:=1;
              PopupMenu1.Items[5].Items[0].Caption :='Stop';
              toolbutton1.Hint :='StopKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
              PopupMenu4.Items[5].Caption :='Stop';
            end
            else if toolbutton1.tag=1 then
            begin
                Timer3.Enabled :=false;
                Timer7.Enabled :=false;
                if ToolButton23.Tag =1 then
                  ToolButton23.Click ;
                if ToolButton2.Tag =1 then
                  ToolButton2.Click ;
                      title1:=mp;
                      BASS_ChannelStop(chan);
//                     TrayIcon1.IconIndex:=8;
                  flag:=true;
                  ToolButton2.Tag:=0;
                  ToolButton1.Tag:=0;
                  ToolButton1.ImageIndex :=0;
                  toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
                  PopupMenu4.Items[5].Caption :='Play';
                  PopupMenu1.Items[5].Items[0].Caption :='Play';
            end
          end
          else begin
            if ClientDataSet1.FieldByName('视频类型').AsString ='电视台' then
            begin
            if ToolButton1.Tag=1  then
            begin
               Timer2.Enabled :=False ;
                Timer3.Enabled :=false;
                Timer7.Enabled :=False  ;
                if ToolButton2.Tag =1 then
                  ToolButton2.Click ;
                    title1:=mp;
                      BASS_ChannelStop(chan);
              flag:=true;
                  ToolButton2.Tag:=0;
                  ToolButton1.Tag:=0;
                  ToolButton1.ImageIndex :=0;
                  toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
                  PopupMenu4.Items[5].Caption :='Play';
                  PopupMenu1.Items[5].Items[0].Caption :='Play';
            end
            else  begin

              if (clientdataset1.FieldByName('视频类型').asstring='电视台')  then
                begin
                  BASS_ChannelStop(chan);
                  if form2.checkbox20.checked then
                    Notebook2.pageindex:=4
                  else
                    ShowTv ;

                end;
              end;

            end;
              if ToolButton2.Tag=1 then
              case Application.MessageBox('Recording is working, force exit?', PChar(appname),
                MB_OKCANCEL + MB_ICONINFORMATION) of
                IDOK:
                  begin
                    toolbutton2.Click;
                    BASS_ChannelStop(chan);
                    ToolButton2.Tag:=0;
                    ToolButton1.Tag:=0;
                    ToolButton1.ImageIndex :=0;
                    toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
                   PopupMenu1.Items[5].Items[0].Caption :='Play';
                  end;
                IDCANCEL:
                  begin

                  end;
              end;

          with Form1.ClientDataSet1 do
              begin
                Edit;
                fieldbyname('自定义1').asstring:='Today';
                MergeChangeLog ;
                ApplyUpdates(-1);
                SaveToFile(GetHomePath+ DataBaseFileName);
              end;
          end
    end
    else begin
      MessageBeep(16);
      Application.MessageBox('Play failed, please check the network!', appname, MB_OK +
       MB_ICONSTOP + MB_TOPMOST);
      ToolButton1.Tag:=0;
      ToolButton1.ImageIndex:=0;
      TrayIcon1.IconIndex:=3;
    end;
end;



procedure TForm1.ToolButton22Click(Sender: TObject);
var
  cdsNew : TClientDataset ;
  i,filesize : integer;
  fieldName: string ;
  save:TSaveDialog ;
  data,group:array of string;
 begin
  Application.Minimize;
  with trayicon1 do
                begin
                  Visible:=true;
                  BalloonTitle:=Appname;
                  BalloonHint:='It''s sync,please wait...';
                  BalloonFlags:=bfInfo ;
                  ShowBalloonHint ;
                end;

  form1.TreeView1.Select(form1.TreeView1.Items[0]);
  try
   cdsNew := TClientDataset.Create(application);
   save:=TSaveDialog.Create(nil);
//   save.Filter :='AbroadRadio 收藏夹文件|*.cds';
   try
     Form1.ClientDataSet1.DisableControls ;
     cdsNew.FieldDefs.Assign(Form1.ClientDataSet1.FieldDefs);
     cdsNew.CreateDataset;
     Form1.ClientDataSet1.First;
  while not Form1.ClientDataSet1.eof do
  begin
    if (Form1.ClientDataSet1.FieldByName('收藏').AsString = '★')  then
    begin
      cdsNew.Append;
      for i := 0 to (cdsNew.FieldCount-1) do
      begin
        fieldName := cdsNew.Fields[i].FieldName ;
        cdsNew.FieldByName(fieldName).Value := form1.ClientDataSet1.FieldByName(fieldName).Value;
      end;
      cdsNew.Post;
    end;
//    end;
    Form1.ClientDataSet1.next;
  end;
  finally
    form1.ClientDataSet1.EnableControls ;
  end;
    save.DefaultExt:='cds';
    save.filename:=GetHomePath+'\shoucang.cds';
    cdsNew.SaveToFile(save.FileName);
    with trayicon1 do
                begin
                  Visible:=true;
                  BalloonTitle:=Appname;
                  BalloonHint:='My favorite sync complete!';
                  BalloonFlags:=bfInfo ;
                  ShowBalloonHint ;
                end;
//     end;
  finally
    cdsNew.Free;
    save.Free ;
  end;


try
//Screen.Cursor:=crHourGlass ;
if form1.CheckOffline then
          begin
            form1.ClientDataSet1.filtered:=false;
            form1.ClientDataSet1.filter:='';
            form1.ClientDataSet1.filtered:=True ;
                     form1.Cursor :=crHourGlass;
                     try
                      cdsnew := Tclientdataset.Create(nil);
                      DeleteUrlCacheEntry(PWideChar(website +'download/en/rde.cds'));
                      Form2.idftp1.Connect;
                      Form2.idftp1.ChangeDir('wwwroot/download/cn');
                      FileSize:= Form2.idftp1.Size('rde.cds');
                      Form2.idftp1.Get('rde.cds', PChar(form1.GetShellFolders('Personal')+'\rde.cds'), True);
                               CopyFile(PChar(form1.GetShellFolders('Personal')+'\rde.cds'),PChar(GetHomePath + DataBaseFileName),False);
                               Form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);

//                              screen.Cursor :=crDefault ;
                              DeleteFile(form1.GetShellFolders('Personal')+'\rde.cds');
                              Form2.idftp1.disConnect;
                            finally
                              cdsnew.Free;
                            end;
                          end
                          else begin
                          MessageBeep(16);
                            Application.MessageBox('Sync failed, please check the network!',
                              appname, MB_OK + MB_ICONWARNING);

                          end;
//          end;
//          Screen.Cursor:=crDefault ;
                        except
                          Application.MessageBox('Import error, please check the database file!', appname,
                            MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
                        end;


                            form1.TreeView1.Select(form1.TreeView1.Items[0]);
//  if FileExists(GetHomePath+'\shoucang.cds') then
// begin
     cdsnew:=TClientDataSet.Create(nil);
    form1.ClientDataSet1.Edit ;

      cdsnew.LoadFromFile(GetHomePath+'\shoucang.cds');
  SetLength(data,1000);
  try
    Form1.ClientDataSet1.DisableControls;
  cdsnew.First;
  i := 0;
  while not cdsnew.Eof do
  begin
    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
    cdsnew.Next;
    i := i + 1;
  end;

  for i := 0 to cdsnew.RecordCount - 1 do
  begin
    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
    begin
    Form1.ClientDataSet1.Edit;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';

    Form1.ClientDataSet1.Post;
  end
  else begin
    Form1.ClientDataSet1.Insert ;
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
    Form1.ClientDataSet1.Post;
  end;
    cdsnew.Next ;
  end;

  finally
  form1.ClientDataSet1.EnableControls ;
  cdsnew.Free;
  end;
// end;
 form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.close;

 form1.ClientDataSet1.loadfromfile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.open;
// Application.Restore;
 with trayicon1 do
                begin
                  Visible:=true;
                  BalloonTitle:=Appname;
                  BalloonHint:='Update success!';
                  BalloonFlags:=bfInfo ;
                  ShowBalloonHint ;
                end;
 N20.Click;
  DeleteFile(getHomePath+'\shoucang.cds');
 end;


procedure TForm1.ToolButton25Click(Sender: TObject);
begin
if ToolButton25.Down then
begin
form1.ClientWidth:=1045;
Timer1.Enabled:=true;
end
else begin
form1.ClientWidth:=710;
Timer1.Enabled:=False;
end;
end;

procedure TForm1.ToolButton26Click(Sender: TObject);
begin
if ToolButton26.Down then
begin
ClientDataSet3.Data:=ClientDataSet1.Data;
listentv:=True;
end
else begin

ClientDataSet1.Data:=ClientDataSet3.Data ;
ClientDataSet1.SaveToFile(GetHomePath+ DataBaseFileName);
ClientDataSet1.LoadFromFile(GetHomePath + DataBaseFileName);
ClientDataSet1.Open ;
end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin

if (form2.CheckBox18.checked) and (ToolButton23.Tag=0) then
ToolButton23.click;
RecordRadio ;
end;

procedure TForm1.ToolButton2MouseEnter(Sender: TObject);
begin
if form2.CheckBox18.Checked then
ToolButton2.Hint:='Silence record'
else
ToolButton2.Hint:='Normal record'
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
Form1.N33.Click ;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
var s:Integer;re:Boolean ;
begin
  ClientDataSet1.Edit;
  re:=True ;
  if not ClientDataSet1.Eof  then
  begin
  s:=1;
  if ClientDataSet1.FieldByName('收藏').AsString='' then
      begin
        ClientDataSet1.FieldByName('收藏').AsString:='★';
        s:=ClientDataSet1.RecNo ;
        PopupMenu4.Items[8].Caption :='Remove from favorites';
        toolbutton4.imageindex:=5;
        ToolButton4.hint:='Remove from favorites';
      end
    else begin
      if ClientDataSet1.FieldByName('收藏').AsString='★' then
      begin
        ClientDataSet1.FieldByName('收藏').AsString:='';
        ToolButton4.imageindex:=4;
        ToolButton4.hint:='Add to favorites';
        PopupMenu4.Items[8].Caption :='Add to favorites';
        re:=False ;
      end;
    end;
    ClientDataSet1.MergeChangeLog ;
    ClientDataSet1.ApplyUpdates(-1);
    ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
    ClientDataSet1.Close  ;
    ClientDataSet1.LoadFromFile(GetHomePath + DataBaseFileName);
    ClientDataSet1.open;
    if re then

    clientdataset1.recno:=s;
  end;

end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  form2.loadini;
toolbar3.buttons[7].hint:='Random Genre: '+form2.combobox11.text;
case form2.combobox11.Itemindex  of
0:begin
randplay2('Traffic');
toolbar3.buttons[7].hint:='Random Genre：Traffic';
end;
1:begin
randplay3('Adult Contemporary');
toolbar3.buttons[7].hint:='Random Genre：Adult Contemporary';
end;
2:begin
randplay2('Sports');
toolbar3.buttons[7].hint:='Random Genre：Sports';
end;
3:begin
randplay2('News');
toolbar3.buttons[7].hint:='Random Genre：News';
end;
4:begin
randplay3('Country');
toolbar3.buttons[7].hint:='Random Genre：Country';
end;
5:begin
randplay3('RAP');
toolbar3.buttons[7].hint:='Random Genre：RAP';
end;
6:begin
randplay3('Dance');
toolbar3.buttons[7].hint:='Random Genre：Dance';
end;
7:begin
randplay3('Pop');
toolbar3.buttons[7].hint:='Random Genre：Chinese Pop';

end;
end;
end;

procedure TForm1.ToolButton5ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
//Loadradio ;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
//  Bevel2.Visible :=False ;
//  panel3.visible:=False ;
//   Timer2.Enabled :=False ;
//    Timer3.Enabled :=false;
// if ToolButton9.Tag =1 then
//    ToolButton9.Click ;
//    WindowsMediaPlayer1.controls.stop;
//    FlyFlv1.StopMovie;

//    if ClientDataSet1.FieldByName('电台类型').AsString ='Common' then
//      begin
//        title1:=WindowsMediaPlayer1.URL;
//        WindowsMediaPlayer1.controls.stop;
//      end
//    else begin
//        title9:=FlyFlv1.Movie ;
//        FlyFlv1.StopMovie ;
//    end;
//    flag:=true;
//
//    ToolButton9.Tag:=0;
//    ToolButton1.Tag:=0;
//    ToolButton1.ImageIndex :=0;

end;

procedure TForm1.ToolButton7Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  form13:=TForm13.create(self);
  with form13 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
//     BASS_RecordSetInput(form2.ComboBox5.ItemIndex, 0, 1);
//  rdfile:=false;

end;




function TForm1.TotalRecord: integer;
var client:TClientDataSet;
begin
try
  client:=TClientDataSet.Create(nil);
  client.Data :=ClientDataSet1.Data;
  Client.Filtered :=False;
  Client.Filter := '计划类型 <> ''''';
  Client.Filtered := True;
//  StatusBar1.Panels.Items[0].Text :=#32+'当前电台任务有'+#32+inttostr(client.RecordCount)+#32+'条';
finally
  client.Free;
end;
end;

procedure TForm1.ipv6;
var ARegistry:TRegistry;
begin
ARegistry := TRegistry.Create;
//建立一个TRegistry实例
with ARegistry do
begin
RootKey:=HKEY_LOCAL_MACHINE;
if KeyExists('SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters') then
if OpenKey('SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters',True) then
Writeinteger('DisabledComponents',17);
CloseKey;
Destroy;
end;
end;

function TForm1.IsMBCSChar(const ch: AnsiString): Boolean;
begin
Result:=(ByteType(ch,1) <> mbSingleByte);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var vol: Single;
begin
BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, TrackBar1.Position / TrackBar1.Max);
BASS_ChannelGetAttribute(chan, BASS_ATTRIB_VOL, vol);
TrackBar1.hint:= Format('Volume: %f ', [vol]);

end;



procedure TForm1.TrackBar1Enter(Sender: TObject);
begin
TrackBar1.SetFocus ;
end;

procedure TForm1.TrayIcon1BalloonClick(Sender: TObject);
begin
//if detail  then
//begin
//  if DownloadFile(website+'new.xls',GetHomePath+'\ARO\new.xls') then
//    ShellExecute(0, nil, PChar(GetHomePath+'\ARO\new.xls'), nil, nil, 1);
//
//    end;
//
//  detail :=false;


end;

procedure TForm1.TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft  then
  begin
    TrayIcon1.Visible := True ;
    if Notebook2.ActivePage<>'4' then
    begin
    WebBrowser4.Navigate('http://www.aroplay.com/1.html');
    notebook2.activepage:='Default';
    end;
    form1.Show;
    WindowState := TWindowState(tag);
    SetForegroundWindow(Handle);
  end;
end;

procedure TForm1.TrayIcon2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//if Button=mbRight  then
//ShowMessage('ok');
end;

procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
var i:integer;
  pt:tpoint;
  left1,top1:Integer;
  dr:string;
begin
  combobox2.Text:='';
  Notebook1.PageIndex :=0;

  if Node.Parent <> nil then
  begin
   ClientDataSet1.DisableControls ;
  try
  for i := 0 to TreeView1.Items.Count - 1 do
  begin
    fs:=node.Text ;
    if Node.Parent.Text='Genre' then
    ClientDataSet1.Filter := '电台类别 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Language' then
    ClientDataSet1.Filter := '语言类型 =  ' + QuotedStr(TreeView1.selected.Text)
    else if (Node.Text='Study') or (Node.Text='User' )
       or (Node.Text='Recommend' ) or (Node.Text='English' ) or (Node.Text='Japanese' ) or (Node.Text='Spanish' )
       or (Node.Text='Russian' ) or (Node.Text='German' ) or (Node.Text='Cantonese') or (Node.Text='French') then

    ClientDataSet1.Filter := '电台类别 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Text ='Today' then
     ClientDataSet1.Filter := '自定义1 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Text='TV' then
    clientdataset1.Filter :='视频类型=''电视台'''
    else if Node.Text='China' then
    clientdataset1.Filter :='视频类型=''电视台''and 电台国家=''China'''
    else if Node.Text='Other' then
    clientdataset1.Filter :='视频类型=''电视台''and 电台国家<>''China'''
    else if Node.Parent.Text='Europe' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台国家 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Chinese Radio' then
    ClientDataSet1.Filter := '视频类型<>''电视台''and 自定义2 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Language' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 语言类型 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Genre' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台类别 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Asia' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台国家 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Oceania' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台国家 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='Africa' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台国家 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='America' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 电台国家 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Parent.Text='China' then
    ClientDataSet1.Filter := '视频类型=''电视台''and 自定义2 =  ' + QuotedStr(TreeView1.selected.Text);

    if (Node.Text='TV') then
    clientdataset1.Filter :='视频类型=''电视台''';

    if (Node.Text='All Stations') then
    begin
    clientdataset1.Filtered :=False ;
    clientdataset1.Filter :='';
    clientdataset1.Filtered :=True ;
    end;


    if Node.Text='Chinese Radio' then
    clientdataset1.Filter :='视频类型<>''电视台''and 电台国家=''China'''
    else if Node.Text='China' then
    clientdataset1.Filter :='视频类型=''电视台''and 电台国家=''China'''
    else if Node.Text='Europe' then
    clientdataset1.Filter :='视频类型=''电视台''and 自定义2='+ QuotedStr(TreeView1.selected.Text)
    else if Node.Text='Asia' then
    clientdataset1.Filter :='视频类型=''电视台''and 自定义2='+ QuotedStr(TreeView1.selected.Text)
    else if Node.Text='Oceania' then
    clientdataset1.Filter :='视频类型=''电视台''and 自定义2='+ QuotedStr(TreeView1.selected.Text)
    else if Node.Text='America' then
    clientdataset1.Filter :='视频类型=''电视台''and 自定义2='+ QuotedStr(TreeView1.selected.Text)
    else if Node.Text='Africa' then
    clientdataset1.Filter :='视频类型=''电视台''and 自定义2='+ QuotedStr(TreeView1.selected.Text)
    else if (Node.Text='User')  then
    ClientDataSet1.Filter := '电台类别 =  ' + QuotedStr(TreeView1.selected.Text)
    else if Node.Text ='Today' then
     ClientDataSet1.Filter := '自定义1 =  ' + QuotedStr(TreeView1.selected.Text);

//    end;



    if Node.Parent.Text =TreeView1.Items[0].Text then
    ClientDataSet1.Filter := '电台分组 =  ' + QuotedStr(TreeView1.selected.Text);
    ClientDataSet1.Filtered := True;
//    Label14.caption:=' 已找到电台数:'+#32+inttostr(clientdataset1.recordcount);
//     SetScrollRange(DBGrid1.Handle, SB_VERT, 0, 0, True );
//     ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
    DBGrid1CellClick(DBGrid1.Columns[1]);

  end;
  finally
  ClientDataSet1.EnableControls ;
  end;
  end
  else ClientDataSet1.Filtered := False;

      if Node.Text ='每日听力' then
      begin
//      Notebook2.PageIndex :=1;
      Application.MessageBox('此项功能正在开发中,敬请期待!', appname, MB_OK +
            MB_ICONINFORMATION);
//      TreeView1.Select(TreeView1.Items[0]);
      end;


//     if regeditaro and
//      (ClientDataSet1.RecordCount =0) and ((Node.Text ='PG18+') ) then
//      begin
//        case
//          Application.MessageBox('是否需更新下载PG18+电视台?',
//          PChar(appname), MB_OKCANCEL + MB_ICONINFORMATION) of
//          IDOK:
//            begin
////              form1.PG181.Click ;
//            end;
//          IDCANCEL:
//            begin
////              form1.N20.Click;
////              TreeView1.Select(TreeView1.Items[0]);
//            end;
//        end;
//   end;
//      else begin
//      if ( or (Node.Text ='深夜剧'))  and
//      (ClientDataSet1.RecordCount =0) then
//        begin
//          case Application.MessageBox('为了查看相关的电台内容,您需要购买注册版。 您想现在就查看PG18+等电视台明细么? ', appname,
//            MB_OKCANCEL) of
//            IDOK:
//              begin
//                form2.Notebook1.PageIndex :=8;
//                Form2.ShowModal ;
//                shellExecute(handle,'open',PChar('http://abroadradio.net/screen.html'),nil,nil,SW_NORMAL);
//              end;
//
//            IDCANCEL:
//              begin
//                TreeView1.Select(TreeView1.Items[0]);
//              end;
//          end;
//
//        end;
//        end;

//      if regeditaro and  (node.Text ='报刊杂志') then
//      begin
//      DeleteUrlCacheEntry(website);
//      Keycode('https://www.abroadradio.net');
//      Notebook2.PageIndex :=2;
////      form1.ClientWidth:=710;
//      BitBtn1.Click;
////      WebBrowser2.Navigate(website+'/book/index.html');
//      end;

      if regeditaro and (node.Text ='Kindle') then
      begin
//      DeleteUrlCacheEntry(website);
      Notebook2.PageIndex :=3;

      form2.loadkindle;
//      form1.ClientWidth:=710;
      BitBtn1.Click;
      label16.caption:=Form2.ComboBox7.Items[Form2.ComboBox7.ItemIndex];
//      ComboBox4.OnChange(self);
//       if form2.ComboBox4.Enabled  then
//        label16.caption:=form2.ComboBox4.text+form2.edit4.text
//      else
//        label16.caption:=form2.Edit4.text;

      end;

//      if (node.Text ='Newsletter') then
//      begin
//        form15:=TForm15.create(self);
//        Left1:=self.Left + 80;
//        Top1:= self.Top+40;
//        with form15 do
//          begin
//            left:=Left1;
//            Top:=Top1;
//            FormStyle:=fsStayOnTop;
//            ShowModal ;
//          end;
//        TreeView1.Select(TreeView1.Items[0]);

//      end;

      if (Node.Text ='My Country') then
      begin
        ClientDataSet1.Filtered :=False;
        clientdataset1.filteroptions:=[foCaseInsensitive];
        ClientDataSet1.Filter :='电台国家 ='+#39+trim(Form2.ComboBox13.text)+'*'+#39;
        ClientDataSet1.Filtered :=True;
      end;
//
//      if ((Node.Text ='报刊杂志') or (Node.Text ='本地媒体')
//      or (Node.Text ='PG18+') or (node.Text ='Kindle'))and
//      not regeditaro  then
//        begin
////          MessageBeep(16);
//          form1.N20.Click ;
//          with Form1.TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:='为了查看相关内容,您需要购买注册版!';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//
//
////       TreeView1.Select(TreeView1.Items[0]);
////          case Application.MessageBox('为了查看相关内容,您需要购买注册版。 您想现在购买注册版么? ', appname,
////            MB_OKCANCEL) of
////            IDOK:
////              begin
////                form2.Notebook1.ActivePage :='8';
////                Form2.ShowModal ;
////              end;
////
////            IDCANCEL:
////              begin
////                TreeView1.Select(TreeView1.Items[0]);
////              end;
////          end;
//
//        end;

      if (Node.Text ='Root') and (node.Parent.Text ='My Favorite') then
      begin
        ClientDataSet1.Filtered :=False;
        ClientDataSet1.Filter := '收藏 =  ' + QuotedStr('★');
        ClientDataSet1.Filtered :=True ;
        DBGrid1CellClick(DBGrid1.Columns[1]);
      end;

    if Node.Text='My Favorite' then
      begin
        ClientDataSet1.Filtered :=False;
        ClientDataSet1.Filter :='收藏 =  ' + QuotedStr('★')+' or 电台分组 <>'+#39+#39'';
        ClientDataSet1.Filtered := True;
        DBGrid1CellClick(DBGrid1.Columns[1]);
      end;


      if (TreeView1.Selected.Text ='My Favorite') or
       (TreeView1.Selected.Text ='Root') then
        begin
          PopupMenu4.Items[8].Caption :='Remove from the favorites';
        end
      else  begin
          PopupMenu4.Items[8].Caption :='Add to my favorite';
      end;

//       if (Node.Text ='今日收听') and (ClientDataSet1.RecordCount <>0)  then
//          PopupMenu4.Items[3].Enabled:=True
//      else
//          PopupMenu4.Items[3].Enabled:=False;



      if (Node.Text ='User') and
      (ClientDataSet1.RecordCount =0) then
        begin
          case Application.MessageBox('Hi,guys.Do you want to add your station now?', appname,
            MB_OKCANCEL) of
            IDOK:
              begin

//                TreeView1.Select(TreeView1.Items[0]);
//                ClientDataSet1.Filter := '';
//                ClientDataSet1.Filtered := True;
                ShowUser ;

              end;
            IDCANCEL:
              begin
//                PopupMenu4.Items[10].Enabled:=false;
//                treeview1.items[0].selected := true;
//                treeView1.items[0].Expanded := true;
//                TreeView1.Select(TreeView1.Items[0]);
              end;
          end;

        end;

      if (node.Text='Language') or (node.Text='Genre')  then
      begin
        Notebook1.PageIndex :=0;
        ClientDataSet1.Filtered :=False;
        ClientDataSet1.Filter := '';
        ClientDataSet1.Filtered := True;
      end;

      if (Node.Text ='User') and
      (ClientDataSet1.RecordCount >0) then
      begin
        PopupMenu4.Items[10].Enabled :=True;
      end
      else begin
        PopupMenu4.Items[10].Enabled :=False ;
      end;

      if node.Text ='Schedule' then
      begin
        Notebook1.PageIndex :=1;
        TDateField(DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
        TDateField(DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
        ClientDataSet1.Filtered :=False;
        ClientDataSet1.Filter := '计划类型 <> ''''';
        ClientDataSet1.Filtered := True;
        ToolBar2.Enabled :=false;
        ToolBar1.Enabled :=False;
        ToolBar3.Enabled :=False;
        TrackBar1.Enabled :=false;
        PopupMenu5.Items[0].Tag:=1;
        combobox2.Enabled :=false;
        trackbar1.Enabled :=false;
//        if ClientDataSet1.RecordCount =0 then
//        begin
//          Application.MessageBox('当前记录为空，请重新添加！', appname, MB_OK +
//            MB_ICONINFORMATION + MB_TOPMOST);
//            TreeView1.Select(TreeView1.Items[0]);
//          ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
//        end;
      end
      else begin
          PopupMenu5.Items[0].Tag:=0;
          ToolBar2.Enabled :=true;
          ToolBar1.Enabled :=true;
          combobox2.Enabled :=True ;
          ToolBar3.Enabled :=true;
          TrackBar1.Enabled :=true;
      end;
//     ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
end;


procedure TForm1.TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  node: TTreeNode;
begin
//  if not Boolean(TreeView1.Items) then Exit; {如果 TreeView1 无内容}
  node := TreeView1.Selected;
  if (node<>nil) and (node.Parent<>nil) and ((node.Parent.Text=TreeView1.Items[0].Text)  ) then
    PopupMenu2.AutoPopup :=True
  else
    PopupMenu2.AutoPopup :=False;


end;

procedure TForm1.TreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
  var
  Node: TTreeNode;
begin
  Node := TreeView1.GetNodeAt(X, Y);
  if not form1.ClientDataSet1.Eof  then
    begin
      with Form1.ClientDataSet1 do
      begin
        Edit;
        fieldbyname('电台分组').asstring:=node.Text;
        fieldbyname('收藏').asstring:='★';
        MergeChangeLog ;
        ApplyUpdates(-1);
        SaveToFile(GetHomePath + DataBaseFileName);
//        Close ;
        Open ;
     end;
          Form1.TreeView1.Select(Form1.TreeView1.Items[0]);

  if Assigned(Node) then
    Node.Expand(True);
end;
end;

procedure TForm1.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
    node: TTreeNode;
begin
    node := TreeView1.GetNodeAt(X, Y);
   // node.Level 是节点的层级，等于0时，表示是根节点(没有上级节点了)
   // 本语句控制只能将节点拖动到与父节点平级的其他节点上，Accept表示，是否可释放
   if (node<>nil) and (node.Parent<>nil) and (node.Parent.Text='My Favorite') and (node.AbsoluteIndex<>1)then
       Accept := True
   else
       Accept := False;
end;


procedure TForm1.TreeView1Enter(Sender: TObject);
begin
  form1.KeyPreview :=False;
//  label8.visible:=false;
end;

procedure TForm1.TreeView1Exit(Sender: TObject);
begin
  Form1.KeyPreview :=true;
end;

procedure TForm1.TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
Node.SelectedIndex:=Node.ImageIndex;

end;

procedure TForm1.TreeView1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ndTemp:TTreeNode;
begin
  ndTemp:=TreeView1.GetNodeAt(X, Y);
  if Assigned(ndTemp) then
    ndTemp.Selected:=True;
end;

//procedure TForm1.UpdateDB;
//var
// MyStream:TMemoryStream; clidataset:TClientDataSet;
// number:Integer ;
//begin
//  MyStream:=TMemoryStream.Create;
//  clidataset :=TClientDataSet.Create(Self);
//if Form1.CheckOffline  then
//begin
//        if StrToInt(netmobi) > StrToInt(trim(Form2.labelededit2.Text)) then
//        begin
//            try
//              if form1.DownloadFile(website+'update.cds',GetHomePath+'\ARO\update.cds') then
//              form1.ClientDataSet1.edit;
//              clidataset.LoadFromFile(GetHomePath+'\ARO\update.cds');
//              clidataset.Edit;
//              number:=clidataset.RecordCount ;
//
//              form1.ClientDataSet1.AppendData(clidataset.Data,False);
//              with form1.trayicon1 do
//                begin
//                  Visible:=true;
//                  BalloonTitle:=Appname+'新增加了'+inttostr(number)+'个电台';
//                  BalloonHint:='点击查看详细电台清单...';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                  form1.detail:=true;
//                end;
//              form2.LabeledEdit2.Text:=netmobi;
//              form1.ClientDataSet1.MergeChangeLog ;
//              form1.ClientDataSet1.ApplyUpdates(-1);
//              form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
//              form1.ClientDataSet1.Close;
//              form1.ClientDataSet1.LoadFromFile(GetHomePath+ DataBaseFileName);
//              form1.ClientDataSet1.Open;
////              form1.Label14.caption:=' 已找到电台数:'+#32+inttostr(form1.clientdataset1.recordcount);
//              Form2.saveini;
//              form1.DBGrid1.SetFocus ;
//              finally
//                MyStream.Free;
//                clidataset.Free;
//            end;
//        end
//        else begin
//          with Form1.TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:='当前数据库版本为最新版本!';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//        end;
//
////  end;
//end
//else  begin
//MessageBeep(16);
//Application.MessageBox('更新失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;
//end;


procedure TForm1.UpdateInputInfo;
//var
//  _type: string;
//  it: integer;
//  level: Single;
begin
//  it := BASS_RecordGetInput(input, level); // get info on the input
//  case (it and BASS_INPUT_TYPE_MASK) of
//    BASS_INPUT_TYPE_DIGITAL: _type := 'digital';
//    BASS_INPUT_TYPE_LINE: _type := 'line-in';
//    BASS_INPUT_TYPE_MIC: _type := 'microphone';
//    BASS_INPUT_TYPE_SYNTH: _type := 'midi synth';
//    BASS_INPUT_TYPE_CD: _type := 'analog cd';
//    BASS_INPUT_TYPE_PHONE: _type := 'telephone';
//    BASS_INPUT_TYPE_SPEAKER: _type := 'pc speaker';
//    BASS_INPUT_TYPE_WAVE: _type := 'wave/pcm';
//    BASS_INPUT_TYPE_AUX: _type := 'aux';
//    BASS_INPUT_TYPE_ANALOG: _type := 'analog';
//  else
//    _type := 'undefined';
//  end;
//  Form1.lLevel.Caption := _type; // display the type
end; //UpdateInputInfo

procedure TForm1.VistaMute(value: Double);
var
  deviceEnumerator: IMMDeviceEnumerator;
  defaultDevice: IMMDevice;
  endpointvolume: IAudioEndpointvolume;
  VolumeLevel: Single;
begin
  CoCreateInstance(CLASS_IMMDeviceEnumerator, nil, CLSCTX_INPROC_SERVER, IID_IMMDeviceEnumerator, deviceEnumerator);
  deviceEnumerator.GetDefaultAudioEndpoint(eRender, eConsole, defaultDevice);
  defaultDevice.Activate(IID_IAudioEndpointvolume, CLSCTX_INPROC_SERVER, nil, endpointvolume);
  if endpointvolume = nil then Exit;
  endpointvolume.SetMasterVolumeLevelScalar(value, nil);
  endpointvolume.SetMute(false,nil);
end;



//procedure TForm1.weekplay;
//var
//Found: Boolean; s1:string;
//begin
//  Found := False;
//  ClientDataSet2.DisableControls;
//    try
//      clientdataset2.edit;
//      ClientDataSet2.First;
//        while (not ClientDataSet2.Eof)and (not Found) do
//        begin
//            if (ClientDataSet2.FieldByName('周期').asstring<>'')  and (FormatDateTime('dddd',now)=ClientDataSet2.FieldByName('周期').asstring)
//             and (FormatDateTime('hh:mm:ss',ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now)) then
//            begin
//              Found := True;
//              title5:=ClientDataSet2.FieldByName('电台名称').asstring;
//              s2:=ClientDataSet2.FieldByName('完成动作').asstring;
//              i:=ClientDataSet2.FieldByName('间隔').asinteger;
//              rdfile :=true;
//              DBGrid1CellClick(DBGrid1.Columns[1]);
//              Break;
//            end;
//            ClientDataSet2.Next;
//        end;
//    finally
//        ClientDataSet2.EnableControls;
//    end;
//    if not ClientDataSet2.Eof  then
//    begin
//      s1:=ClientDataSet2.FieldByName('计划类型').asstring;
//
//      if s1='定时播放' then
//      begin
//        if WindowsMediaPlayer1.isOnline  then
//          begin
//             WindowsMediaplayer1.controls.stop ;
//             FlyFlv1.StopMovie ;
//             Timer2.Enabled :=True;
//             if ClientDataSet2.FieldByName('电台类型').asstring='普通电台' then
//                begin
//                  WindowsMediaplayer1.controls.stop ;
//                  WindowsMediaPlayer1.URL:=ClientDataSet2.FieldByName('电台地址').asstring;
//                  WindowsMediaPlayer1.controls.play;
//                  playstatus :=3;
//                end
//                else begin
//                  FlyFlv1.StopMovie;
//                  FlyFlv1.PlayMovie(ClientDataSet2.FieldByName('电台地址').asstring);
//                  d:=Now;
//                  playstatus :=6;
//                end;
//              with TrayIcon1 do
//                begin
//                  BalloonTitle :=appname+' 提示:';
//                  BalloonHint:='已启动 --'+#32+ClientDataSet2.FieldByName('计划类型').asstring+#32+title5;
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//              Timer3.Enabled :=true;
//              if Form2.CheckBox8.Checked  then
//              OpenVolumn ;
//          end
//         else
//          Application.MessageBox('播放错误，请查看是否系统已联网，或关闭迅雷等下载软件后再试！', appname, MB_OK +
//            MB_ICONSTOP + MB_TOPMOST);
//      end;
//
//      if s1='播放并录音' then
//      begin
//        if WindowsMediaPlayer1.isOnline  then
//          begin
//                WindowsMediaplayer1.controls.stop ;
//                FlyFlv1.StopMovie ;
//                Timer2.Enabled :=True;
//                if ClientDataSet2.FieldByName('电台类型').asstring='普通电台' then
//                begin
//                   WindowsMediaplayer1.controls.stop ;
//                   WindowsMediaPlayer1.URL:=ClientDataSet2.FieldByName('电台地址').asstring;
//                   WindowsMediaPlayer1.controls.play;
//                   playstatus :=3;
//                end
//                else begin
//                  FlyFlv1.StopMovie ;
//                  FlyFlv1.PlayMovie(ClientDataSet2.FieldByName('电台地址').asstring);
//                  d:=Now;
//                  playstatus :=6;
//                end;
//
//                if CheckdirectoryName  then
//                  begin
//                    Arecord ;
//                    with TrayIcon1 do
//                      begin
//                        BalloonTitle :=appname+' 提示:';
//                        BalloonHint:='已启动 --'+#32+ClientDataSet2.FieldByName('计划类型').asstring+#32+title5;
//                        BalloonFlags:=bfInfo ;
//                        ShowBalloonHint ;
//                      end;
//                    Timer3.Enabled :=true;
//                    Timer5.Enabled :=True;
//                  end
//                else begin
//                    Application.MessageBox('录音出错！当前录音目录为空或者不存在,请选择“录音设置”标签,重新进行设置.',appname,MB_OK +
//                      MB_ICONINFORMATION +MB_TOPMOST);
//                    Form2.ShowModal ;
//                    form2.PageControl1.TabIndex :=2;
//                end;
//          end;
//            if Form2.CheckBox8.Checked  then
//              OpenVolumn
//         else
//          Application.MessageBox('播放错误，请查看是否系统已联网，或关闭迅雷等下载软件后再试！', appname, MB_OK +
//            MB_ICONSTOP + MB_TOPMOST);
//      end;
//    end;
//end;

procedure TForm1.WebBrowser2DownloadComplete(Sender: TObject);
//var url:string;
begin
//  if url=website+'/book/index.html' then
//  begin
//    WebBrowser2.oleobject.Document.body.style.width:= '668px';
//    WebBrowser2.oleobject.Document.body.style.height:= '477px' ;
//    WebBrowser2.oleobject.Document.body.style.overflow:= 'hidden';
//  end;
end;

procedure TForm1.WebBrowser3DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
begin
//WebBrowser3.oleobject.Document.body.Scroll:= 'no';
end;

procedure TForm1.WebBrowser3DownloadComplete(Sender: TObject);
//var url:string;
begin
//  if url=website+'/book/index1.html' then
//  begin
//    WebBrowser3.oleobject.Document.body.style.width:= '600px';
//    WebBrowser3.oleobject.Document.body.style.height:= '356px' ;
//    WebBrowser3.oleobject.Document.body.style.overflow:= 'hidden';
//    WebBrowser3.oleobject.Document.body.Scroll:= 'no';
//  end;
end;

procedure TForm1.WebBrowser4Enter(Sender: TObject);

begin
//  GetCursorPos(Point);
//  form1.Caption :=IntToStr(Mouse.CursorPos.Y);
//  if Mouse.CursorPos.Y <89 then
//  Panel26.Visible:=true
//  else
//  Panel26.Visible:=False ;
end;




//procedure TForm1.WMHotkeyHandle(var Msg: TMessage);
//begin
//if (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
//begin
//    if (Msg.LParamHi = K) and (msg.lparamLo = 0) then
//    begin
//      Msg.Result := 1;
//      PopupMenu1.Items[5].Items[3].Click ; //单键静音
//
//    end;
//
//     if (Msg.LParamHi = l) and (msg.lparamLo = 0) then
//    begin
//      Msg.Result := 1;
//      PopupMenu1.Items[6].Click;    //单键录音
//    end;
//end;

//if Form7.Active then
//begin
//     if (msg.LParamLo=MOD_CONTROL) and (msg.LParamHi=$81) then
//      begin
//        Msg.Result := 1;
//    ShowMessage('Ctrl + Q ');
//        form1.ButtonedEdit1RightButtonClick(nil);
//          SpeedButton5Click(Self);
//        Form7.SpeedButton15Click(nil);
//      SpeedButton5.Click;
//        Form7.speedbutton15.Click ;    //视频窗口置顶
//    PopupMenu1.Items[5].Items[8].Click ;
//     end;

//     if  form7.Active then  begin
//       if (msg.LParamLo=MOD_CONTROL ) and (msg.LParamHi=80) then
//       Form7.Stayon ;
//     end;
//       begin
//       Form7.SpeedButton15Click(Self);
//       end;
//       ShowMessage('');
//       end;
//end;


//else
//ShowMessage('');
//    if form1.Active then  begin
//      if (msg.LParamLo=MOD_control) and (msg.LParamHi=81) then
//       begin
//        form1.ButtonedEdit1RightButtonClick(nil);
//       end;
//
//       if (msg.LParamLo=MOD_alt) and (msg.LParamHi=80) then
//       begin
//        speedbutton5.click;
//       end;
//    end;

//    if  form1.Active then  begin

//      if  (msg.LParamHi=VK_F1) then
//         ShowMessage('VK_F1');


//       if (msg.LParamLo=MOD_CONTROL) and (msg.LParamHi=49) then
//       begin
//       ShowMessage('Ctrl + 1 ');
//       end;


//    UnRegisterHotKey(handle,ID1);
//    UnRegisterHotKey(handle,ID);



//end;

//function TForm1.WMP: Boolean;
//begin
//  case WindowsMediaPlayer1.playState  of
//    1..12:Result:=True
//    else
//    Result :=False ;
//  end;
//end;


procedure TForm1.WMQueryEndsession(var Message: TMessage);
begin
inherited;
  _FClosing := True;
  Message.Result := 1;
//  Close;
end;



procedure TForm1.AdjustToken;
var
  tmpLuid: Int64;
  tkp, tkpNewButIgnored: TOKEN_PRIVILEGES;
  Privilege: array[0..0] of LUID_AND_ATTRIBUTES;
  hdlProcessHandle, lBufferNeeded: Cardinal;
  hdlTokenHandle:THandle ;
begin
//  hdlProcessHandle:= GetCurrentProcess;
  OpenProcessToken(GetCurrentProcess, (TOKEN_ADJUST_PRIVILEGES Or TOKEN_QUERY), hdlTokenHandle);
  LookupPrivilegeValue('', 'SeShutdownPrivilege', tmpLuid);
  Privilege[0].Luid:= tmpLuid;
  Privilege[0].Attributes:= SE_PRIVILEGE_ENABLED;
  tkp.PrivilegeCount:= 1;
  tkp.Privileges[0]:= Privilege[0];
  AdjustTokenPrivileges(hdlTokenHandle, False, tkp, Sizeof(tkpNewButIgnored), tkpNewButIgnored, lBufferNeeded);
end;






procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
with Msg do
begin
  if not IsChild(WebBrowser2.Handle, hWnd) then  Exit;
   Handled := (message = WM_RBUTTONDOWN) or (message = WM_RBUTTONUP) or (message = WM_CONTEXTMENU);

//  if not IsChild(WebBrowser3.Handle, hWnd) then  Exit;
//   Handled := (message = WM_RBUTTONDOWN) or (message = WM_RBUTTONUP) or (message = WM_CONTEXTMENU);

end;
end;

procedure TForm1.Arecord;
begin
//  BASS_RecordSetInput(form2.ComboBox5.ItemIndex, 0, 1);
//  if toolbutton2.tag=1 then
//  begin
//    if rdfile  then
//      Form1.AudioRecord1.FileName:=Form2.LabeledEdit1.Text+'\'+title5+' -'+FormatDateTime('yyyy-mm-dd-hh:nn:ss',now)
//    else
//      Form1.AudioRecord1.FileName:=Form2.LabeledEdit1.Text+'\'+title2+' -'+FormatDateTime('yyyy-mm-dd-hh:nn:ss',now);
//      form1.AudioRecord1.Open ;
////      Form1.Timer5.Enabled :=True;
//
//  end
//  else
//  if ToolButton2.Tag=0 then
//    begin
//      form1.AudioRecord1.Close ;
////      Form1.Timer5.Enabled :=false;
//
//
////  if (rchan = 0) then
////  begin
////    form1.StartRecover;
////    Form1.Timer5.Enabled :=True;
////  end
////  else begin
////    form1.StopRecover ;
////    form1.Timer5.Enabled :=false;
////    form1.LabeledEdit2.Text :='';
//
//  end;
  end;
//  BASS_RecordSetInput(ComboBox1.ItemIndex, 0, 1);
//          if BASS_ChannelIsActive(rchan) <> 0 then
//            begin
//              form1.StopRecover;
//              form1.Timer5.Enabled :=False;
//              Form1.Timer3.Enabled :=False;
//              form1.LabeledEdit2.Text:='';
//              Form1.SaveRecover ;
//            end
//		      else begin
//              Form1.StartRecover;
//              form1.Timer5.Enabled :=True;
//              Form1.current:=StrToTime('00:00:00');
//
//          end;
//          SaveRecover ;



//procedure TForm1.AutoUpdate;
//var left1,top1:Integer;
//begin
//  try
//    if DownloadFile(website+'update.xml',GetShellFolders('Personal')+'\ARO'+'\' + 'update.xml')then
//      begin
//        XMLDocument1.LoadFromFile(GetShellFolders('Personal')+'\ARO'+'\' + 'update.xml');
//        if StrToInt(XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text) > StrToInt(GetBuildInfo) then
//          begin
//            Left1:=self.Left + 180;
//            Top1:= self.Top+140;
//            Form4:=TForm4.Create(Self);
//              with form4 do
//                begin
//                  left:=Left1;
//                  Top:=Top1;
//                  FormStyle:=fsStayOnTop;
//                  ShowModal ;
//                end;
//          end
//          else
//               DeleteFile(GetShellFolders('Personal')+'\ARO'+'\' + 'update.xml');
//      end;
//  except
//     Application.MessageBox('更新出错,请检查是否联网或稍后再试！', appname, MB_OK +
//        MB_ICONINFORMATION + MB_TOPMOST);
//end;
//end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if ToolButton25.Down then
begin
form1.ClientWidth:=710;
ToolButton25.down:=false;
end;
//GroupBox1.Visible:=not GroupBox1.Visible;
end;

procedure TForm1.BitBtn1KeyPress(Sender: TObject; var Key: Char);
begin
// if Key=#49  then
//   ShowMessage('ddfd');
end;




procedure TForm1.BitBtn2Click(Sender: TObject);
begin
//Form4.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
//windowsmediaplayer2.controls.play;
//timer6.enabled:=true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

//showmessage(inttostr(treeview1.items.AbsoluteIndex));
//  TreeView1.Select(TreeView1.Items[95]);
end;




procedure TForm1.ButtonedEdit2DblClick(Sender: TObject);
begin
//ButtonedEdit2.Text:='';
end;

procedure TForm1.ButtonedEdit2KeyPress(Sender: TObject; var Key: Char);
//var i:integer;
begin
//if key=#13  then
//  for i := 0 to treeview1.items.count do
//begin
//try
//    if treeview1.items[i].text = ButtonedEdit2.Text  then
//    begin
//      treeview1.items[i].selected := true;
//      treeView1.items[i].Expanded := true;
//      break;
//    end;
//except
//    Application.MessageBox('未找到相关内容，请确认是否填写完整！', appname, MB_OK +
//            MB_ICONSTOP + MB_TOPMOST);
//end;
//end;
end;

function TForm1.ChangeProxy(const Proxy, Port, ByPass: string;
  const bEnabled: boolean): boolean;
var
        reg: Tregistry;
        info: INTERNET_PROXY_INFO;
        Fproxy: string;
      begin
        Result := False;
        FProxy :=Format('%s:%s',[Proxy,Port]);
        reg :=Tregistry.Create;
        try
          reg.RootKey :=HKEY_CURRENT_USER;
          if reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', True) then
          begin
            reg.Writestring('ProxyServer', Fproxy);
            reg.WriteInteger('ProxyEnable', integer(bEnabled));
            info.dwAccessType :=INTERNET_OPEN_TYPE_PROXY;
            info.lpszProxy :=PAnsiChar(proxy);
            info.lpszProxyBypass :=PAnsiChar(ByPass);
            InternetSetOption(nil, INTERNET_OPTION_PROXY, @info, SizeOf(Info));
            InternetSetOption(nil, INTERNET_OPTION_SETTINGS_CHANGED, nil, 0);
            Result:=True;
          end
        finally
          reg.CloseKey;
          reg.free;
        end;
      end;




procedure TForm1.CheckBox1Click(Sender: TObject);
begin
ComboBox3.Enabled:=CheckBox1.Checked;
end;

function TForm1.CheckdirectoryName: Boolean;
begin
//if (Form2.LabeledEdit1.Text<>'') and (DirectoryExists(Form2.LabeledEdit1.Text)) then
//    begin
//      MkDir(ExtractFilePath(Application.ExeName)+'\Records');
//      Form2.ShowModal ;
//      form2.PageControl1.TabIndex :=2;
//      Result :=True ;
//    end
//    else
  Result:=(Form2.LabeledEdit1.Text<>'') and (DirectoryExists(Form2.LabeledEdit1.Text))
end;

procedure TForm1.checkupdate;
var left1,top1:Integer;
begin
//  try
    if DownloadFile(website+'update.xml',GetHomePath+'\ARO\update.xml')then
      begin
        XMLDocument1.LoadFromFile(GetHomePath+'\ARO\update.xml');
        if StrToInt(XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text) > StrToInt(GetBuildInfo) then
          begin
            Left1:=self.Left + 180;
            Top1:= self.Top+140;
            Form4:=TForm4.Create(Self);
              with form4 do
                begin
                  left:=Left1;
                  Top:=Top1;
                  FormStyle:=fsStayOnTop;
                  ShowModal ;
                end;
//          end
//          else begin
//              with TrayIcon1 do
//                begin
//                  BalloonTitle :=appname+' 提示:';
//                  BalloonHint:='当前程序为最新版本!';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//               DeleteFile(GetShellFolders('Personal')+'\ARO'+'\' + 'update.xml');
          end;
      end;
//  except
//     Application.MessageBox('更新出错,请检查是否联网或稍后再试！', appname, MB_OK +
//        MB_ICONINFORMATION + MB_TOPMOST);
//  end;

end;



procedure TForm1.Choosepicture(const Picture: string);
 const
  DownUrl = 'https://www-x-abroadradio-x-net.img.abc188.com/book/img/'; {要下载的文件}
var
  stm: TMemoryStream;
  png: Tpngimage;
begin
try
  stm := TMemoryStream.Create;
  IdHTTP1.Get(downurl+picture, stm);
  stm.Position := 0;
  png := TpngImage.Create;
  png.LoadFromStream(stm);
  Image4.Picture.Graphic := png;
finally
  png.free;
  stm.Free;
end;
  IdHTTP1.Disconnect;
end;

procedure TForm1.CICIvoice;
var
  rs: TResourceStream;
begin
  rs := TResourceStream.Create(HInstance, 'sound1', 'WAVE');
  sndPlaySound(rs.Memory, SND_ASYNC or SND_MEMORY);
  rs.Free;

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
//try
//  ClientDataSet1.DisableControls;
//  TreeView1.Select(TreeView1.Items[0]);
//  TThread.CreateAnonymousThread(findstation).Start ;
//  if ComboBox1.Text<>'' then
//  begin
//  ClientDataSet1.Filtered :=False;
//  case ComboBox3.ItemIndex  of
//    0:ClientDataSet1.Filter :='电台名称 ='+#39+combobox1.text+'*'+#39;
//    1:ClientDataSet1.Filter :='电台国家=' +QuotedStr(ComboBox1.text) ;
//    2:ClientDataSet1.Filter :='语言类型=' +QuotedStr(ComboBox1.text) ;
//  end;
//  ClientDataSet1.Filtered := True;
//  Label4.Caption :='当前电台数:'+#32+IntToStr(ClientDataSet1.RecordCount);
//  if ComboBox1.Text='' then

//end
//  else begin
//    ClientDataSet1.Filtered :=False;
//    Label4.Caption :='当前电台数:'+#32+IntToStr(ClientDataSet1.RecordCount);
//  end;
//finally
//  clientdataset1.EnableControls;
//end;

end;








procedure TForm1.ComboBox2Change(Sender: TObject);
begin

try
  ClientDataSet1.DisableControls;
  if ComboBox2.Text<>'' then
  begin
    N20.Click;
    ClientDataSet1.Filtered :=False;
    if not IsMBCSChar(ComboBox2.Text)  then    //如果不是中文
    begin
      clientdataset1.filteroptions:=[foCaseInsensitive];
      ToolButton18.Enabled:=True ;
//      if not ToolButton18.down then
        if not ToolButton18.down then

        ClientDataSet1.Filter :='电台名称 ='+#39+trim(ComboBox2.text)+'*'+#39
        else
        ClientDataSet1.Filter :=getfilter;

//      else
//        ClientDataSet1.Filter :='视频类型=''电视台''and 电台名称 ='+#39+trim(ComboBox2.text)+'*'+#39;
//      ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
    end
    else begin     //如果是中文
      clientdataset1.filteroptions:=[];
      ToolButton18.Enabled:=false ;
        ClientDataSet1.Filter:='电台名称 like'+ quotedstr('%'+ComboBox2.text+'%')+'or 语言类型 like'+ quotedstr('%'+ComboBox2.text+'%')+ 'or 电台国家 like'+ quotedstr('%'+ComboBox2.text+'%')
        + 'or 电台类别 like'+ quotedstr('%'+ComboBox2.text+'%') +'or 自定义2 like'+ quotedstr('%'+ComboBox2.text+'%')

      end;

  end
   else  begin
      ToolButton18.enabled:=False ;
      ClientDataSet1.Filtered := False ;
      clientdataset1.Filter :='';
      clientdataset1.Filtered :=True ;
      ComboBox2.Color:=clwhite;
//      ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
  end;

  ClientDataSet1.Filtered := True;
  if clientdataset1.RecordCount=0 then
    ComboBox2.color:=$CDEBFF
  else
      ComboBox2.Color:=clwhite;
      DBGrid1CellClick(DBGrid1.Columns[1]);
finally
  clientdataset1.EnableControls;
end;
//  ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
end;

procedure TForm1.ComboBox2DblClick(Sender: TObject);
begin
ComboBox2.text:='';
ComboBox2.color:=clwhite;
end;

procedure TForm1.ComboBox2DropDown(Sender: TObject);
var afile:string;
begin
  afile:=GetHomePath + 'find.aro' ;
If FileExists(afile) Then
    if Form2.checkbox22.checked then
    ComboBox2.Items.Clear
    else
    ComboBox2.Items.LoadFromFile(afile);

end;

procedure TForm1.ComboBox2Enter(Sender: TObject);
begin
 KeyPreview :=false;
  ComboBox2.SetFocus ;
end;

procedure TForm1.ComboBox2Exit(Sender: TObject);
begin
KeyPreview :=true;

end;

procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
KeyPreview :=false;
N20.Click;
end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin
case ComboBox4.ItemIndex of
0:begin
  ComboBox4.Text:='Please select mobi books';
  Panel34.Visible:=False ;
end;
1:begin
Choosepicture('eco1.png');
mag:='Economist.mobi';
Panel34.Visible:=True ;
end;
2:begin
Choosepicture('other.png');
mag:='Other.mobi';
Panel34.Visible:=True ;
end;

end;
end;


procedure TForm1.CreateParams(var Params: TCreateParams);
begin
    inherited CreateParams(Params);
  with params do
  begin
//    ExStyle :=  WS_EX_TOOLWINDOW;
//    WndParent := GetDesktopWindow;
  end;


end;



//procedure TForm1.Createparams(var Params: TCreateParams);
//begin
//  inherited CreateParams(Params);
//  with params do
//  begin
//    ExStyle:=ExStyle or WS_EX_TOPMOST;
//    WndParent:=GetDesktopWindow;
//  end;
//end;

//procedure TForm1.CopyDbDataToExcel(Args: array of const);
//var
//  iCount, jCount: Integer;
//  XLApp: Variant;
//  Sheet: Variant;
//  I: Integer;
//begin
//  Screen.Cursor := crHourGlass;
//  if not VarIsEmpty(XLApp) then
//  begin
//    XLApp.DisplayAlerts := False;
//    XLApp.Quit;
//    VarClear(XLApp);
//  end;
//
//  try
//    XLApp := CreateOleObject('Excel.Application');
//  except
//    Screen.Cursor := crDefault;
//    Exit;
//  end;
//
//  XLApp.WorkBooks.Add;
//  XLApp.SheetsInNewWorkbook := High(Args) + 1;
//  try
//  ClientDataSet1.DisableControls;
//
//  for I := Low(Args) to High(Args) do
//  begin
//    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBGrid(Args[I].VObject).Name;
//    Sheet := XLApp.Workbooks[1].WorkSheets[TDBGrid(Args[I].VObject).Name];
//
//    if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
//    begin
//      Screen.Cursor := crDefault;
//      Exit;
//    end;
//
//    TDBGrid(Args[I].VObject).DataSource.DataSet.first;
//    for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
//      Sheet.Cells[1, iCount + 1] :=
//    TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption;
//
//    jCount := 1;
//    while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
//    begin
//      for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
//        Sheet.Cells[jCount + 1, iCount + 1] :=
//      TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;
//
//      Inc(jCount);
//      TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
//    end;
//    XlApp.Visible := True;
//  end;
//  finally
//    clientdataset1.EnableControls;
//  end;
//  Screen.Cursor := crDefault;
//end;

//procedure TForm1.dayplay;
//var
//Found: Boolean; s1:string;
//begin
//  Found := False;
//  ClientDataSet2.DisableControls;
//    try
//      clientdataset2.edit;
//      ClientDataSet2.First;
//        while (not ClientDataSet2.Eof)and (not Found) do
//        begin
//            if ((ClientDataSet2.FieldByName('周期').asstring='') and (FormatDateTime('hh:mm:ss',ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now)))
//              or ((ClientDataSet2.FieldByName('周期').asstring<>'')  and (FormatDateTime('dddd',now)=ClientDataSet2.FieldByName('周期').asstring)
//             and (FormatDateTime('hh:mm:ss',ClientDataSet2.FieldByName('开始时间').asdatetime) = formatdatetime('hh:mm:ss',now))) then
//            begin
//              Found := True;
//              title5:=ClientDataSet2.FieldByName('电台名称').asstring;
//              s2:=ClientDataSet2.FieldByName('完成动作').asstring;
//              i:=ClientDataSet2.FieldByName('间隔').asinteger;
//              rdfile :=true;
//              DBGrid1CellClick(DBGrid1.Columns[1]);
//              Break;
//            end;
//            ClientDataSet2.Next;
//        end;
//    finally
//        ClientDataSet2.EnableControls;
//    end;
//    if not ClientDataSet2.Eof  then
//    begin
//      s1:=ClientDataSet2.FieldByName('计划类型').asstring;
//
//
//      if s1='定时播放' then
//      begin
//        if WindowsMediaPlayer1.isOnline  then
//          begin
//              WindowsMediaplayer1.controls.stop ;
//              FlyFlv1.StopMovie ;
//              Timer2.Enabled :=True;
//              if ClientDataSet2.FieldByName('电台类型').asstring='普通电台' then
//                  begin
//                    WindowsMediaplayer1.controls.stop ;
//                    WindowsMediaPlayer1.URL:=ClientDataSet2.FieldByName('电台地址').asstring;
//                    WindowsMediaPlayer1.controls.play;
//                    playstatus :=3;
//                  end
//              else begin
//                    FlyFlv1.StopMovie;
//                    FlyFlv1.PlayMovie(ClientDataSet2.FieldByName('电台地址').asstring);
//                    d:=Now;
//                    playstatus:=6;
//              end;
//
//              with TrayIcon1 do
//                begin
//                  BalloonTitle :=appname+' 提示:';
//                  BalloonHint:='已启动 --'+#32+ClientDataSet2.FieldByName('计划类型').asstring+#32+title5;
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//              Timer3.Enabled :=true;
//               if Form2.CheckBox8.Checked  then
//              OpenVolumn ;
//          end
//         else
//          Application.MessageBox('播放错误，请查看是否系统已联网，或关闭迅雷等下载软件后再试！', appname, MB_OK +
//            MB_ICONSTOP + MB_TOPMOST);
//      end;
//
//      if s1='播放并录音' then
//      begin
//        if WindowsMediaPlayer1.isOnline  then
//          begin
//              WindowsMediaplayer1.controls.stop ;
//              FlyFlv1.StopMovie ;
//              Timer2.Enabled :=True;
//              if ClientDataSet2.FieldByName('电台类型').asstring='普通电台' then
//                begin
//                  WindowsMediaplayer1.controls.stop ;
//                  WindowsMediaPlayer1.URL:=ClientDataSet2.FieldByName('电台地址').asstring;
//                  WindowsMediaPlayer1.controls.play;
//                  playstatus :=3;
//                end
//              else begin
//                FlyFlv1.StopMovie;
//                FlyFlv1.PlayMovie(ClientDataSet2.FieldByName('电台地址').asstring);
//                d:=Now;
//                playstatus:=6;
//              end;
//
//              if CheckdirectoryName  then
//                begin
//                      Arecord;
//                      with TrayIcon1 do
//                       begin
//                        BalloonTitle :=appname+' 提示:';
//                        BalloonHint:='已启动 --'+#32+ClientDataSet2.FieldByName('计划类型').asstring+#32+title5;
//                        BalloonFlags:=bfInfo ;
//                        ShowBalloonHint ;
//                        end;
//                      Timer3.Enabled :=true;
//                      Timer5.Enabled :=True;
//
//                    end
//                end
//              else begin
//                Application.MessageBox('录音出错！当前录音目录为空或者不存在,请选择“录音设置”标签,重新进行设置.',appname,MB_OK +
//                  MB_ICONINFORMATION +MB_TOPMOST);
//                Form2.ShowModal ;
//                form2.PageControl1.TabIndex :=2;
//              end;
//          end;
//          if Form2.CheckBox8.Checked  then
//              OpenVolumn
//        else
//          Application.MessageBox('播放错误，请查看是否系统已联网，或关闭迅雷等下载软件后再试！', appname, MB_OK +
//            MB_ICONSTOP + MB_TOPMOST);
//      end;
//    end;
//end;

//function doubleplay(p: Pointer): Integer;stdcall;
//var
//  rStream: TStringstream;
//  astr,astr2,astr3,astr4,astr5,a:String;
//  idhttp2:tidhttp;
//begin
//        form1.title2:='';
//        form1.Timer2.Enabled :=True ;
//        form1.flag:=False ;
//        form1.title4:=form1.ClientDataSet1.FieldByName('电台名称').AsString;
//        form1.WindowsMediaPlayer1.URL:=form1.ClientDataSet1.FieldByName('电台地址').AsString ;
//        if form2.CheckBox6.Checked  then
//            form1.Killthunder ;


//        if form1.ClientDataSet1.FieldByName('电台类型').asstring='普通电台' then
//        begin
//          form1.WindowsMediaPlayer1.controls.play;
//          playstatus :=2;
//        end;
//        else  begin
//            form1.FlyFlv1.PlayMovie(form1.ClientDataSet1.FieldByName('电台地址').asstring);
//            form1.d:=Now;
//            playstatus:=5;
//        end;

//        if (form1.clientdataset1.fieldbyname('自定义1').asstring='*')  then
//	      begin
//          try
//	            try
//        	      idhttp2 :=TIdHTTP.Create(nil);
//              	rStream:= TStringstream.Create('');
//        	      idHTTP2.Get(k1+form1.clientdataset1.FieldByName('电台地址').AsString+'.html',rStream);
//        	      astr := rStream.DataString;
//        	      astr2:=copy(astr,pos('<p>',astr)+3,200);
//        	      astr3:= copy(astr2, 1,pos('</p>', astr2)-1);//更新内容
//                astr4:=copy(astr,pos('<h3>',astr)+4,200);
//                astr5:= copy(astr4, 1,pos('</h3>', astr4)-1);
//        	      form1.FlyFlv1.PlayMovie(n+'&id='+form1.clientdataset1.FieldByName('电台地址').AsString+'&start='+astr3+'&end='+astr5) ;
//                form1.d:=Now;
//                playstatus:=5;
//      	      finally
//        	      idhttp2.Free ;
//      	     end;
//          except
//          end;



//   form1.title2:=form1.clientdataset1.FieldByName('电台名称').asstring;
//
//end;
//Result :=0;
//end;



function OpenURL(url: PAnsiChar): Integer;
var
  ini:TIniFile;
  icy: PAnsiChar;
  vol:Single;
  Len, Progress: DWORD;
  youlikename,youlikecoutry,m3u8:String;
begin
  Result := 0;
  form1.title2:='';
  form1.Timer2.Enabled :=True ;
  BASS_Free;
	BASS_Stop;
  BASS_StreamFree(chan); // close old stream

  progress := 0;
  SendMessage(win, WM_INFO_UPDATE, 0, 0); // reset the Labels and trying connecting
//  BASS_ChannelStop(chan);
  form1.title4:=form1.ClientDataSet1.FieldByName('电台名称').AsString;
  youlikecoutry:=form1.ClientDataSet1.FieldByName('电台国家').AsString;
  youlikename:=form1.ClientDataSet1.FieldByName('电台类别').asstring;
  m3u8:=form1.ClientDataSet1.FieldByName('电台地址').asstring;
//  Form2.loadini;
  if form2.CheckBox25.Checked then
   BASS_Init(-1, 44100, 0, 0, nil)
   else
  BASS_Init(form2.listbox1.itemindex+1, 44100, 0, 0, nil);

  if AnsiContainsText(m3u8,'.m3u8') then
  Chan:= BASS_HLS_StreamCreateURL(PWideChar(url), BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, nil, nil)
  else
  chan:= BASS_StreamCreateURL(PWideChar(url), 0, BASS_STREAM_BLOCK  or BASS_STREAM_STATUS or BASS_STREAM_AUTOFREE, @StatusProc, nil);
//  form1.TrayIcon1.IconIndex:=3;
  if (chan = 0) then
  begin
    //lets catch the error here inside the Thread
    // and send it to the WndProc
    SendMessage(win, WM_INFO_UPDATE, 1, Bass_ErrorGetCode()); // Oops Error
  end
  else
  begin
    // Progress
    repeat
      len := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_END);
      if (len = DW_Error) then
        break; // something's gone wrong! (eg. BASS_Free called)
      progress := BASS_StreamGetFilePosition(chan, BASS_FILEPOS_BUFFER) * 100 div len;
      // percentage of buffer filled
      SendMessage(win, WM_INFO_UPDATE, 2, progress); // show the Progess value in the label
    until
      (progress > 75) or (BASS_StreamGetFilePosition(chan, BASS_FILEPOS_CONNECTED) = 0); // over 75% full (or end of download)

    // get the broadcast name and bitrate
    icy := BASS_ChannelGetTags(chan, BASS_TAG_ICY);
    if (icy = nil) then
      icy := BASS_ChannelGetTags(chan, BASS_TAG_HTTP); // no ICY tags, try HTTP
    if (icy <> nil) then
      while (icy^ <> #0) do
      begin
        if (Copy(icy, 1, 9) = 'icy-name:') then
          SendMessage(win, WM_INFO_UPDATE, 3, DWORD(PAnsiChar(Copy(icy, 10, MaxInt))))
        else if (Copy(icy, 1, 7) = 'icy-br:') then
          SendMessage(win, WM_INFO_UPDATE, 4, DWORD(PAnsiChar('bitrate: ' + Copy(icy, 8, MaxInt))));
        icy := icy + Length(icy) + 1;
      end;
    // get the stream title and set sync for subsequent titles
    DoMeta();
    BASS_ChannelSetSync(chan, BASS_SYNC_META, 0, @MetaSync, nil);


//     BASS_ChannelStop(chan);
    // play it!
    BASS_ChannelPlay(chan, FALSE);
    if (form1.toolbutton23.tag=1) and ( form1.ClientDataSet1.FieldByName('电台类型').asstring = 'Common') then
    begin
     BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 0)
     end
    else begin
      BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 1);
      BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, form1.TrackBar1.Position / form1.TrackBar1.Max);
      BASS_ChannelGetAttribute(chan, BASS_ATTRIB_VOL, vol);
    end;
//end;

  end;
  form1.title2:=form1.title4;
  cthread := 0;
end;

procedure TForm1.WndProc(var Msg: TMessage);
// to be threadsave we are passing all Canvas Stuff(e.g. Labels) to this messages
begin
  inherited;
  if Msg.Msg = WM_INFO_UPDATE then
    case msg.WParam of
      0:
        begin
          Label3.Hint  := 'Connecting...';
//          Label11.Caption := '';
//          Label5.Caption := '';
        end;
      1:
        begin
          Label3.Hint:= 'No station play';
          //Error('Can''t play the stream');
           MessageBox(win, PChar('Play failed!' + #13#10 + '(error code: ' +
            IntToStr(msg.LParam)+')'+#13#10+'------------------------------'+#13#10+'2:file open error' + #13#10 +
              '8:Bass initialize error' + #13#10 + '32:Check it network' + #13#10
              + '40:Timeout, please retry' + #13#10 + '41:File format error'), nil, 0);

         toolbutton1.click;
        end;
      2: Label3.Hint := Format('station speed... %d%%', [msg.LParam]);
//      2: Label3.Hint := label11.caption;
      3: Label3.Hint := String(PAnsiChar(msg.LParam));
//      4: Label5.Caption := String(PAnsiChar(msg.LParam));
//      5: Label5.Caption := String(PAnsiChar(msg.LParam));
      6: begin
//          if regeditaro and (not lyric)  then
//          begin
            if ClientDataSet1.fieldbyname('电台国家').asstring<>'China' then
              Label14.Caption :=String(PAnsiChar(msg.LParam))
              else
              Label14.Caption :=Utf8ToAnsi(PAnsiChar(msg.LParam));

//              with TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:=title9+#13+String(PAnsiChar(msg.LParam));
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//            end

//            else
//              Label11.Caption :='';
//          end;
          end;
      7: begin
//          if regeditaro and (not lyric) then
//          begin
            if ClientDataSet1.fieldbyname('电台国家').asstring<>'China' then
              Label14.Caption :=String(PAnsiChar(msg.LParam))
              else
//              Label14.Caption :=UTF8Decode(String(PAnsiChar(msg.LParam)));
             Label14.Caption :=Utf8ToAnsi(PAnsiChar(msg.LParam));
//                with TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:=title9+#13+String(PAnsiChar(msg.LParam));
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;

            end;
//            else
//              Label11.Caption :='';
//          end;
//          end;
          end;
end;

procedure TForm1.DateTimePicker1Enter(Sender: TObject);
begin
KeyPreview :=false;
end;

procedure TForm1.DateTimePicker1Exit(Sender: TObject);
begin
KeyPreview :=True;
end;

procedure TForm1.DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
begin
KeyPreview :=false;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  select:=True ;
  country:=ClientDataSet1.FieldByName('电台国家').AsString;
  area:=ClientDataSet1.FieldByName('自定义2').AsString;
  rkind:=ClientDataSet1.FieldByName('电台类别').AsString;
  videoadd :=Form1.ClientDataSet1.FieldByName('电台地址').AsString ;
  videokind :=form1.ClientDataSet1.FieldByName('视频类型').AsString ;
  videonname:= form1.ClientDataSet1.FieldByName('电台名称').AsString ;
  videoforcast:= form1.ClientDataSet1.FieldByName('电台网址').AsString ;
  radiokind:= form1.ClientDataSet1.FieldByName('电台类型').AsString ;

  if (toolbutton26.down) and (AnsiContainsText(form1.ClientDataSet1.FieldByName('电台网址').asstring,'.m3u8')) then
  begin
    ClientDataSet1.edit;
    ClientDataSet1.FieldByName('视频类型').AsString:='';
    ClientDataSet1.FieldByName('电台类型').AsString:='Common';
    ClientDataSet1.FieldByName('电台地址').AsString:=ClientDataSet1.FieldByName('电台网址').AsString;
  end;

        flag:=False ;
        title3:=clientdataset1.FieldByName('电台名称').AsString;
        if ClientDataSet1.FieldByName('电台类型').AsString='Common' then
          mp:=clientdataset1.FieldByName('电台地址').AsString;


//  if ToolButton1.tag=0 then
//    PopupMenu4.Items[5].caption :='播放'
//  else
//    PopupMenu4.Items[5].caption :='停止播放';
//
  if ClientDataSet1.FieldByName('收藏').AsString='' then
      begin
        PopupMenu4.items[8].caption:='Add to my favorite';
        ToolButton4.Hint:='Add to my favorite';
        ToolButton4.ImageIndex:=4;
      end
    else
      if ClientDataSet1.FieldByName('收藏').AsString='★' then
      begin
        ToolButton4.ImageIndex:=5;
        ToolButton4.Hint:='Remove from the favorites';
        PopupMenu4.items[8].caption:='Remove from the favorites';
      end;

//  if (ClientDataSet1.FieldByName('电台分组').asstring <>'') then
//    PopupMenu4.Items[12].visible :=True
//  else
//    PopupMenu4.Items[12].Visible :=false;

//  if clientdataset1.recordcount=0 then
//    popupmenu4.autopopup:=False
//  else
//    popupmenu4.autopopup:=True;

//  if regeditaro then
//  begin
//  if (ClientDataSet1.FieldByName('电台网址').asstring <>'') and
//    (ClientDataSet1.FieldByName('视频类型').asstring ='电视台')  then
//    ToolButton6.enabled:=True
//  else
//    ToolButton6.enabled:=False ;
//
//  end;



//  if regeditaro then
//  begin
//  if ClientDataSet1.FieldByName('视频类型').asstring <>'电视台' then
//  begin
//    PopupMenu1.items[9].visible:=true;
//  end
//  else begin
//    PopupMenu1.items[9].visible:=False;
//  end;
//  end;

end;


procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  ID: DWORD;left1,top1:Integer;
begin

    if form2.CheckBox6.Checked  then
            Killthunder ;
     if form2.CheckBox21.Checked  then
        Label14.Visible:=False
     else
        label14.Visible:=True ;

      if form2.CheckBox29.Checked  then
        image3.Visible:=False
     else
        Image3.Visible:=True ;

    TrayIcon1.IconIndex:=7;
    Timer2.Enabled :=True ;
   youlikecoutry:=ClientDataSet1.FieldByName('电台国家').asstring;
   youlikename:=ClientDataSet1.FieldByName('电台类别').asstring;
   tvname:=Form1.ClientDataSet1.fieldbyname('电台名称').asstring;
   mp:=form1.ClientDataSet1.FieldByName('电台地址').AsString;
   PopupMenu1.items[0].caption:=tvname;

   if CheckOffline  then
   begin
   if ToolButton2.Tag<>1 then
    begin

        if form1.ClientDataSet1.FieldByName('电台类型').AsString ='Common' then
        begin
          Form1.toolbutton1.tag:=1;
          form1.toolbutton1.imageindex:=1;
          Form1.toolbutton1.hint:='StopKey: space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
          PopupMenu1.Items[5].Items[0].Caption :='Stop';
          if Form2.checkbox2.Checked then
            BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, nil) // disable proxy
          else
            BASS_SetConfigPtr(BASS_CONFIG_NET_PROXY, PWideChar(Form2.ComboBox3.Text)); // set proxy server
          bit.Free;
          bit := TBitmap.Create;
          PaintBox1.Repaint;
          BASS_ChannelStop(chan);
          BASS_SetConfig(BASS_CONFIG_BUFFER,form2.buffer);
          cthread := BeginThread(nil, 0, @OpenURL, PAnsiChar(mp), 0, Id);
          TrayIcon1.IconIndex:=7;
          Notebook3.PageIndex:=1;
          Application.title:=tvname;
          Form1.Caption:= Application.title;
          title2:=Form1.Caption;
          title5:=title2;
          title9:=title5;
          playstatus :=1;
          Savecombobox;
        end
      else begin
      if toolbutton2.Tag=1 then
        begin
          MessageBeep(16);
          Application.MessageBox('Detect it''s record, please stop it and play.', appname, MB_OK
            + MB_ICONINFORMATION);
          toolbutton2.Click ;
          ToolButton2.Tag:=0;
          ToolButton1.Tag:=0;
          ToolButton1.ImageIndex :=0;
          Application.title:=appname;
          Form1.Caption:= Application.title;
//          title2:=Form1.Caption;
          toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
        end
        else begin
         if (clientdataset1.FieldByName('电台类型').asstring='Web')   then
                begin
                  BASS_ChannelStop(chan);
                  if form2.checkbox20.checked  then
                    Notebook2.pageindex:=4
                  else
                    Showtv ;
                end

          else if (clientdataset1.FieldByName('电台类型').asstring='rtmp | m3u8') then
          begin
          if Form2.CheckBox23.Checked then
          begin
            BASS_ChannelStop(chan);
            if form2.checkbox20.checked  then
                 Notebook2.pageindex:=4
            else
              Showtv ;
          end
          else begin

            Left1:=self.Left + 80;
            Top1:= self.Top+40;
            with form2 do
            begin
                left:=Left1;
                Top:=Top1;
                FormStyle:=fsStayOnTop;
                Show ;
                Notebook1.ActivePage:='7';
                MessageBeep(16);
                Application.MessageBox('This station needs Aplayer Plug-in engine support, please check the ''Use Aplayer Plug-in'' option.', PChar(appname), MB_OK + MB_ICONWARNING);
            end;
          end;
          end;
//        if clientdataset1.FieldByName('电台类型').AsString ='m3u8' then
//         begin
//         BASS_ChannelStop(chan);
//         shellExecute(handle,'open',PChar(clientdataset1.FieldByName('电台地址').AsString),nil,nil,SW_NORMAL)
//         end
//          else begin
//          BASS_ChannelStop(chan);
//         Show电视台 ;
//         end;
          ToolButton1.Tag:=0;
         ToolButton1.ImageIndex :=0;
         Application.title:=appname;
         Form1.Caption:= Application.title;
//         title2:=Form1.Caption;
         toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
        end;

      end;

    with Form1.ClientDataSet1 do
        begin
          Edit;
          fieldbyname('自定义1').asstring:='Today';
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath + DataBaseFileName);
//          Close ;
//          Open ;
        end;
//    label7.caption:='猜你喜欢:';
//    Form2.loadini;
    if (Form2.CheckBox9.checked)
    and (ClientDataSet1.FieldByName('视频类型').asstring<>'电视台') then
    SpeedButton13.Visible:=true;
//      GuessYoulike(youlikename,youlikecoutry);
    end
    else begin
    case Application.MessageBox('Detect it''s recording,Stop it now?', PChar(appname),
      MB_OKCANCEL + MB_ICONINFORMATION) of
      IDOK:
        begin
          toolbutton1.Click ;
        ToolButton2.Tag:=0;
//        ToolButton2.ImageIndex :=0;
        ToolButton1.Tag:=0;
        ToolButton1.ImageIndex :=0;
        Application.title:=appname;
        Form1.Caption:= Application.title;
//        title2:=Form1.Caption;
        toolbutton1.Hint :='PlayKey: Space'+#13+'Mute：'+ShortCutToText(form2.HotKey8.hotkey);
        end;
      IDCANCEL:
        begin

        end;
    end;
//        Application.MessageBox('当前的录音将强制停止。', appname, MB_OK
//          + MB_ICONINFORMATION);
    end;

  end
  else begin
    MessageBeep(16);
      Application.MessageBox('Play failed, please check the network!', appname, MB_OK +
       MB_ICONSTOP + MB_TOPMOST);
      ToolButton1.Tag:=0;
      Application.title:=appname;
      Form1.Caption:= Application.title;
//      title2:=Form1.Caption;
       ToolButton1.ImageIndex:=0;
       TrayIcon1.IconIndex:=8;
  end;
end;

procedure TForm1.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
Accept := Source is TDBGrid;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  begin
  if ClientDataSet1.RecNo mod 2 = 0 then
    (Sender as TDBGrid).Canvas.Brush.Color := clmenu//定义背景颜色
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite ; //定义背景颜色

  if  ClientDataSet1.FieldByName('视频类型').AsString='电视台' then
    (Sender as TDBGrid).Canvas.font.Color :=Form2.ColorBox1.selected;  //定义背景颜色
//  else
//    (Sender as TDBGrid).Canvas.brush.Color := clWhite ; //定义背景颜色



  TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;
procedure TForm1.DBGrid1EditButtonClick(Sender: TObject);
begin
end;

//  if (ClientDataSet1.FieldByName('视频类型').AsString ='电视台') and
//  (ClientDataSet1.FieldByName('电台名称').AsString<>ClientDataSet1.FieldByName('电台网址').AsString) then
//  begin
//    (Sender as TDBGrid).Canvas.brush.Color :=clWebDarkSalmon
//     (Sender as TDBGrid).Canvas.brush.Color :=;
//  end
//   else
//    (Sender as TDBGrid).font.Color := clblack;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift ) and (Key=VK_DELETE) then
    key:=0;

    if (ssShift in Shift ) then
     form2.checkbox20.checked:=true;

//      if (ssCtrl in Shift) then
//    begin
//    ClientDataSet1.edit;
//    ClientDataSet1.FieldByName('视频类型').AsString:='';
//    ClientDataSet1.FieldByName('电台类型').AsString:='普通电台';
//    ClientDataSet1.FieldByName('电台地址').AsString:=ClientDataSet1.FieldByName('电台网址').AsString;
//
//    end;

//    try
//    if (ssCtrl in Shift ) then
//    begin
//      form1.ClientDataSet1.FieldByName('电台类型').AsString:='Common';
//      form1.ClientDataSet1.FieldByName('视频类型').AsString:='';
//      form1.ClientDataSet1.FieldByName('电台地址').AsString:=form1.ClientDataSet1.FieldByName('电台网址').AsString;
//    end
//    else begin
//    form1.ClientDataSet1.FieldByName('电台类型').AsString:='网页电台';
//    form1.ClientDataSet1.FieldByName('视频类型').AsString:='电视台';
//    form1.ClientDataSet1.FieldByName('电台网址').AsString:=form1.ClientDataSet1.FieldByName('电台地址').AsString;
//
//    end;
//    listen电视台:=true;
//    except
//    Application.MessageBox('当前电视台不支持收听！', appname, MB_OK +
//      MB_ICONINFORMATION + MB_TOPMOST);
//    end;
end;




procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   DBGrid1DblClick(Self);
end;

procedure TForm1.DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//ClientDataSet1.edit;
//ClientDataSet1.FieldByName('视频类型').AsString:='电视台';
//ClientDataSet1.FieldByName('电台类型').AsString:='网页电台';
//ClientDataSet1.FieldByName('电台地址').AsString:=mp ;
end;

procedure TForm1.DBGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//  GridCoord: TGridCoord;title:string;
begin
if Button=mbRight then
PopupMenu4.AutoPopup:=True;
//  GridCoord := DBGrid1.MouseCoord(X, Y);
//  if GridCoord.X = -1 then
//  begin
//    Caption := '鼠标在空白处按下';
//    Exit;
//  end;
//  Caption := Format('鼠标在第%d行、第%d列按下，', [GridCoord.Y, GridCoord.X]);
//  if dgIndicator in DBGrid1.Options then
//  begin
//    if GridCoord.X > 0 then
//      Caption := Caption + '列标题为：' + DBGrid1.Columns[GridCoord.X - 1].Title.Caption
//    else                                                             g
//      Caption := Caption + '此列为指示符列';
//  end
//  else
//caption:= DBGrid1.Columns[GridCoord.X].Title.Caption;
//    if caption='电台国家' then
//    popupmenu10.autopopup:=true;
end;
//end;

procedure TForm1.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
//var
//  Coord: TGridCoord;
begin
//  Coord:= dbgrid1.MouseCoord(X,Y);  //获取当前指针坐标对应的Grid行列坐标
//  if Coord.Y < 1 then Exit;
//  dbgrid1.DataSource.DataSet.RecNo:= Coord.Y;
//  dbgrid1.Hint:= dbgrid1.DataSource.DataSet.FieldByName('自定义2').AsString;

  if (ssLeft in Shift) then
  (Sender As TDBGrid).BeginDrag(False) ;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  ClientDataSet1.IndexFieldNames := column.FieldName;
end;

procedure TForm1.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssctrl in shift) and (key=vk_delete) then key:=0;
end;



procedure TForm1.DeleteDirectory(const Name: string);
var
  F: TSearchRec;
begin
  if FindFirst(Name + '\*', faAnyFile, F) = 0 then begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then begin
          if (F.Name <> '.') and (F.Name <> '..') then begin
            DeleteDirectory(Name + '\' + F.Name);
          end;
        end else begin
          DeleteFile(Name + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    RemoveDir(Name);
  end;
end;



procedure TForm1.b(Column: TColumn);
begin
//  DsSort(Column);

end;




//procedure TForm1.dblplay;
//var
//  rStream: TStringstream;
//  astr,astr2,astr3,astr4,astr5,a:String;
//  idhttp2:tidhttp;
//begin
//
//        title2:='';
//        Timer2.Enabled :=True ;
//        flag:=False ;
//        title4:=ClientDataSet1.FieldByName('电台名称').AsString;
//
//
//        if ClientDataSet1.FieldByName('电台类型').asstring='普通电台' then
//        begin
//          WindowsMediaPlayer1.URL:=ClientDataSet1.FieldByName('电台地址').AsString ;
//          WindowsMediaPlayer1.controls.play;
//          playstatus :=2;
//        end;
//        else  begin
//            FlyFlv1.PlayMovie(ClientDataSet1.FieldByName('电台地址').asstring);
//            d:=Now;
//            playstatus:=5;
//        end;
//        if (clientdataset1.fieldbyname('自定义1').asstring='*')  then
//	      begin
//          try
//	            try
//        	      idhttp2 :=TIdHTTP.Create(Self);
//              	rStream:= TStringstream.Create('');
//        	      idHTTP2.Get(k1+clientdataset1.FieldByName('电台地址').AsString+'.html',rStream);
//        	      astr := rStream.DataString;
//        	      astr2:=copy(astr,pos('<p>',astr)+3,200);
//        	      astr3:= copy(astr2, 1,pos('</p>', astr2)-1);//更新内容
//                astr4:=copy(astr,pos('<h3>',astr)+4,200);
//                astr5:= copy(astr4, 1,pos('</h3>', astr4)-1);
//        	      FlyFlv1.PlayMovie(n+'&id='+clientdataset1.FieldByName('电台地址').AsString+'&start='+astr3+'&end='+astr5) ;
//                d:=Now;
//                playstatus:=5;
//      	      finally
//        	      idhttp2.Free ;
//      	     end;
//          except
//          end;



//   title2:=clientdataset1.FieldByName('电台名称').asstring;
//end;
//end;





//procedure TForm1.Delay(msecs: integer);
//var
//  Tick: DWord;
//  Event: THandle;
//begin
//  Event := CreateEvent(nil, False, False, nil);
//  try
//    Tick := GetTickCount + DWord(msecs);
//    while (msecs > 0) and (MsgWaitForMultipleObjects(1, Event, False, msecs, QS_ALLINPUT) <> WAIT_TIMEOUT) do
//    begin
//      Application.ProcessMessages;
//      msecs := Tick - GetTickcount;
//    end;
//  finally
//    CloseHandle(Event);
//  end;
//end;

function TForm1.Keycode(httpsr:string): Boolean;
    var
   lpEntryInfo: PInternetCacheEntryInfo;
   hCacheDir: LongWord;
   dwEntrySize: LongWord;
   cachefile: string;
 begin
 try
   dwEntrySize := 0;
   FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
   GetMem(lpEntryInfo, dwEntrySize);
   if dwEntrySize > 0 then
     lpEntryInfo^.dwStructSize := dwEntrySize;
   hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
   if hCacheDir <> 0 then
   begin
     repeat
       if (lpEntryInfo^.CacheEntryType) and (NORMAL_CACHE_ENTRY) = NORMAL_CACHE_ENTRY then
         cachefile := pchar(lpEntryInfo^.lpszSourceUrlName);
       if pos(httpSr, cachefile) > 0 then    //清除特定网站的cookies.例如baidu.com
         DeleteUrlCacheEntry(pchar(cachefile)); //执行删除操作
       FreeMem(lpEntryInfo, dwEntrySize);
       dwEntrySize := 0;
       FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
       GetMem(lpEntryInfo, dwEntrySize);
       if dwEntrySize > 0 then
         lpEntryInfo^.dwStructSize := dwEntrySize;
     until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);
   end;
   FreeMem(lpEntryInfo, dwEntrySize);
   FindCloseUrlCache(hCacheDir);
  except
   Result:=False;
  end;
end;

procedure TForm1.bass;
begin
win:=handle;
if (HIWORD(BASS_Getversion) <> BASSVERSION) then
  begin
    image2.visible:=True;
     image6.visible:=False ;
//    image2.hint :=AnsiString('插件导入出错！')

  end;
  if (not BASS_Init(-1, 44100, 0, Handle, nil)) then
  begin
//    image2.hint :=AnsiString('插件初始化错误！');
    image2.visible:=False;
     image6.visible:=True ;
//    Halt;
  end;

  if (BASS_PluginLoad('basswma.dll', BASS_UNICODE) <> 0) or (BASS_PluginLoad('basshls.dll', BASS_UNICODE) <> 0) then
  begin
    image2.visible:=True;
    image6.visible:=False ;
  end
//      image2.hint :=AnsiString('插件导入成功！')
    else begin
    image2.visible:=False;
     image6.visible:=True ;
//      image6.hint:=AnsiString('插件初始化错误' + inttostr(BASS_ErrorGetCode()));
    end;

  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1); // enable playlist processing
  BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 0); // minimize automatic pre-buffering, so we can do it (and display it) instead

end;

procedure TForm1.Delrec;
var cdsnew:Tclientdataset;
begin
      try
        form1.ClientDataSet1.DisableControls;
        cdsnew:=Tclientdataset.Create(nil);
        cdsnew.Data :=form1.ClientDataSet1.Data ;
        cdsnew.First;
      while not cdsnew.Eof do
        begin
          if cdsnew.fieldbyname('计划类型').AsString<>'' then
          begin
           cdsnew.edit;
            cdsnew.fieldbyname('计划类型').AsString:='';
          end
          else
            cdsnew.Next;
        end;
      form1.ClientDataSet1.Data:=cdsnew.Data;
       TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
        TDateField(form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';

      with form1.ClientDataSet1 do
        begin
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath + DataBaseFileName);
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open;

        end;
          Form1.TotalRecord ;

        if form1.ClientDataSet1.RecordCount <>0 then
          Form1.N46Click(Self);

        finally
          cdsnew.Free ;
          Form1.ClientDataSet1.EnableControls ;
        end;
end;

procedure TForm1.DestroyProcess(hProcess: Cardinal);
Var
  ovExitCode: LongWord;
begin
  try
    if hProcess<>0 then
    begin
      GetExitCodeProcess(hProcess, ovExitCode);
      if (ovExitCode = STILL_ACTIVE) or (ovExitCode <> WAIT_OBJECT_0) then
        TerminateProcess(hProcess, ovExitCode);
      CloseHandle(hProcess);
    end;
  except
  end;
end;

procedure TForm1.DirectoryCopy(dir1, dir2: string);
var
  a: _WIN32_FIND_DATA;
  b: longint;
  temp: string;
  go: TSHFileOPSTRUCT;
begin
  temp:= dir1;  //文件目录
  if   (not   DirectoryExists(dir2))   then   CreateDir(dir2);
  b:= findFirstFile(PChar(temp+'\*.*'),a);
  if(Trim(a.cFileName)<>'.')and(Trim(a.cFileName)<>'..')and(Trim(a.cFileName)<>'') then
  begin
    go.Wnd:=0;
    go.wFunc:= FO_COPY ;
    go.fFlags:= FOF_SILENT ;
    go.pFrom:= PChar(temp+'\'+a.cFileName);
    go.pTo:= PChar(dir2+'\'+a.cFileName);
    SHFileOperation(go);
  end;
  while(FindNextFile(b,a)=true) do
  begin
    if(Trim(a.cFileName)<>'.')and(Trim(a.cFileName)<>'..')and(Trim(a.cFileName)<>'')then
    begin
      go.Wnd:= 0;
      go.wFunc:= FO_COPY ;
      go.fFlags:= FOF_SILENT ;
      go.pFrom:= PChar(temp+'\'+a.cFileName);
      go.pTo:= PChar(dir2+'\'+a.cFileName);
      SHFileOperation(go);
    end;
    if((a.dwFileAttributes=49)or(a.dwFileAttributes=48)or(a.dwFileAttributes=16))
    and(Trim(a.cFileName)<>'.')and(Trim(a.cFileName)<>'..') then
    begin
      DirectoryCopy(Trim(temp)+'\'+a.cFileName ,dir2+'\'+a.cFileName);
    end;
  end;

end;

function TForm1.DownloadFile(Source, Dest: string): Boolean;
begin
  try
    DeleteUrlCacheEntry(PChar(source));
    Result:=UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
  except
   Result:=False;
  end;
end;

procedure TForm1.EdgeWin101Click(Sender: TObject);
//var pp:string;
//begin
//pp:=clientdataset1.FieldByName('电台网址').AsString;
//ShellExecute(0, 'open', PChar('Microsoft-Edge:' + pp), nil, nil, SW_SHOW);
begin
  if not ToolButton6.Down then
  begin
  Timer5.Enabled:=False ;
  ToolButton6.Hint:='Setting shutdown time';
  end;


end;

function TForm1.CheckOffline: boolean;
var
ConnectState: DWORD;
StateSize: DWORD;
begin
  ConnectState:= 0;
  StateSize:= SizeOf(ConnectState);
  result:= false;
  if InternetQueryOption(nil, INTERNET_OPTION_CONNECTED_STATE, @ConnectState, StateSize) then
  if (ConnectState and INTERNET_STATE_DISCONNECTED) <> 2 then result:= true;
end;



procedure TForm1.regedit32(ie:integer);
var ARegistry:TRegistry;
begin
try
  ARegistry := TRegistry.Create;
　　//建立一个TRegistry实例
　　 with ARegistry do
　　 begin
　　 RootKey:=HKEY_LOCAL_MACHINE;
     if KeyExists('Software\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION') then
　 　 if OpenKey('Software\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION',True) then
　　 Writeinteger('AroPlay.exe',ie);
//　　 CloseKey;
//　　 Destroy;
　　 end;
finally

    ARegistry.closekey;
//    ARegistry.destroy;
    ARegistry.Free ;
end;
end;



procedure TForm1.regedit64;
var ARegistry : TRegistry;
begin
ARegistry := TRegistry.Create;
with ARegistry do
begin
RootKey:=HKEY_LOCAL_MACHINE;
if KeyExists('SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION') then
if OpenKey('SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION',True) then
Writeinteger('AroPlay.exe',11000);
CloseKey;
Destroy;
end;
end;





procedure TForm1.Savecombobox;
Var
  I: Byte;
  afile: String;
  alist: TStringList;
begin
  afile :=GetHomePath + 'find.aro';
  if ComboBox2.Text<>'' then
  begin
 ComboBox2.Items.Add(ComboBox2.Text);
  If ComboBox2.Items.Count > 10 Then
  Begin
    alist := TStringList.Create; //用alist来存放前10条记录
    try
      For I := 0 To 9 Do
      Begin
        alist.Add(ComboBox2.Items.Strings[I]);
      End;
      alist.SaveToFile(afile); //保存大于10条以上的
    finally
      alist.Clear;
      alist.Free;
    end;
  End
  Else
  Begin
    ComboBox2.Items.SaveToFile(afile); //保存10条以内的
  End;
  end;

end;

procedure TForm1.showkindle;
var dr:string;left1,top1,filesize:integer;
begin
//ComboBox4.Enabled:=false;
//Label16.Enabled:=False;
Panel25.Enabled:=false;
idftp1.Connect;
if DirectoryExists(form2.ComboBox4.text+form2.edit4.text) or
DirectoryExists(form2.Edit4.text) then
begin
form2.loadkindle;
if form2.ComboBox4.Enabled  then
dr:=form2.ComboBox4.text+form2.edit4.text+'\'+mag
else
dr:=form2.Edit4.text+'\'+mag;
label12.Caption:='It''s synchronized to '+label16.caption+' , please wait...';
//label12.Caption:=dr;
panel34.Visible:=false;
  idftp1.ChangeDir('wwwroot/mobi');
  FileSize:= idftp1.Size(mag);
  ProgressBar1.Max := FileSize;
  ProgressBar1.Step := 10;
  idftp1.Get(mag, PChar(dr), True);

with form1.TrayIcon1 do
  begin
    BalloonTitle :=appname;
    BalloonHint:=combobox4.text+' is synchronized.';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
//  Application.MessageBox('同步已完成！', appname, MB_OK +
//      MB_ICONINFORMATION + MB_TOPMOST);
    panel34.Visible:=True;
  Panel7.Visible:=False;
  ProgressBar1.Position:=0;
  IdFTP1.Disconnect;
  Panel25.Enabled:=true;
//  ComboBox4.Enabled:=True ;
//  Label16.Enabled:=True ;

if Form2.CheckBox15.checked then
ShellExecute(handle,nil,PChar(dr),nil,nil,SW_NORMAL)

end
else begin
MessageBeep(16);
Application.MessageBox('Don''t find the synchronized directory, please check the kindle-reader or network!', appname, MB_OK +
  MB_ICONWARNING);
Panel7.Visible:=False;
Panel25.Enabled:=True ;
end;
//form14.close;
end;


//procedure TForm1.DsSort(SortColumn: TColumn);
//var
//  OldIndex:string;
//begin
//if (SortColumn.Grid.DataSource=nil) or (SortColumn.Grid.DataSource.DataSet=nil) or (not SortColumn.Grid.DataSource.DataSet.Active) then Exit;
//OldIndex:=TClientDataSet(SortColumn.Field.DataSet).IndexName;
//if OldIndex<>'' then
//begin
//  TClientDataSet(SortColumn.Field.DataSet).IndexName:='';
//  TClientDataSet(SortColumn.Field.DataSet).DeleteIndex(OldIndex);
//end;
//case ASC of
//  True :TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
//  else//否则按升序排列
//  TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixPrimary]);
//end;{end case}
//TClientDataSet(SortColumn.Field.DataSet).IndexName:='px';
//ASC:=not ASC;
//end;




procedure TForm1.emptylist;
var cds1:Tclientdataset;
begin
  cds1:=Tclientdataset.Create(nil);
try
   ClientDataSet1.DisableControls;
   ClientDataSet1.Filtered :=False;
   ClientDataSet1.Filter :='自定义1=' +QuotedStr(trim('Today'));
   ClientDataSet1.filtered:=True ;
   cds1.data:=clientdataset1.data;
with cds1 do
begin
  First;
  while not Eof do
  begin
    Edit;
    FieldByName('自定义1').AsString := '';
//    Post;
    Next;
  end;
  MergeChangeLog;
  ApplyUpdates(-1);
  ClientDataSet1.data:=cds1.data;
  SaveToFile(GetHomePath + DataBaseFileName);

  end;
finally
  clientdataset1.EnableControls;
end;
  TreeView1.Select(TreeView1.Items[0]);
clientdataset1.filtered:=false;

end;

procedure TForm1.emptysc;
var cds1:Tclientdataset;
begin
  cds1:=Tclientdataset.Create(nil);
  MessageBeep(16);
  case Application.MessageBox('Empty the favorites?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        try
          ClientDataSet1.DisableControls;
          ClientDataSet1.Filtered :=False;
          ClientDataSet1.Filter :='收藏 =  ' + QuotedStr('★');
          ClientDataSet1.filtered:=True ;
          cds1.data:=clientdataset1.data;
        with cds1 do
          begin
            First;
            while not Eof do
              begin
                Edit;
                FieldByName('收藏').AsString := '';
                Next;
              end;
            MergeChangeLog;
            ApplyUpdates(-1);
            ClientDataSet1.data:=cds1.data;
            SaveToFile(GetHomePath + DataBaseFileName);
//            TreeView1.Select(TreeView1.Items[0]);
          end;
        finally
          clientdataset1.EnableControls;
        end;
          clientdataset1.filtered:=false;
      end;
    IDCANCEL:
      begin

      end;
  end;

end;

procedure TForm1.fft;
const
  w = 8;
var
  i,di: Integer;
begin
  paintbox1.visible:=true;
  if BASS_ChannelIsActive(chan) <> BASS_ACTIVE_PLAYING then Exit;

  BASS_ChannelGetData(chan, @FFTData, BASS_DATA_FFT1024);

  bit.Width := PaintBox1.Width;
  bit.Height := PaintBox1.Height;
  bit.Canvas.Brush.Color := clCream;
  bit.Canvas.FillRect(Rect(0, 0, bit.Width, bit.Height));

  bit.Canvas.Pen.Color := $00F4D214;
  for i := 0 to Length(FFTData) - 1 do
  begin
    di := Trunc(Abs(FFTData[i]) * 500);

    if di > bit.Height then di := bit.Height;
    if di >= FFTPeacks[i] then FFTPeacks[i] := di else FFTPeacks[i] := FFTPeacks[i] - 1;
    if di >= FFTFallOff[i] then FFTFallOff[i] := di else FFTFallOff[i] := FFTFallOff[i] - 3;
    if (bit.Height - FFTPeacks[i]) > bit.Height then FFTPeacks[i] := 0;
    if (bit.Height - FFTFallOff[i]) > bit.Height then FFTFallOff[i] := 0;

    bit.Canvas.Pen.Color := bit.Canvas.Pen.Color;
    bit.Canvas.MoveTo(i * (w + 1), bit.Height - FFTPeacks[i]);
    bit.Canvas.LineTo(i * (w + 1) + w, bit.Height - FFTPeacks[i]);

    bit.Canvas.Pen.Color := bit.Canvas.Pen.Color;
    bit.Canvas.Brush.Color := bit.Canvas.Pen.Color;
    bit.Canvas.Rectangle(i * (w + 1), bit.Height - FFTFallOff[i], i * (w + 1) + w, bit.Height);
  end;

  BitBlt(PaintBox1.Canvas.Handle, 0, 0, PaintBox1.Width, PaintBox1.Height, bit.Canvas.Handle, 0, 0, SRCCOPY);
end;

//procedure TForm1.fixdb(show:Boolean);
//var data:array of string;  i:Integer; cdsnew:Tclientdataset;
//MyStream:TMemoryStream;
//begin
//if CheckOffline then
//begin
//ClientDataSet1.filtered:=false;
//ClientDataSet1.filter:='';
//ClientDataSet1.filtered:=True ;
//try
//    cdsnew:=TClientDataSet.Create(nil);
//    mystream:=TMemoryStream.Create;
//    DeleteUrlCacheEntry(PWideChar(website+'Fix/cn/fix.cds'));
//    try
//    idhttp1.Get(website+'Fix/cn/fix.cds',MyStream);
//    MyStream.SaveToFile(gethomepath+'\ARO\fix.cds');
//    Form1.ClientDataSet1.Edit ;
//    cdsnew.LoadFromFile(gethomepath+'\ARO\fix.cds');
//
//  try
//  SetLength(data,10000);
//
//  try
//    Form1.ClientDataSet1.DisableControls;
//  cdsnew.First;
//  i := 0;
//  while not cdsnew.Eof do
//  begin
//    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
//    cdsnew.Next;
//    i := i + 1;
//  end;
//
//  for i := 0 to cdsnew.RecordCount - 1 do
//  begin
//    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
//    begin
////    ShowMessage('ok');
////    Form1.ClientDataSet1.Delete ;
//
//    form1.ClientDataSet1.Edit;
//    cdsnew.Locate('电台名称',data[i],[]);
//    Form1.ClientDataSet1.FieldByName('视频类型').AsString:=cdsnew.FieldByName('视频类型').AsString;
//    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
//    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
//    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
//    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
//    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
//    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
//    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
////    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
//    Form1.ClientDataSet1.Post;
//
//  end;
//     cdsnew.next;
//  end;
//
//
//  finally
//  form1.ClientDataSet1.EnableControls ;
//
//  end;
// form1.ClientDataSet1.MergeChangeLog ;
// form1.ClientDataSet1.ApplyUpdates(-1);
// form1.ClientDataSet1.SaveToFile(GetHomePath+ DataBaseFileName);
// form1.ClientDataSet1.close;
// form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
// form1.ClientDataSet1.open;
//
// if show then
// begin
// if DownloadFile(website+'Fix/cn/fix.txt',GetHomePath+'\ARO\fix.txt') then
//    ShellExecute(0, nil, PChar(GetHomePath+'\ARO\fix.txt'), nil, nil, 1);
// end;
//
//except
//  Application.MessageBox('修复失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;
//finally
//  cdsnew.Free;
//  MyStream.free;
//
//end;
//except
// Application.MessageBox('暂无需要修复的电台！', appname, MB_OK +
//    MB_ICONINFORMATION);
//end;
//DeleteFile(GetHomePath +'\ARO\fix.cds');
//Application.Restore;
//end
//else
//  Application.MessageBox('修复失败，请检查是否联网!', appname, MB_OK +
//    MB_ICONWARNING);
//end;

procedure TForm1.FlyFlv1ButterProgress(ASender: TObject; TotalBytes,
  LoadedBytes: Integer);
begin
// Label5.Caption:=FormatFloat('0.000',StrToInt(Format('%d', [LoadedBytes]))/1048576);

 end;

procedure TForm1.FlyFlv1PlayProgress(ASender: TObject; TotalTime, CurrentTime,
  BufferLength: Single);
//var d1:TDateTime ;
begin
//  d1:=Now-d;
//  label6.caption:=FormatDateTime('hh:mm:ss',d1);

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
//ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
//  ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
//  ShowScrollbar(DBGrid2.Handle,SB_HORZ,False);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  showstatus :=False ;
  Action := caFree;
//  Savecombobox;
//  form7.savevideo;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (not _FClosing) then
  begin
    Tag := Ord(WindowState);
  WindowState := wsMinimized;
  Hide;
  CanClose := False;
//  TrayIcon1.Visible :=false;
  end else
    CanClose := True;

//  Application.ShowMainForm:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var vol:Single;
begin
//  ButtonedEdit1.texthint:='←查找方式  查找类型→';
//  ButtonedEdit1.hint:='标准 | 模糊查询切换';
  FOnTop := False;
  notebook2.activepage:='Default';
  notebook3.activepage:='Default';
  notebook4.activepage:='Default';
  Panel25.Height:=45;
  Self.ClientWidth:=710;
  playradio:=True;
  listentv:=False ;
//  FOnTop := False;
  Showstatus:= True;
  tv:=False ;
  tvshow:=false;
//  ID:=GlobalAddAtom('hotkey');
//  id1:=GlobalAddAtom('hotkey1');
// ReportMemoryLeaksOnShutdown := True;
//  sim:=false ;
  select:=False ;
  ClientDataSet1.LoadFromFile(GetHomePath + DataBaseFileName);
  ClientDataSet1.Open;
  ClientDataSet2.Data :=ClientDataSet1.Data ;
//  update1:=IntToStr(ClientDataSet2.recordcount);
//  Timer1.Enabled :=True;
//  Day.Create();
//  AdjustToken ;
  loadtree ;
  loadll;

//  TreeView1.items[1].Expanded:=true;
//  TreeView1.SetFocus();
//  TreeView1.items[1].Expanded:=true;
//  TreeView1.SetFocus();
//  DBGrid1CellClick(DBGrid1.Columns[1]);
//  TreeView1.Select(TreeView1.Items[0]);
  play:=true;
  t:=StrToTime('00:00:00');
  Label3.Caption :='Starting...';

//  if CheckOffline then
//  begin
//    TThread.CreateAnonymousThread(ShowNet).Start;
//
//  end
//  else  begin
//    label18.caption:='信息获取失败,请检测是否联网！';
//
//  end;



//  BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, TrackBar1.Position / TrackBar1.Max);
//  BASS_ChannelGetAttribute(chan, BASS_ATTRIB_VOL, vol);
  bass;
//  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1); // enable playlist processing
//  BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 0); // minimize automatic pre-buffering, so we can do it (and display it) instead

if isvista  then
    begin
      if iswin64 then
           regedit64
        else
           regedit32(11000);
      end
      else
      regedit32(8000);

  if isvista then
    ipv6;
//  ClientHeight :=456;

  if not DirectoryExists(GetHomePath+'\ARO') then
    MkDir(GetHomePath+'\ARO');

  if not DirectoryExists(gethomepath+'\Aro\Records') then
    MkDir(gethomepath+'\Aro\Records');

  if not DirectoryExists(gethomepath+'\Aro\QRcode') then
    MkDir(gethomepath+'\Aro\QRcode');



end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
//	BASS_RecordFree;
	BASS_Free;
	BASS_Stop;

//              DeleteFile(GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml');
//        if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png') then
//          DeleteFile(GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png');
//   if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml') then
//              DeleteFile(GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml');
//              if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'netpanpd.txt') then
//              DeleteFile(GetShellFolders('Personal')+'\ARO'+'\'+'netpanpd.txt');
//            if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'update.xml') then
//              DeleteFile(GetShellFolders('Personal')+'\ARO'+'\'+'update.xml');
//            if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'update.cds') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'update.cds') ;
//            if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'new.xls') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'new.xls') ;
//            if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds') ;
//          if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'pg18new.xls') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'pg18new.xls') ;
//          if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'pg18.xml') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'pg18.xml') ;
//           if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'fix.cds') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'fix.cds') ;
//          if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'rd.cds') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'rd.cds') ;
//           if FileExists(GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png') then
//              Deletefile(GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png') ;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (ssCtrl in Shift)  then
//
//  showmessage('ji');
//  form1.ButtonedEdit1RightButtonClick;

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#32 then
ToolButton1.click;


case Key of
  #49:begin
        if PopupMenu4.Items[2].Items[0].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[0].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #50:begin
        if PopupMenu4.Items[2].Items[1].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[1].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #51:begin
        if PopupMenu4.Items[2].Items[2].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[2].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #52:begin
        if PopupMenu4.Items[2].Items[3].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[3].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #53:begin
        if PopupMenu4.Items[2].Items[4].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[4].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #54:begin
        if PopupMenu4.Items[2].Items[5].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[5].Caption)
        else
          Application.MessageBox('Please setting the station at first!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);

      end;

  #55:begin
        if PopupMenu4.Items[2].Items[6].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[6].Caption)
        else
          Application.MessageBox('Please setting the station at first!',appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;

  #56:begin
        if PopupMenu4.Items[2].Items[7].Caption<>'' then
          PlayMusic(PopupMenu4.Items[2].Items[7].Caption)
        else
          Application.MessageBox('Please setting the station at first!',appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
      end;


end;

end;

procedure TForm1.FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if Sender = TrackBar1  then
TrackBar1.Position:=TrackBar1.Position-5;
end;

procedure TForm1.FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
if Sender = TrackBar1  then
TrackBar1.Position:=TrackBar1.Position+5;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
// TThread.CreateAnonymousThread(ShowNet).Start;
// showlog('http://www.abroadradio.net/1.html');
end;

function getacomputername: string;
var
 tmpstr: PChar;
 Len : ^DWord;
begin
  GetMem(tmpstr,255);
  New(Len);
  Len^:= 255;
  if GetComputerName(tmpstr,Len^) then
    result:= StrPas(tmpstr)
  else
    result:='Unkown Host';
  FreeMem(tmpstr,255);
  Dispose(Len);
end;


//RegisterHotKey(handle,id1,mod_alt,83);
//RegisterHotkey(Handle,ID,mod_alt,80);

procedure TForm1.FormShow(Sender: TObject);
var  node: TTreeNode;
i,j:Byte;
//key,keyname:string;
Dir : array[0..MAX_PATH] of Char;
ini:TIniFile;
begin
//  Keycode('https://www.abroadradio.net') ;
  DeleteUrlCacheEntry(PChar(website));
  GetSystemDirectory(Dir, MAX_PATH);
  TreeView1.Items[0].Expanded := True;
  TreeView1.SetFocus();
  TreeView1.items[1].expanded:=true;
   Form2.loadini ;
   Form2.loadreg ;
  if Form2.CheckBox6.Checked  then
      Killthunder ;
//    key:=Form2.labelededit6.Text;
//   keyname:=Form2.labelededit4.Text;
  ToolButton5.hint:=form2.combobox11.text ;


  if not Form2.CheckBox14.Checked  then
        Day.Create();
//  Dplay.Enabled :=true;

    if showstatus  then
     begin
        form1.StartCheck ;
//         initbass;
         form2.HotKeyIndex1 := HotKeyManager1.AddHotKey(form2.HotKey1.HotKey);
         form2.HotKeyIndex2 := HotKeyManager1.AddHotKey(form2.HotKey2.HotKey);
         form2.HotKeyIndex3 := HotKeyManager1.AddHotKey(form2.HotKey3.HotKey);
         form2.HotKeyIndex4 := HotKeyManager1.AddHotKey(form2.HotKey4.HotKey);
         form2.HotKeyIndex5 := HotKeyManager1.AddHotKey(form2.HotKey5.HotKey);
         form2.HotKeyIndex6 := HotKeyManager1.AddHotKey(form2.HotKey6.HotKey);
         form2.HotKeyIndex7 := HotKeyManager1.AddHotKey(form2.HotKey7.HotKey);
         form2.HotKeyIndex8 := HotKeyManager1.AddHotKey(form2.HotKey8.HotKey);
         form2.HotKeyIndex9 := HotKeyManager1.AddHotKey(form2.HotKey9.HotKey);
         form2.HotKeyIndex10 := HotKeyManager1.AddHotKey(form2.HotKey10.HotKey);

          if nowdate < FormatDateTime('mmdd',Now) then
            emptylist;

//        if Form2.CheckBox21.Checked  then
//        begin
//            if form2.labelededit8.text<>'' then
//              shellExecute(handle,'open',PChar(form2.labelededit8.text),nil,nil,SW_NORMAL)
//            else
//                Application.MessageBox('未找到代理软件,请进入“设置”--“代理”进行相关设置！', appname,
//                  MB_OK + MB_ICONINFORMATION);
//        end;

        if Form2.checkbox12.checked then
          CICIvoice ;

//         if Form2.checkbox11.checked then
//          label10.visible:=True;

        if Form2.checkbox19.checked then
          panel9.visible:=false;

        if (Form2.CheckBox4.checked) and (CheckOffline) then
          checkupdate;

       //        if Regaro(ansistring(Form2.Edit1.Text+'.xml')) then

        try
            for j := 0 to treeview1.items.count do
              begin
                if treeview1.items[j].text = form2.combobox12.text then
                begin
                  treeview1.items[j].selected := true;
                  treeView1.items[j].Expanded := true;
                  break;
                end;
              end;
//              ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
            except
            Application.MessageBox('Treeview load error,please check it!', appname, MB_OK +
            MB_ICONSTOP + MB_TOPMOST);
            end;

        if FileExists(GetHomePath+'\'+ansistring(Form2.Edit1.Text+'.xml'))  then
         begin
            form2.checkbox1.enabled:=true;
            PopupMenu10.autopopup:=true;
            regeditaro :=True;
            Label11.Visible:=True ;
            form2.speedbutton14.enabled:=true;
            form2.checkbox16.enabled:=true;
            form2.checkbox20.enabled:=true;
            ToolButton7.enabled:=True;
            ToolButton22.enabled:=True;
            ToolButton7.hint:='Cloudy Backup';
            ToolButton22.Hint:='Update';
            ToolButton20.Hint:='Mobile';
            ToolButton26.Hint:='Enabled/Disabled listening TV';
            PopupMenu4.items[9].enabled:=True ;
            ToolButton20.enabled:=True;
            ToolButton26.enabled:=True;
            PopupMenu10.items[0].enabled:=True ;
            form2.groupbox18.visible:=true;
            form2.groupbox16.visible:=true;
            form2.groupbox14.enabled:=true;
//            form2.groupbox12.Visible:=True ;
            Form1.Caption:=Appname ;
         end
         else begin
            regeditaro:=false ;
            deletepg18;
            form2.speedbutton14.enabled:=False ;
            form2.RadioGroup2.Controls[2].Enabled :=False;
            form2.RadioGroup2.Controls[3].Enabled :=False;
            PopupMenu10.autopopup:=false;
//            form2.groupbox12.Visible:=False;
            form2.checkbox1.enabled:=false;
            ToolButton20.enabled:=False;
            ToolButton26.enabled:=False;
            ToolButton22.enabled:=False;
            Label11.Visible :=false;
            form2.groupbox18.visible:=False ;
            form2.groupbox16.visible:=False ;
            form2.groupbox14.enabled:=False ;
            form2.checkbox16.enabled:=False;
            form2.checkbox20.enabled:=False;
             PopupMenu4.items[9].enabled:=False  ;
             PopupMenu10.items[0].enabled:=False  ;
             ToolButton7.enabled:=false;
             ToolButton7.hint:='Cloudy Backup(Only for register)';
            ToolButton22.Hint:='Update(Only for register)';
            ToolButton20.Hint:='Mobile(Only for register)';
            ToolButton26.Hint:='Enabled/Disabled listening TV(Only for register)';
//             form2.checkbox11.enabled:=True;
             Form1.Caption:=Appname+' - Unregister';
         end;

         if Form2.CheckBox13.Checked  then
          begin
          case Form2.RadioGroup2.ItemIndex of
          0:begin
              Notebook1.PageIndex :=0;
              TreeView1.Select(TreeView1.Items[0]);
              ClientDataSet1.Filter := '';
              ClientDataSet1.Filtered := True;
              ClientDataSet1.Locate('电台名称',number ,[]);
              DBGrid1CellClick(DBGrid1.Columns[1]);
              toolbutton1.Click ;
              playstatus:=3;
            end;
          1: randplay;

//          2:begin
//            for i := 0 to treeview1.items.count do
//            begin
//            if treeview1.items[i].text = '报刊杂志' then
//            begin
//              treeview1.items[i].selected := true;
//              treeView1.items[i].Expanded := true;
//              break;
//            end;
//            end;
//            end;
//          3:begin
//            for i := 0 to treeview1.items.count do
//            begin
//            if treeview1.items[i].text = 'Kindle' then
//            begin
//              treeview1.items[i].selected := true;
//              treeView1.items[i].Expanded := true;
//              break;
//            end;
//            end;
//            end;

              end;
          end;

         TThread.CreateAnonymousThread(ShowNet).Start;
        showstatus :=False ;

     end;
      DBGrid1CellClick(DBGrid1.Columns[1]);

end;
//end;





function TForm1.GetBuildInfo: string;
var verinfosize : DWORD; verinfo : pointer;
vervaluesize : dword; vervalue : pvsfixedfileinfo;
dummy : dword; v1,v2,v3: word;
begin
  verinfosize := getfileversioninfosize(pchar(paramstr(0)),dummy);
  if verinfosize = 0 then
  begin
    dummy := getlasterror;
    result := '0.0.0.0';
  end;
  getmem(verinfo,verinfosize);
  getfileversioninfo(pchar(paramstr(0)),0,verinfosize,verinfo);
  verqueryvalue(verinfo,'\',pointer(vervalue),vervaluesize);
  with vervalue^ do begin
    v1 := dwfileversionms shr 16;
    v2 := dwfileversionms and $ffff;
    v3 := dwfileversionls shr 16;
  end;
  result := inttostr(v1) +inttostr(v2) + inttostr(v3);
  freemem(verinfo,verinfosize);
end;

function TForm1.GetFilter: string;
begin
if CheckBox1.Checked then
  Result:= Format('%s %s %s ''%s''',
    ['(电台类别='+QuotedStr(combobox1.Text)+')and (电台国家='+QuotedStr(combobox3.Text)+')','and 电台名称', 'like','%'+lowercase(combobox2.Text)+'%'])
 else
  Result:= Format('%s %s %s ''%s''',
    ['电台类别='+QuotedStr(combobox1.Text)+'and','电台名称', 'like','%'+lowercase(combobox2.Text)+'%']);

end;

function TForm1.GetShellFolders(strDir: string): string;
const
  regPath = '\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders';
var
  Reg: TRegistry;
  strFolders: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(regPath, false) then begin
      strFolders := Reg.ReadString(strDir);
    end;
  finally
    Reg.Free;
  end;
  result := strFolders;
end;

function TForm1.GetSysDir: String;
var p:Pchar;
begin
  GetMem(P,255);
  GetSystemDirectory(p,254);
  Result := p;
  Freemem(p);
end;

procedure TForm1.GuessYoulike(name, coutry: string);
var s,n:integer;
cds1:TClientDataSet;
begin
try

try
  cds1:=Tclientdataset.create(nil);
  cds1.Data :=ClientDataSet1.data;
  cds1.Filtered :=false;
  cds1.Filter:='(电台类别='+ QuotedStr(name) +') and (电台国家='+QuotedStr(coutry) + ')';
  cds1.Filtered := True;
  if cds1.RecordCount >1 then
  begin
//  panel7.visible:=True ;
  Randomize;
  cds1.first;
  cds1.edit;
  for s:=0 to PopupMenu13.items.count-1 do
    Begin
//      if panel7.Controls[s] is TLabel  then
//      begin
        n:=random(cds1.recordcount);
        Cds1.MoveBy(n);
        PopupMenu13.items[s].caption :=cds1.fieldbyname('电台名称').asstring;
        Cds1.Delete ;
//      end;
    End;
    end
    else begin
//      label7.Visible :=true;
//      Panel7.visible:=false;
    end;
    finally
  cds1.free;
end;
except
//  panel7.visible:=false;
end;

end;


procedure TForm1.Hotkey;
begin
//HotKeyIndex1 := HotKeyManager1.AddHotKey(form2.HotKey1.HotKey);
//HotKeyIndex2 := HotKeyManager1.AddHotKey(form2.HotKey2.HotKey);
//HotKeyIndex3 := HotKeyManager1.AddHotKey(form2.HotKey3.HotKey);
//HotKeyIndex4 := HotKeyManager1.AddHotKey(form2.HotKey4.HotKey);
end;

procedure TForm1.HotKeyManager1HotKeyPressed(HotKey: Cardinal; Index: Word);
begin
SetForegroundWindow(Application.Handle);
  if Index = form2.HotKeyIndex2 then
  begin
     if form1.TrackBar1.Position <40 then
     begin
      form1.TrackBar1.position:=form1.TrackBar1.position+5;
      end
     else
     Application.MessageBox('The volume is maximum!', appname, MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  if index = Form2.HotKeyIndex1  then
  begin
     if form1.TrackBar1.Position >0 then
     begin
        form1.TrackBar1.position:= form1.TrackBar1.position-5;
     end
     else
     Application.MessageBox('The volume is minimum!', appname, MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  if index = Form2.HotKeyIndex3  then
  begin
  form1.ToolButton1click(nil);
  end
  else
  if index = Form2.HotKeyIndex4  then
  begin
    form1.speedbutton10click(nil);
  end
  else
  if index = Form2.HotKeyIndex5  then
  begin
    form1.ToolButton4click(nil);
  end
  else
  if index = Form2.HotKeyIndex6  then
  begin
    form1.N23Click(nil); //前一个
  end
  else
  if index = Form2.HotKeyIndex7  then
  begin
    form1.N24Click(nil);   //后一个
  end
  else
  if index = Form2.HotKeyIndex8  then
  begin
//    PopupMenu1.Items[5].Items[3].Click;  //静音
    form1.N13Click(nil);
//    form1.ToolButton23click(nil);
  end
  else
  if index = Form2.HotKeyIndex9  then
  begin
    PopupMenu1.Items[6].Click;    //录音
//    form1.ToolButton2.click;
  end
  else
  if index = Form2.HotKeyIndex10  then
  begin
  form2.CheckBox18.Checked:= not Form2.CheckBox18.Checked ;
  end
end;

procedure TForm1.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
ProgressBar1.Position := AWorkCount;
end;

procedure TForm1.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
 progressBar1.Position:=0;
end;

procedure TForm1.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
ProgressBar1.Position := 100;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
PlayMusic('Hot Film')
//shellExecute(handle,'open',PChar('https://weibo.com/abroadradio'),nil,nil,SW_NORMAL)
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
//  WindowsMediaPlayer1.controls.stop ;
//  PlayMusic('BBC World Service UK');
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
Form2.loadkindle;
//showkindle('Time');
end;

procedure TForm1.Image4Click(Sender: TObject);
begin
Panel7.Visible:=True;
//Form2.loadkindle;
ComboBox4.OnChange(self);
TThread.CreateAnonymousThread(Showkindle).Start;
end;

procedure TForm1.Image4MouseEnter(Sender: TObject);
begin
Image4.left:=Image4.left+5;
Image4.top:=Image4.top-3;
end;

procedure TForm1.Image4MouseLeave(Sender: TObject);
begin
Image4.left:=Image4.left-5;
Image4.top:=Image4.top+3;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
Form2.loadkindle;
//showkindle('Reader');
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
Form2.loadkindle;
//showkindle('FT');
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
Form2.loadkindle;
//showkindle('Guardian');
end;

procedure TForm1.Image8Click(Sender: TObject);
begin
Form2.loadkindle;
//showkindle('NYT');
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
//  WindowsMediaPlayer1.controls.stop ;
//  PlayMusic('NDR Info');
end;

procedure TForm1.Image9DblClick(Sender: TObject);
begin
//  WebBrowser1.Navigate('http://www.abroadradio.net/ting/bbc.html');
end;


procedure TForm1.initbass;
//var
//  c: Integer;
//  dName: PAnsiChar;
//  level: Single;
begin
//	if (HIWORD(BASS_Ge电视台ersion) <> BASSVERSION) then
//	begin
//    Application.MessageBox('Bass.dll音频库导入出错,请重新安装软件。', appname,
//      MB_OK + MB_ICONSTOP + MB_TOPMOST);
//		Halt;
//	end;
//  win := Handle;
//  if (not BASS_RecordInit(-1))  then
//  begin
//  with form1.TrayIcon1 do
//  begin
//    BalloonTitle :=appname+' 提示:';
//    BalloonHint:='检测到您的录音设备可能未被开启，建议您可以通过百度搜索“开启win7混音功能”来解决。';
//    BalloonFlags:=bfInfo ;
//    ShowBalloonHint ;
//  end;
//
//	end
//  else   begin
////	WaveStream := TMemoryStream.Create;
//	c := 0;
//	dName := BASS_RecordGetInputName(c);
//	while dName <> nil do
//	begin
//		Form2.ComboBox5.Items.Add(StrPas(dName));
//		// is this one currently "on"?
//		if (BASS_RecordGetInput(c, level) and BASS_INPUT_OFF) = 0 then
//    begin
//        input:=c;
//        	Form2.ComboBox5.ItemIndex := c;
//          UpdateInputInfo ;
//    end;
//		Inc(c);
//		dName := BASS_RecordGetInputName(c);
//	end;
//  BASS_RecordSetInput(form2.ComboBox5.ItemIndex, 0, 1);
//end;

end;

function TForm1.isvista: Boolean;
begin
  Result:=lobyte(loword(getversion))>=6;
//   Result:= (Ge电视台ersion() and $FFFF)=$0106;
end;

function TForm1.iswin64: boolean;
var
  Kernel32Handle: THandle;
  IsWow64Process: function(Handle: Windows.THandle; var Res: Windows.BOOL): Windows.BOOL; stdcall;
  GetNativeSystemInfo: procedure(var lpSystemInfo: TSystemInfo); stdcall;
  isWoW64: Bool;
  SystemInfo: TSystemInfo;
const
  PROCESSOR_ARCHITECTURE_AMD64 = 9;
  PROCESSOR_ARCHITECTURE_IA64 = 6;
begin
  Kernel32Handle := GetModuleHandle('KERNEL32.DLL');
  if Kernel32Handle = 0 then
    Kernel32Handle := LoadLibrary('KERNEL32.DLL');
  if Kernel32Handle <> 0 then
  begin
    IsWOW64Process := GetProcAddress(Kernel32Handle,'IsWow64Process');
    GetNativeSystemInfo := GetProcAddress(Kernel32Handle,'GetNativeSystemInfo');
    if Assigned(IsWow64Process) then
    begin
      IsWow64Process(GetCurrentProcess,isWoW64);
      Result := isWoW64 and Assigned(GetNativeSystemInfo);
      if Result then
      begin
        GetNativeSystemInfo(SystemInfo);
        Result := (SystemInfo.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) or
                  (SystemInfo.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_IA64);
      end;
    end
    else Result := False;
  end
  else Result := False;
end;

procedure TForm1.janTracker1ChangedValue(sender: TObject; NewValue: Integer);
begin

end;

//end;




procedure TForm1.Killthunder;
var
 ProcessSnapShotHandle: THandle;
 ProcessEntry: TProcessEntry32;
 ProcessHandle: THandle;
 Ret: BOOL;
begin
 ProcessSnapShotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
 if ProcessSnapShotHandle>0 then
 begin
   ProcessEntry.dwSize:=SizeOf(TProcessEntry32);
   Ret:=Process32First(ProcessSnapShotHandle, ProcessEntry);
   while Ret do
   begin
     if (ProcessEntry.szExeFile='Thunder.exe') or (ProcessEntry.szExeFile='Flashget3.exe')
      or (ProcessEntry.szExeFile='QQDownload.exe') or (ProcessEntry.szExeFile='MiniThunder.exe') then //你要关闭的程序 注意：大小写敏感
     begin
       ProcessHandle:=OpenProcess(PROCESS_TERMINATE, False,
         ProcessEntry.th32ProcessID);
       if ProcessHandle>0 then
       begin
         TerminateProcess(ProcessHandle, 0);
         CloseHandle(ProcessHandle)
       end
     end;
     Ret:=Process32Next(ProcessSnapShotHandle, ProcessEntry)
   end;
   CloseHandle(ProcessSnapShotHandle)
 end
end;



procedure TForm1.Kindle1Click(Sender: TObject);
begin
form1.Show;
WindowState := TWindowState(tag);
SetForegroundWindow(Handle);
form1.notebook2.pageindex:=3;
end;

procedure TForm1.Kindle2Click(Sender: TObject);
begin
form2.SpeedButton3.click;
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
shellExecute(handle,'open',PChar(webad),nil,nil,SW_NORMAL);

end;

procedure TForm1.Label10MouseEnter(Sender: TObject);
begin
label10.font.color:=clred;
end;

procedure TForm1.Label10MouseLeave(Sender: TObject);
begin
label10.font.color:=clblue;
end;

procedure TForm1.Label11Click(Sender: TObject);
begin
//  ShellExecute(0, nil, PChar('http://weibo.com/abroadradio'), nil, nil, 1);
end;

procedure TForm1.Label11MouseEnter(Sender: TObject);
begin
//  label11.hint:=label11.caption;
end;

procedure TForm1.Label11MouseLeave(Sender: TObject);
begin
//  label11.font.color:=clblue;
end;

procedure TForm1.Label12MouseEnter(Sender: TObject);
begin
//label12.font.color:=clred;
end;

procedure TForm1.Label12MouseLeave(Sender: TObject);
begin
//label12.font.color:=clblue;
end;

procedure TForm1.Label13Click(Sender: TObject);
begin


//playmusic(label13.caption);
//panel7.visible:=false;
end;

procedure TForm1.Label13MouseEnter(Sender: TObject);
begin
//label13.font.color:=clred;
//label13.hint:=label13.caption;
end;

procedure TForm1.Label13MouseLeave(Sender: TObject);
begin
//label13.font.color:=clblue;
end;

procedure TForm1.Label14Click(Sender: TObject);
begin
//shellExecute(handle,'open',PChar(website+'detail.pdf'),nil,nil,SW_NORMAL);
end;

procedure TForm1.Label14MouseEnter(Sender: TObject);
begin
//label4.Font.Color :=clRed
end;

procedure TForm1.Label14MouseLeave(Sender: TObject);
begin
//label4.Font.Color :=clblue;
end;

procedure TForm1.Label14MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label14.Hint:=Label14.Caption;
end;

procedure TForm1.Label15Click(Sender: TObject);
begin
//ShowMessage(form1.ClientDataSet1.fieldbyname('电台地址').asstring);
//MediaPlayer1.Close ;
//MediaPlayer1.FileName :='https://lhttp.qingting.fm/live/386/64k.mp3';
//MediaPlayer1.Open ;
//MediaPlayer1.Play;
end;

procedure TForm1.Label16Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  with form2 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Show ;
      Notebook1.ActivePage:='10';
    end;
end;

procedure TForm1.Label17Click(Sender: TObject);
begin
//ShellExecute(0, nil, PChar(website+'qs.html'), nil, nil, 1);
end;

procedure TForm1.Label17MouseEnter(Sender: TObject);
begin
//label17.font.color:=clred;
end;

procedure TForm1.Label17MouseLeave(Sender: TObject);
begin
//label17.font.color:=clblue;
end;

procedure TForm1.Label18Click(Sender: TObject);
//var qq,address:string;
begin
if qq<>'Anonymous' then
begin
  if qq='Skype' then
  ShellExecute(handle,'open',PChar('skype:'+update+'?call'),nil,
               nil,SW_SHOWNORMAL)
//  else if qq='Yahoo!Messenger' then
//  ShellExecute(handle,'open',PChar('ymsgr:sendIM?'+update+''),nil,
//               nil,SW_SHOWNORMAL)
  else if qq='Email' then
  ShellExecute(Handle,'open', pchar('mailto:'+update),nil,nil, SW_SHOWNORMAL)

//  else if qq='淘宝旺旺' then
//  ShellExecute(handle,'open',PChar('https://www.taobao.com/webww/ww.php?ver=3&touid='+update+'&siteid=cntaobao&status=2&charset=utf-8='),nil,
//               nil,SW_SHOWNORMAL);
  else if qq='QQ' then
  begin
    Clipboard.AsText:=update;
    Application.MessageBox('Copy QQ number to clipboard.', PChar(appname), MB_OK +
      MB_ICONINFORMATION);

  end;

end
else
  Application.MessageBox('Anonymous don''t provide any communication!', appname, MB_OK +
    MB_ICONWARNING + MB_TOPMOST);
end;





procedure TForm1.Label18MouseEnter(Sender: TObject);
begin
label18.hint:='Communicate with the sharer';
end;

procedure TForm1.Label19Click(Sender: TObject);
begin
playmusic(label19.caption);
end;

procedure TForm1.Label19MouseEnter(Sender: TObject);
begin
label19.hint:=genre;
end;

procedure TForm1.Label20MouseEnter(Sender: TObject);
begin
//label20.hint:=label20.caption;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
//  shellExecute(handle,'open',PChar('https://weibo.com/abroadradio'),nil,nil,SW_NORMAL);

end;

procedure TForm1.Label2MouseEnter(Sender: TObject);
begin
  Label2.Font.Style:=[fsunderline];
end;

procedure TForm1.Label2MouseLeave(Sender: TObject);
begin
  Label2.Font.Style:=[];
end;

procedure TForm1.Label3MouseEnter(Sender: TObject);
begin
//  label3.Hint :=label11.Caption;
end;

procedure TForm1.Label5Click(Sender: TObject);
begin
//  ShellExecute(0, nil, PChar('http://abroadradio.net/'), nil, nil, 1);
end;

procedure TForm1.Label5MouseEnter(Sender: TObject);
begin
//  Label5.font.color:=clred;
end;

procedure TForm1.Label5MouseLeave(Sender: TObject);
begin
//  Label5.font.color:=clblue;
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
//if DownloadFile(website+'netpanpd.txt',GetHomePath+'\ARO\netpanpd.txt') then
//    ShellExecute(0, nil, PChar(GetHomePath+'\ARO\netpanpd.txt'), nil, nil, 1);

end;



procedure TForm1.Label8Click(Sender: TObject);
begin
//if label8.Tag=0 then
//begin
//    ClientDataSet1.Filtered:=false;
//  ClientDataSet1.Filter :='视频类型=''电视台''and 电台名称 ='+#39+trim(buttonededit1.text)+'*'+#39;
//   ClientDataSet1.Filtered:=true;
//  label8.caption:='返回所有电台';
//  label8.tag:=1;
//end
//else begin
//  ClientDataSet1.Filtered:=false;
//  ClientDataSet1.Filter :='电台名称 ='+#39+trim(buttonededit1.text)+'*'+#39;
//  ClientDataSet1.Filtered:=True;
//  label8.caption:='仅显示电视台';
//  label8.tag:=0;
//end;
end;

procedure TForm1.Label8MouseEnter(Sender: TObject);
begin
//cds:=Tclientdataset.create(nil)
//cds.data := clientdataset1.data;
//clientdataset1.filter := xxxx;
//clientdataset1.filtered := true;

//label8.hint:='累计流量值从 '+formatdatetime('yyyy-mm-dd',form2.datetimepicker1.date)+' 开始计算';
//image5.hint:=label8.hint;
end;


procedure TForm1.Label9MouseEnter(Sender: TObject);
begin
//label9.font.color:=clred;
//label9.hint:=label9.caption;
end;

procedure TForm1.Label9MouseLeave(Sender: TObject);
begin
//label9.font.color:=clblue;
end;

procedure TForm1.LabeledEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//playmusic(LabeledEdit1.text);
end;






procedure TForm1.loaddata;
begin
//  if ToolButton9.Tag=1  then
  if PopupMenu4.items[1].tag=1 then
    begin
       form3.LabeledEdit3.Text:=form1.ClientDataSet1.FieldByName('电台地址').AsString ;
      Form3.RadioGroup1.ItemIndex := Form3.RadioGroup1.items.IndexOf(ClientDataSet1.FieldByName('电台类型').AsString);
      if Form3.RadioGroup1.ItemIndex<>0  then
      begin
      Form3.Panel1.visible:=True ;
      Form3.ComboBox4.Text:=form1.ClientDataSet1.FieldByName('自定义2').AsString ;
      end
      else begin
      Form3.Panel1.visible:=False ;
      Form3.ComboBox4.text:='';
      end;

      Form3.BitBtn2.Caption :='修改';
      Form3.Button1.Visible :=True;

       if ClientDataSet1.FieldByName('电台分组').asstring<>'' then
          Form3.checkbox5.Checked :=true;

       if ClientDataSet1.FieldByName('收藏').asstring ='★' then
          Form3.checkbox3.Checked :=true;
      Form3.LabeledEdit1.Text:=form1.ClientDataSet1.FieldByName('电台名称').AsString ;
      Form3.LabeledEdit4.Text:=form1.ClientDataSet1.FieldByName('电台网址').AsString ;
      Form3.ComboBox1.Text:=form1.ClientDataSet1.FieldByName('电台国家').AsString ;
//      ShowMessage(IntToStr(Form3.RadioGroup1.ItemIndex));
    end
    else
    begin
      PopupMenu4.items[1].tag:=0;
//      ToolButton9.Tag:=0;
      Form3.button1.Visible :=False;
    end;
end;



//procedure TForm1.loadkindle;
//var inifile:TIniFile;
//begin
//  try
//    inifile:=Tinifile.Create(form1.GetShellFolders('Personal')+'\ARO'+'\'+'kindle.dat');
//    form2.ComboBox4.ItemIndex  :=inifile.ReadInteger('info','drive',form2.ComboBox4.ItemIndex);
//    form2.ComboBox7.ItemIndex := inifile.ReadInteger('info','kindlesys',form2.ComboBox7.ItemIndex);
//    form2.ComboBox7.Oncloseup(self);
//    form2.Edit4.Text :=inifile.ReadString('info','direct',form2.Edit4.Text);
//  finally
//    inifile.Free;
//end;
//end;

procedure TForm1.loadll;
var i:tinifile;
begin
  try
    i:=TIniFile.Create(gethomepath+'\ARO\ll.dat');
    nowdate:=i.readString('ll','time',FormatDateTime('mmdd',now));
    Edit1.Text :=i.ReadString('ll','backup',Edit1.Text);
    TrackBar1.position:=i.readInteger('ll','loud1',TrackBar1.position);
    ip:= i.readstring('ll','local',ip);
    number:=i.ReadString('ll','lastnumber',ClientDataSet1.FieldByName('电台名称').AsString);
  finally
    i.free;
  end;
end;

procedure TForm1.loadplan;
begin
if PopupMenu5.items[0].Tag=1  then

//if ToolButton5.Tag=1  then
    begin
      Form5.LabeledEdit1.Text:=ClientDataSet1.FieldByName('电台名称').AsString ;
      if ClientDataSet1.fieldbyname('电台类型').asstring='网页电台' then
        Form5.RadioGroup1.Controls[1].Enabled := False;
      Form5.RadioGroup1.ItemIndex := Form5.RadioGroup1.items.IndexOf(ClientDataSet1.FieldByName('计划类型').AsString);
      Form5.DateTimePicker1.Time:=ClientDataSet1.FieldByName('开始时间').AsDateTime;
      Form5.DateTimePicker2.Time:=ClientDataSet1.FieldByName('结束时间').AsDateTime;
      if TimeToStr(ClientDataSet1.FieldByName('开始时间').asdatetime)<>'' then
        Form5.RadioButton5.Checked :=true;
      if ClientDataSet1.FieldByName('周期').asstring<>'' then
        begin
        if AnsiContainsText(ClientDataSet1.FieldByName('周期').asstring,'星期') then
        begin
            Form5.RadioButton4.Checked :=true;
            Form5.ComboBox1.Text:=ClientDataSet1.FieldByName('周期').asstring;
                end
        else begin
               Form5.radiobutton1.checked:=True;
              form5.datetimepicker3.date:=StrToDateTime(ClientDataSet1.FieldByName('周期').asstring);
            end;

      if ClientDataSet1.FieldByName('完成动作').asstring <>'' then
        begin
          Form5.checkbox1.Checked :=true;
          Form5.ComboBox2.Text:=ClientDataSet1.FieldByName('完成动作').asstring;
        end;
        end;
      Form5.BitBtn1.Caption :='Edit';
      Form5.BitBtn3.Visible :=True ;
    end
    else
    popupmenu5.items[0].tag:=0;
//    ToolButton5.Tag:=0;
end;

procedure TForm1.localradio;
var local:string;
begin
if CheckOffline then
  begin
    Clientdataset1.filteroptions:=[];
    if AnsiContainsText(Form2.combobox13.Text,'省') then
    begin
      local:=copy(ipaddress, pos('省', Form2.combobox13.Text)+1);
      ClientDataSet1.Filter:='自定义2 ='+#39+trim(local)+'*'+#39;
//      ClientDataSet1.filter:='电台名称 like'+ quotedstr('%'+local+'%');
    end
    else
//    ClientDataSet1.Filter:='电台名称 like '+#39+trim(ipaddress)+'*'+#39;
    ClientDataSet1.filter:='自定义2 like'+ quotedstr('%'+Form2.combobox13.Text+'%');
    ClientDataSet1.Filtered := True;
//      ClientDataSet1.Filter:='电台名称 ='+#39+trim(Form2.combobox13.Text)+'*'+#39;
//    end;
    if ClientDataSet1.RecordCount =0 then
        begin
          Application.MessageBox('Don''t find your country, and will switch to <My Favorite>.', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
          TreeView1.Select(form1.TreeView1.Items[1]);
//          ClientDataSet1.Filter:='电台名称 ='+#39+trim('中央台')+'*'+#39;
        end;
    ClientDataSet1.Filtered := True;

//    if ClientDataSet1.RecordCount =0 then
//        begin
//        case Application.MessageBox('未找到您所在的省份或直辖市，是否希望直接导入中央人民广播电台？',
//          appname, MB_OKCANCEL + MB_ICONQUESTION) of
//          IDOK:
//            begin
//              Form1.N20.Click;
//              ClientDataSet1.Filter:='电台名称 ='+#39+trim('中央台')+'*'+#39;
//              ClientDataSet1.Filtered := True;
//            end;
//          IDCANCEL:
//            begin
//
//            end;
//        end;
//
//
//        end;

//    ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);

    end
  else
  Application.MessageBox('Station database load failed, please check the network!', appname, MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);

end;

function TForm1.lyric: Boolean;
begin
end;

procedure TForm1.Loadradio;
var i:tinifile;
begin
  try
    i:=TIniFile.Create(GetHomePath+'\ARO\channel.dat');
    popupmenu4.Items[2].Items[0].Caption:=i.ReadString('music','0',popupmenu4.Items[2].Items[0].Caption);
    popupmenu4.Items[2].Items[1].Caption:=i.ReadString('music','1',popupmenu4.Items[2].Items[1].Caption);
    popupmenu4.Items[2].Items[2].Caption:=i.ReadString('music','2',popupmenu4.Items[2].Items[2].Caption);
    popupmenu4.Items[2].Items[3].Caption:=i.ReadString('music','3',popupmenu4.Items[2].Items[3].Caption);
    popupmenu4.Items[2].Items[4].Caption:=i.ReadString('music','4',popupmenu4.Items[2].Items[4].Caption);
    popupmenu4.Items[2].Items[5].Caption:=i.ReadString('music','5',PopupMenu4.Items[2].Items[5].Caption);
    popupmenu4.Items[2].Items[6].Caption:=i.ReadString('music','6',popupmenu4.Items[2].Items[6].Caption);
    popupmenu4.Items[2].Items[7].Caption:=i.ReadString('music','7',popupmenu4.Items[2].Items[7].Caption);
//    ToolButton17.imageindex:=i.readinteger('music','randplay',ToolButton17.imageindex);
//    lweibo:=i.readstring('music','weibo',lweibo);
  finally
    i.Free ;
  end;



end;



procedure TForm1.loadtree;
var
  F: TFileStream;
begin
//  if sim then
//    F := TFileStream.Create(ExtractFilePath(Application.ExeName)+'rda.dat', fmOpenRead or fmShareDenyWrite)
//  else
    F := TFileStream.Create(GetHomePath+'\rde.dat', fmOpenRead or fmShareDenyWrite);

  try
    F.ReadComponent(TreeView1);
  finally
    F.Free;
  end;
end;

function TForm1.MakeFileList(Path, FileExt: string): TStringList;
var
sch:TSearchrec;
begin
Result:=TStringlist.Create;
if rightStr(trim(Path), 1) <> '\' then
    Path := trim(Path) + '\'
else
    Path := trim(Path);
if not DirectoryExists(Path) then
begin
    Result.Clear;
    exit;
end;
if FindFirst(Path + '*', faAnyfile, sch) = 0 then
begin
    repeat
       Application.ProcessMessages;
       if ((sch.Name = '.') or (sch.Name = '..')) then Continue;
       if DirectoryExists(Path+sch.Name) then
       begin
         Result.AddStrings(MakeFileList(Path+sch.Name,FileExt));
       end
       else
       begin
         if (UpperCase(extractfileext(Path+sch.Name)) = UpperCase(FileExt)) or (FileExt='.*') then
         Result.Add(Path+sch.Name);
       end;
    until FindNext(sch) <> 0;
    SysUtils.FindClose(sch);
end;
end;

procedure TForm1.N05X1Click(Sender: TObject);
begin
form2.TrackBar1.Position := 22050;
end;

procedure TForm1.N08X1Click(Sender: TObject);
begin
form2.TrackBar1.Position := 35280;
end;

procedure TForm1.N10Click(Sender: TObject);
var cds1:Tclientdataset;
begin
  cds1:=Tclientdataset.Create(nil);
try
   ClientDataSet1.DisableControls;
   ClientDataSet1.Filtered :=False;
   ClientDataSet1.Filter :='自定义1=' +QuotedStr(trim('Today'));
   ClientDataSet1.filtered:=True ;
   cds1.data:=clientdataset1.data;
with cds1 do
begin
  First;
  while not Eof do
  begin
    Edit;
    FieldByName('自定义1').AsString := '';
    Next;
  end;
  MergeChangeLog;
  ApplyUpdates(-1);
  ClientDataSet1.data:=cds1.data;
  SaveToFile(GetHomePath + DataBaseFileName);
  TreeView1.Select(TreeView1.Items[0]);
  end;
finally
  clientdataset1.EnableControls;
end;

  clientdataset1.filtered:=false;

end;

procedure TForm1.N110Click(Sender: TObject);
begin
//form2.checkbox17.checked:=not form2.checkbox17.checked;
//form2.saveini;
end;

procedure TForm1.N111Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[0].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[0].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N112Click(Sender: TObject);
begin
//panel7.visible:=not panel7.visible;
form2.saveini;
end;

procedure TForm1.N114Click(Sender: TObject);
begin
emptylist;
end;

procedure TForm1.N115Click(Sender: TObject);
begin
PopupMenu4.Items[3].items[0].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
PopupMenu4.Items[3].items[0].hint :=ClientDataSet1.FieldByName('电台地址').asstring;
//play:=False;
end;

procedure TForm1.N116Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  with form2 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Show ;
      Notebook1.ActivePage:='3';
    end;
end;

procedure TForm1.N117Click(Sender: TObject);
begin
PopupMenu4.Items[3].items[2].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
PopupMenu4.Items[3].items[2].hint :=ClientDataSet1.FieldByName('电台地址').asstring;
play:=False;
end;

procedure TForm1.N118Click(Sender: TObject);
begin
PopupMenu4.Items[3].items[3].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
PopupMenu4.Items[3].items[3].hint :=ClientDataSet1.FieldByName('电台地址').asstring;
play:=False;
end;

procedure TForm1.N119Click(Sender: TObject);
begin
PopupMenu4.Items[3].items[4].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
PopupMenu4.Items[3].items[4].hint :=ClientDataSet1.FieldByName('电台地址').asstring;
play:=False;
end;



procedure TForm1.N11Click(Sender: TObject);
begin
form2.Button16.Click ;
end;

procedure TForm1.N120Click(Sender: TObject);
begin
try
  ClientDataSet1.DisableControls;
  TreeView1.Select(TreeView1.Items[0]);
    ClientDataSet1.Filtered :=False;
    ClientDataSet1.Filter :='电台类别=' +QuotedStr(trim(youlikename)) ;
    ClientDataSet1.Filtered := True;

finally
  clientdataset1.EnableControls;
end;
end;

procedure TForm1.N121Click(Sender: TObject);
begin
try
  ClientDataSet1.DisableControls;
  TreeView1.Select(TreeView1.Items[0]);
    ClientDataSet1.Filtered :=False;
    ClientDataSet1.Filter :='电台国家=' +QuotedStr(trim(youlikecoutry)) ;
    ClientDataSet1.Filtered := True;

finally
  clientdataset1.EnableControls;
end;
end;

procedure TForm1.N122Click(Sender: TObject);
begin
playmusic(popupmenu13.items[1].caption);
end;

procedure TForm1.N124Click(Sender: TObject);
begin
playmusic(popupmenu13.items[0].caption);
end;

procedure TForm1.N126Click(Sender: TObject);
begin
PopupMenu4.Items[3].items[9].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
PopupMenu4.Items[3].items[9].hint :=ClientDataSet1.FieldByName('电台地址').asstring;
play:=False;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[3].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N12X1Click(Sender: TObject);
begin
form2.TrackBar1.Position := 66150;
end;

procedure TForm1.N13Click(Sender: TObject);
begin

//  if ToolButton1.tag=0 then
  if PopupMenu1.items[5].items[3].tag=0 then
    begin
      if ClientDataSet1.FieldByName('电台类型').asstring = 'Common' then
      BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 0);
//        windowsmediaplayer1.settings.mute:=True;
//      else
//        FlyFlv1.Mute :=True;
//      ToolButton1.ImageIndex:=5;
      PopupMenu1.items[5].items[3].tag:=1;
      PopupMenu1.items[5].items[3].caption:='Unmute';
      ToolButton23.ImageIndex :=35;
      ToolButton23.tag:=1;
      toolbutton23.Hint:='Unmute';
      TrayIcon1.IconIndex:=2;
    end
    else if  PopupMenu1.items[5].items[3].tag=1  then
    begin
      if ClientDataSet1.FieldByName('电台类型').asstring = 'Common' then
      BASS_ChannelSetAttribute(chan, BASS_ATTRIB_VOL, 1);
//        windowsmediaplayer1.settings.mute:=False;
//      else
//        FlyFlv1.Mute :=False ;
//      ToolButton1.ImageIndex:=6;
      ToolButton23.tag:=0;
      PopupMenu1.items[5].items[3].tag:=0;
      PopupMenu1.items[5].items[3].caption:='Mute';
      ToolButton23.ImageIndex :=36;
      toolbutton23.Hint:='Mute';
      TrayIcon1.IconIndex:=3;
    end;
end;





procedure TForm1.N15X1Click(Sender: TObject);
begin
form2.TrackBar1.Position := 52920;
end;





procedure TForm1.N171Click(Sender: TObject);
//var
//  cdsNew : TClientDataset ;
//  i : integer;
//  fieldName : string ;
//  save:TSaveDialog ;
begin
form2.button7.click;
//  form1.TreeView1.Select(form1.TreeView1.Items[171121]);
//  try
//   cdsNew := TClientDataset.Create(application);
//   save:=TSaveDialog.Create(nil);
//   save.Filter :='AbroadRadio收藏夹文件|*.cds';
//   save.DefaultExt:='cds';
//   form1.TreeView1.Selected.Text:='用户自定义';
//   try
//     Form1.ClientDataSet1.DisableControls ;
//     cdsNew.FieldDefs.Assign(Form1.ClientDataSet1.FieldDefs);
//     cdsNew.CreateDataset;
//     Form1.ClientDataSet1.First;
//  while not Form1.ClientDataSet1.eof do
//  begin
//    if Form1.ClientDataSet1.FieldByName('收藏').AsString = '★' then
//    begin
//      cdsNew.Append;
//      for i := 0 to (cdsNew.FieldCount-1) do
//      begin
//        fieldName := cdsNew.Fields[i].FieldName ;
//        cdsNew.FieldByName(fieldName).Value := form1.ClientDataSet1.FieldByName(fieldName).Value;
//      end;
//      cdsNew.Post;
//    end;
//    end;
//    Form1.ClientDataSet1.next;
//  end;
//  finally
//    form1.ClientDataSet1.EnableControls ;
//  end;
//
//
//  if save.Execute  then
//  begin
//    save.DefaultExt:='cds';
//    save.filename:=ChangeFileExt(Save.FileName,'.cds');
//    cdsNew.SaveToFile(save.FileName);
//     Application.MessageBox(pchar('收藏夹备份成功,共保存了'+inttostr(cdsnew.RecordCount)+'条记录！'), Appname, MB_OK + MB_ICONQUESTION);
//    form1.edit3.Text := save.FileName;
//    ShowMessage(save.FileName);
//  end;
//  finally
//    cdsNew.Free;
//    save.Free ;
//  end;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
form2.TrackBar1.Position := 44100;
end;

procedure TForm1.N19Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[6].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin

//  TrayIcon1.Visible := True ;
////  notebook2.activepage:='Default';
//  if not form2.checkbox20.checked then
//  WebBrowser4.Navigate('http://www.abroadradio.net/1.html');
//  notebook2.activepage:='Default';
//  form1.Show;
//  WindowState := TWindowState(tag);
//  SetForegroundWindow(Handle);
end;

procedure TForm1.N201Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*20);
Timer5.Enabled:=true;
ToolButton6.Down:=True ;
ToolButton6.Hint:='System will be close after '+FormatDateTime('hh:mm:ss',now+(1/24/60)*20)+',Click again for cancel.';
end;

procedure TForm1.N206Click(Sender: TObject);
begin
country:=ClientDataSet1.FieldByName('电台国家').AsString;
rkind:=ClientDataSet1.FieldByName('电台类别').AsString;
//buttonededit1.leftbutton.imageindex:=22;
//buttonededit1.leftbutton.hint:='在'+country+'的'+rkind+'中进行查找';
//ButtonedEdit1.TextHint:='在'+country+'的'+rkind+'类别中查找';
//ButtonedEdit1.Hint:='在'+country+'的'+rkind+'类别中查找';
//ButtonedEdit1.setfocus;
//label8.visible:=True;
end;

procedure TForm1.N20Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[0].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;


end;

procedure TForm1.N218Click(Sender: TObject);
var
//open:TOpenDialog ;
cdsnew: TClientDataSet ;data:array of string;  i:Integer;
MyStream:TMemoryStream;
begin
form1.TreeView1.Select(form1.TreeView1.Items[0]);
if form1.Edit3.Text<>'' then
begin
//  popupmenu4.items[10].items[2].enabled:=true;
  try
    cdsnew:=TClientDataSet.Create(nil);
    cdsnew.LoadFromFile(form1.Edit3.Text);
    try
  SetLength(data,10000);

  try
    Form1.ClientDataSet1.DisableControls;
  cdsnew.First;
  i := 0;
  while not cdsnew.Eof do
  begin
    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
    cdsnew.Next;
    i := i + 1;
  end;

  for i := 0 to cdsnew.RecordCount - 1 do
  begin
    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
    begin
    Form1.ClientDataSet1.Edit;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
    Form1.ClientDataSet1.Post;
    end
    else begin
    form1.ClientDataSet1.Insert ;
    cdsnew.Locate('电台名称',data[i],[]);
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:=cdsnew.FieldByName('收藏').AsString;
    Form1.ClientDataSet1.Post;
  end;
     cdsnew.next;

  end;
  Application.MessageBox(pchar('Automatic import favorite '+inttostr(cdsnew.RecordCount)+'records!'), appname, MB_OK +
        MB_ICONINFORMATION);
  form1.Cursor :=crdefault;
  finally
  form1.ClientDataSet1.EnableControls ;

  end;
form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.close;
 form1.ClientDataSet1.loadfromfile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.open;
// form1.TreeView1.Select(form1.TreeView1.Items[121]);
 Form2.Close ;
// ShowMessage(TreeView1.Select(TreeView1.Items[166]));
// TreeView1Change(self);
except
  Application.MessageBox('Automatic import failed, please retry!', appname, MB_OK +
    MB_ICONWARNING);
  end;
  finally
    cdsnew.Free;
    MyStream.free;
  end;
end
else begin
  Application.MessageBox('Import failed,don''t find the file, please retry!', appname, MB_OK +
    MB_ICONWARNING);
  Exit;
//end;
//
end;
end;

//procedure TForm1.Button13Click(Sender: TObject);
//var
// MyStream:TMemoryStream; clidataset:TClientDataSet;
// number:Integer ;
//begin
//  MyStream:=TMemoryStream.Create;
//  clidataset :=TClientDataSet.Create(Self);
////  try
//    if form1.DownloadFile(website+'updatedb.xml',form1.GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml')then
//      begin
//        form1.XMLDocument1.LoadFromFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'updatedb.xml');
//        if StrToInt(form1.XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text) > StrToInt(trim(Form2.labelededit2.Text)) then
//        begin
//            try
//              try
//                idhttp1.Get(website+'update.cds',MyStream);
//                MyStream.SaveToFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'update.cds');
//              except
//              end;
//              form1.ClientDataSet1.edit;
//              clidataset.LoadFromFile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'update.cds');
//              clidataset .Edit;
//              number:=clidataset.RecordCount ;
//
//              form1.ClientDataSet1.AppendData(clidataset.Data,False);
//              with form1.trayicon1 do
//                begin
//                  Visible:=true;
//                  BalloonTitle:=Appname+'新增加了'+inttostr(number)+'个电台';
//                  BalloonHint:='点击查看详细电台清单...';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                  form1.detail:=true;
//                end;
//              form2.LabeledEdit2.Text:=form1.XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text;
//              form1.ClientDataSet1.MergeChangeLog ;
//              form1.ClientDataSet1.ApplyUpdates(-1);
//              form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
//              form1.ClientDataSet1.Close;
//              form1.ClientDataSet1.LoadFromFile(GetHomePath + DataBaseFileName);
//              form1.ClientDataSet1.Open;
////              form1.Label14.caption:=' 已找到电台数:'+#32+inttostr(form1.clientdataset1.recordcount);
//              Form2.saveini;
//              form1.DBGrid1.SetFocus ;
//              finally
//                MyStream.Free;
//                clidataset.Free;
//            end;
//        end
//        else begin
//          with Form1.TrayIcon1 do
//                begin
//                  BalloonTitle :=appname;
//                  BalloonHint:='当前数据库版本为最新版本!';
//                  BalloonFlags:=bfInfo ;
//                  ShowBalloonHint ;
//                end;
//        end;
//
//  end;
//end;



procedure TForm1.N233Click(Sender: TObject);
begin
//Form2.Button13.Click;
end;

procedure TForm1.N236Click(Sender: TObject);
var  text:string;
begin
try
if selectdirectory('Select the directory which the AroPlay Lite folder saved.','/',text) then
begin
MkDir(text+'\AroPlay Lite');
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\AroPlay.exe'),PChar(text+'\AroPlay Lite\AroPlay.exe.exe'),False );
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\bass.dll'),PChar(text+'\AroPlay Lite\bass.dll'),False);
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\basswma.dll'),PChar(text+'\AroPlay Lite\basswma.dll'),False);
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\basshls.dll'),PChar(text+'\AroPlay Lite\basshls.dll'),False);
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\bass_aac.dll'),PChar(text+'\AroPlay Lite\bass_aac.dll'),False);
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\bassenc.dll'),PChar(text+'\AroPlay Lite\bassenc.dll'),False );
CopyFile(PChar(gethomepath+'\rd.cds'),PChar(text+'\AroPlay Lite\rde.cds'),False );
CopyFile(PChar(gethomepath+'\rd.dat'),PChar(text+'\AroPlay Lite\rde.dat'),False );
CopyFile(PChar(gethomepath+'\install.bat'),PChar(text+'\AroPlay Lite\install.bat'),False );
CopyFile(PChar(gethomepath+'\APlayer.dll'),PChar(text+'\AroPlay Lite\APlayer.dll'),False );
CopyFile(PChar(gethomepath+'\APlayerUI.dll'),PChar(text+'\AroPlay Lite\APlayerUI.dll'),False );
CopyFile(PChar(gethomepath+'\npaplayer.dll'),PChar(text+'\AroPlay Lite\npaplayer.dll'),False );
CopyFile(PChar(gethomepath+'\atl71.dll'),PChar(text+'\AroPlay Lite\atl71.dll'),False );
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\libeay32.dll'),PChar(text+'\AroPlay Lite\libeay32.dll'),False );
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\ssleay32.dll'),PChar(text+'\AroPlay Lite\ssleay32.dll'),False );
CopyFile(PChar(ExtractFilePath(Application.ExeName)+'\bassenc_mp3.dll'),PChar(text+'\AroPlay Lite\bassenc_mp3.dll'),False );
//end;
with form1.TrayIcon1 do
  begin
    BalloonTitle :=appname;
    BalloonHint:='Portable complete!';
    BalloonFlags:=bfInfo ;
    ShowBalloonHint ;
  end;
ShellExecute(handle,nil,PChar(Text),nil,nil,SW_NORMAL)
end;
except
Application.MessageBox('Portable failed, please retry!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);

end;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
//  WindowsMediaPlayer1.controls.stop ;
//  FlyFlv1.StopMovie ;

  if ClientDataSet1.RecNo>1 then
  begin
    BASS_ChannelStop(chan);
    ClientDataSet1.Prior ;
    DBGrid1CellClick(DBGrid1.Columns[1]);
    DBGrid1DblClick(Self);
//    toolbutton1.Click ;
//    Form8.Panel2.caption:=Form1.ClientDataSet1.FieldByName('电台名称').AsString ;
  end
  else
    Application.MessageBox('It''s the first station!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N24Click(Sender: TObject);
begin
//  WindowsMediaPlayer1.controls.stop ;
//  FlyFlv1.StopMovie ;
  BASS_ChannelStop(chan);
  if ClientDataSet1.RecNo < form1.ClientDataSet1.RecordCount  then
  begin
    ClientDataSet1.Next ;
    DBGrid1CellClick(DBGrid1.Columns[1]);
    DBGrid1DblClick(Self);
//    toolbutton1.Click ;
//    Form8.Panel2.caption:=Form1.ClientDataSet1.FieldByName('电台名称').AsString ;
  end
  else
    Application.MessageBox('It''s the last station!', appname, MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
end;


procedure TForm1.N264Click(Sender: TObject);
var cds1:Tclientdataset;
begin
MessageBeep(16);
case Application.MessageBox('Delete all the user stations?', PChar(appname), MB_OKCANCEL +
  MB_ICONQUESTION) of
  IDOK:
    begin
        try
          cds1:=Tclientdataset.Create(nil);
          ClientDataSet1.DisableControls;
          cds1.data:=clientdataset1.data;
        with cds1 do
          begin
            First;
              while not Eof do
                begin
                  if fieldbyname('电台类别').asstring='User' then
                    Delete
                  else
                    Next;
                  end;
                    MergeChangeLog;
                    ApplyUpdates(-1);
          end;
              ClientDataSet1.data:=cds1.data;
              ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
              ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
              ClientDataSet1.open;
        finally
              clientdataset1.EnableControls;
              cds1.Free ;
        end;
              TreeView1.Select(TreeView1.Items[0]);
//              ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
    end;
  IDCANCEL:
    begin

    end;
end;


//clientdataset1.filtered:=false;

end;

procedure TForm1.N272Click(Sender: TObject);
//var left1,top1:Integer;
begin
form1.Show;
WindowState := TWindowState(tag);
SetForegroundWindow(Handle);
form1.notebook2.pageindex:=2;
end;

procedure TForm1.N278Click(Sender: TObject);
begin
form2.button8.Click;
end;

procedure TForm1.N27Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[1].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N283Click(Sender: TObject);
begin
//if Form2.CheckBox2.Checked then
//  begin
//    if form2.ComboBox3.Text<>'' then
//      begin
//        try
//          if PopupMenu1.Items[7].Items[0].Tag=0 then
//            begin
//              ChangeProxy(Copy(Form2.ComboBox3.Text,1,Pos(':',form2.ComboBox3.Text)-1),copy(form2.ComboBox3.Text,pos(':',form2.ComboBox3.Text)+1,5),'1',True);
//              PopupMenu1.Items[7].Items[0].Caption :='关闭代理服务器连接';
//              PopupMenu1.Items[7].Items[0].Tag:=1;
//            end
//          else begin
//            ChangeProxy(Copy(Form2.ComboBox3.Text,1,Pos(':',form2.ComboBox3.Text)-1),copy(form2.ComboBox3.Text,pos(':',form2.ComboBox3.Text)+1,5),'1',False);
//            Form2.checkbox2.checked:=false;
//            PopupMenu1.Items[7].Items[0].Caption  :='开启代理服务器连接...';
//            PopupMenu1.Items[7].Items[0].Tag:=0;
//          end;
//        except
//          Application.MessageBox('连接出错,请检查代理服务器地址是否正确！', appname, MB_OK +
//          MB_ICONWARNING + MB_TOPMOST);
//        end;
//      end else
//    Application.MessageBox('连接出错,请检查代理服务器地址是否正确！', appname, MB_OK +
//      MB_ICONWARNING + MB_TOPMOST);
//  end
//  else begin
//    Application.MessageBox('请先进入''代理标签''开启代理服务器选项！', appname, MB_OK +
//      MB_ICONWARNING + MB_TOPMOST);
//    Form2.ShowModal ;
////      form2.PageControl1.TabIndex :=0;
//    form2.Notebook1.PageIndex :=2;
//  end;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
if PopupMenu1.Items[4].Items[1].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[1].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N2Click(Sender: TObject);
var
  id: Cardinal;
  wh,v: HWND;
  ph: THandle;
  ExitCode: DWORD;
begin
//  Savecombobox;
//  Form1.Caption:= Appname;
//  wh := FindWindow(nil,appname);
//if DirectoryExists(ExtractFilePath(Application.ExeName) +'codecs') then
//DeleteDirectory(ExtractFilePath(Application.ExeName) +'codecs');
//  if Form2.CheckBox28.Checked then
//  deletepg18;


//wh := FindWindow('TForm1',nil);

//               savecombobox;
                  Saveradio ;
                  savell;
                  savetree;
//               emptylist;
//               GetWindowThreadProcessId(wh, id);
//               ph := OpenProcess(PROCESS_TERMINATE, False, id);
//               getExitCodeProcess(ph, ExitCode);
//               TerminateProcess(ph, ExitCode);
//               Application.terminate;
   v:=FindWindow('TForm7',nil);
  if (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) or (v<>0)  then
  begin
    MessageBeep(16);
    case Application.MessageBox('It''s playing,quit it now?', PChar(appname),
      MB_OKCANCEL + MB_ICONINFORMATION) of
      IDOK:
        begin

          if Form2.checkbox10.checked then
            deletefile(GetHomePath+'\ARO\channel.dat');
            BASS_ChannelStop(chan);
//          else
          Application.terminate;
//          TerminateProcess(ph, ExitCode);
          end;
//          end;
      IDCANCEL:
        begin
//
        end;
    end;
    end
  else begin
          Application.terminate;
//          TerminateProcess(ph, ExitCode);
           end;
        end;


procedure TForm1.N301Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*30);
Timer5.Enabled:=true;
ToolButton6.Down:=True ;
ToolButton6.Hint:='System will be close after '+FormatDateTime('hh:mm:ss',now+(1/24/60)*30)+' ,click again for cancel.';
end;

procedure TForm1.N30Click(Sender: TObject);
begin
//randplay1('新闻');
Randplay
end;

procedure TForm1.N31Click(Sender: TObject);
begin
//shellExecute(handle,'open',PChar('https://www.abroadradio.net/bbs/?forum-3.htm'),nil,nil,SW_NORMAL);
end;

procedure TForm1.N32Click(Sender: TObject);
begin
if PopupMenu1.Items[4].Items[2].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[2].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N336Click(Sender: TObject);
var
//open:TOpenDialog ;
cdsnew: TClientDataSet ;data:array of string;  i:Integer;
MyStream:TMemoryStream;
begin
if form1.Edit1.Text<>'' then
begin
//  popupmenu4.items[10].items[2].enabled:=true;
  try
    cdsnew:=TClientDataSet.Create(nil);
    cdsnew.LoadFromFile(Edit1.Text);
    try
  SetLength(data,10000);

  try
    Form1.ClientDataSet1.DisableControls;
  cdsnew.First;
  i := 0;
  while not cdsnew.Eof do
  begin
    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
    cdsnew.Next;
    i := i + 1;
  end;

  for i := 0 to cdsnew.RecordCount - 1 do
  begin
    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
    begin
    Form1.ClientDataSet1.Edit;
    Form1.ClientDataSet1.Post;
    end
    else begin

    form1.ClientDataSet1.Insert ;
    cdsnew.Locate('电台名称',data[i],[]);
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:=cdsnew.FieldByName('收藏').AsString;;

    Form1.ClientDataSet1.Post;

  end;
     cdsnew.next;

  end;
  Application.MessageBox(pchar('Automatic import user stations '+inttostr(cdsnew.RecordCount)+'records!'), appname, MB_OK +
        MB_ICONINFORMATION);
  form1.Cursor :=crdefault;
  finally
  form1.ClientDataSet1.EnableControls ;

  end;
form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
 form1.ClientDataSet1.close;
 form1.ClientDataSet1.loadfromfile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.open;
 form1.TreeView1.Select(form1.TreeView1.Items[0]);
 Form2.Close ;
except
  Application.MessageBox('Automatic import failed, please retry!', appname, MB_OK +
    MB_ICONWARNING);
  end;
  finally
    cdsnew.Free;
    MyStream.free;
  end;
end
else begin
  Application.MessageBox('Import failed,don''t find the backup file.', appname, MB_OK +
    MB_ICONWARNING);
  Exit;
//end;
//
end;
end;

procedure TForm1.N337Click(Sender: TObject);
var
  cdsNew : TClientDataset ;
  i : integer;
  fieldName : string ;
  save:TSaveDialog ;
begin
  Form1.N69.Click;
  try
   cdsNew := TClientDataset.Create(application);
   save:=TSaveDialog.Create(nil);
   save.Filter :='AroPlay files|*.cds';
   try
     Form1.ClientDataSet1.DisableControls ;
     cdsNew.FieldDefs.Assign(Form1.ClientDataSet1.FieldDefs);
     cdsNew.CreateDataset;
     Form1.ClientDataSet1.First;
  while not Form1.ClientDataSet1.eof do
  begin
    if Form1.ClientDataSet1.FieldByName('电台类别').AsString = 'User' then
    begin
      cdsNew.Append;
      for i := 0 to (cdsNew.FieldCount-1) do
      begin
        fieldName := cdsNew.Fields[i].FieldName ;
        cdsNew.FieldByName(fieldName).Value := form1.ClientDataSet1.FieldByName(fieldName).Value;
      end;
      cdsNew.Post;
    end;
//    end;
    Form1.ClientDataSet1.next;
  end;
  finally
    form1.ClientDataSet1.EnableControls ;
  end;


  if save.Execute  then
  begin
    save.DefaultExt:='cds';
    save.filename:=ChangeFileExt(Save.FileName,'.cds');
    cdsNew.SaveToFile(save.FileName);
     Application.MessageBox(pchar('There''re '+inttostr(cdsnew.RecordCount)+' records backup!'), Appname, MB_OK + MB_ICONQUESTION);
    edit1.Text := save.FileName;
  end;
  finally
    cdsNew.Free;
    save.Free ;
  end;

end;

procedure TForm1.N338Click(Sender: TObject);
var open:TOpenDialog ;  cdsnew: TClientDataSet ;data:array of string;  i:Integer;
MyStream:TMemoryStream;
begin
  try
    open:=TOpenDialog.Create(nil);
    open.Filter :='AroPlay files|*.cds';
    cdsnew:=TClientDataSet.Create(nil);
    if open.Execute  then
      cdsnew.LoadFromFile(open.FileName);
try
  SetLength(data,10000);

  try
    Form1.ClientDataSet1.DisableControls;
  cdsnew.First;
  i := 0;
  while not cdsnew.Eof do
  begin
    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
    cdsnew.Next;
    i := i + 1;
  end;

  for i := 0 to cdsnew.RecordCount - 1 do
  begin
    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
    begin
    Form1.ClientDataSet1.Edit;
    Form1.ClientDataSet1.Post;
    end
    else begin

    form1.ClientDataSet1.Insert ;
    cdsnew.Locate('电台名称',data[i],[]);
    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
    Form1.ClientDataSet1.FieldByName('收藏').AsString:=cdsnew.FieldByName('收藏').AsString;
    Form1.ClientDataSet1.FieldByName('视频类型').AsString:=cdsnew.FieldByName('视频类型').AsString;

    Form1.ClientDataSet1.Post;

  end;
     cdsnew.next;

  end;
  Application.MessageBox(pchar('Import user stations '+inttostr(cdsnew.RecordCount)+' records!'), appname, MB_OK +
        MB_ICONINFORMATION);
  form1.Cursor :=crdefault;
  finally
  form1.ClientDataSet1.EnableControls ;

  end;
form1.ClientDataSet1.MergeChangeLog ;
 form1.ClientDataSet1.ApplyUpdates(-1);
 form1.ClientDataSet1.SaveToFile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.close;

 form1.ClientDataSet1.loadfromfile(GetHomePath+ DataBaseFileName);
 form1.ClientDataSet1.open;
 TreeView1.Select(TreeView1.Items[0]);
// TreeView1Change(nil);
//  if FileExists(form1.GetShellFolders('Personal')+'\ARO'+'\'+'sex.cds') then
//  Deletefile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'sex.cds') ;

except
  Application.MessageBox('Import failed, please retry!', appname, MB_OK +
    MB_ICONWARNING);
end;
finally
  cdsnew.Free;
  MyStream.free;
  open.Free;
end;
 form2.Close;
//end;
end;


//else
//  Application.MessageBox('导入失败，发生未知错误，或请稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;



procedure TForm1.N33Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  with form2 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;


procedure TForm1.N34Click(Sender: TObject);
var left1,top1:Integer;
begin
if (clientdataset1.RecordCount<>0) then
begin
if (radiokind='Common')  or (AnsiEndsText('m3u8',ClientDataSet1.FieldByName('电台网址').asstring))
then
begin
Left1:=self.Left + 300;
  Top1:= self.Top+100;
  form10:=TForm10.Create(self);
  with form10 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Showmodal ;
    end;
end
else
  Application.MessageBox('This TV station doesn''t support QRcode!', appname, MB_OK + MB_ICONSTOP +
    MB_TOPMOST);
end
else
  Application.MessageBox('Please select the station at first!', appname, MB_OK + MB_ICONSTOP +
    MB_TOPMOST);
end;

procedure TForm1.N35Click(Sender: TObject);
begin
RecordRadio ;
end;

procedure TForm1.N39Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[4].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N3Click(Sender: TObject);
var cleft,ctop:Integer;
begin
  CLeft:=self.Left + 150;
  CTop:= self.Top+Toolbar2.Height+160;
  form6:=TForm6.Create(self);
  with form6 do
    begin
      left:=CLeft;
      Top:=CTop;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
  MessageBeep(16);
  case Application.MessageBox('Delete this station?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        with form1.ClientDataSet1 do
        begin
          Delete;
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath+ DataBaseFileName);
          Close ;
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open ;
          form1.TreeView1.Select(form1.TreeView1.Items[0]);
        end;
      end;
    IDCANCEL:
      begin

      end;
  end;
end;


procedure TForm1.N41Click(Sender: TObject);
begin
  ShowUser ;
end;

procedure TForm1.N42Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[3].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[3].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N44Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[5].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N45Click(Sender: TObject);
begin
  shellexecute(Handle,nil,PChar('mailto:zhouying2003@hotmail.com?subject='+clientdataset1.FieldByName('电台名称').AsString+#32+'- does not work' )
                  ,nil,nil,SW_SHOWNORMAL);
end;

procedure TForm1.N46Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[7].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N47Click(Sender: TObject);
begin

end;

//end;

procedure TForm1.N481Click(Sender: TObject);
begin
//shellExecute(handle,'open',PChar('https://abroadradio.net/48.html'),nil,nil,SW_NORMAL);

end;

procedure TForm1.N48Click(Sender: TObject);
begin
//form2.PageControl1.TabIndex :=3;
form2.Notebook1.PageIndex :=7;
 Form2.ShowModal ;
end;

procedure TForm1.N49Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[2].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N4Click(Sender: TObject);
//var
// MyStream:TMemoryStream;
// cdsnew:TClientDataSet;
//var left1,top1:Integer;
begin
//if not FileExists('AbroadRadio.chm') then
//begin
//  try
//   cdsnew := Tclientdataset.Create(nil);
//   MyStream := TMemoryStream.Create;
//   IdHTTP1.Get(website + '\AbroadRadio.chm',MyStream);
//   MyStream.SaveToFile(GetHomePath + '\AbroadRadio.chm');
//   case Application.MessageBox('AbroadRadio 用户手册已下载完毕，是否需要马上运行?', appname,
//     MB_OKCANCEL + MB_ICONQUESTION + MB_TOPMOST) of
//     IDOK:
//       begin
//         shellExecute(handle,'open',PChar(GetHomePath+ '\AbroadRadio.chm'),nil,nil,SW_NORMAL);
//
//       end;
//     IDCANCEL:
//       begin
//
//       end;
//   end;
//   finally
//    Cdsnew.Free;
//    MyStream.Free;
//  end;
//end
//else
//  shellExecute(handle,'open',PChar(GetHomePath + '\AbroadRadio.chm'),nil,nil,SW_NORMAL);
//
//
//
//

//  Left1:=self.Left + 80;
//  Top1:= self.Top+40;
//  form9:=TForm9.create(self);
//  with form9 do
//    begin
//      left:=Left1;
//      Top:=Top1;
//      FormStyle:=fsStayOnTop;
//      ShowModal ;
//    end;
end;

procedure TForm1.N50Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[3].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;




procedure TForm1.N51Click(Sender: TObject);
begin
case Application.MessageBox('Delete this plan ?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        with form1.ClientDataSet1 do
        begin
          Edit;
          FieldByName('计划类型').asstring:='';
          Filtered :=true;
          MergeChangeLog ;
          ApplyUpdates(-1);
          end;
          Form1.ClientDataSet2.Data :=Form1.ClientDataSet1.Data ;
//          form1.TotalRecord ;
          with form1.ClientDataSet1 do
          begin
            MergeChangeLog   ;
            ApplyUpdates(-1);
            SaveToFile(GetHomePath + DataBaseFileName);
            Close ;
            LoadFromFile(GetHomePath + DataBaseFileName);
            Open ;
          end;
          Form1.TotalRecord ;
        TDateField(Form1.DBGrid2.Columns.items[2].Field).DisplayFormat:='hh:mm:ss';
        TDateField(form1.DBGrid2.Columns.items[3].Field).DisplayFormat:='hh:mm:ss';
        if form1.ClientDataSet1.RecordCount <>0 then
          Form1.N46Click(Self);
//          Close ;
      end;
    IDCANCEL:
      begin

      end;

end;

end;

procedure TForm1.N52Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[4].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[4].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N53Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[6].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N55Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[0].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N56Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[1].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N57Click(Sender: TObject);
begin
//if clientdataset1.FieldByName('视频类型').AsString<>'电视台' then
//if (clientdataset1.FieldByName('电台国家').AsString<>'中国' ) then
// ShellExecute(0, nil, PChar(ClientDataSet1.FieldByName('电台网址').asstring), nil, nil, 1);
if (clientdataset1.FieldByName('微博').AsString<>'') then
  ShellExecute(0, nil, PChar(ClientDataSet1.FieldByName('微博').asstring), nil, nil, 1)
else
  Application.MessageBox('There is no website.', Appname, MB_OK + MB_ICONSTOP);




end;
procedure TForm1.N58Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[3].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

//else
//  ShellExecute(0, nil, PChar(ClientDataSet1.FieldByName('微博').asstring), nil, nil, 1);
//end;


procedure TForm1.N5Click(Sender: TObject);
var
  node: TTreeNode;
begin
//  if not Boolean(TreeView1.Items) then Exit; {如果 TreeView1 无内容}
//  if TreeView1.SelectionCount = 0 then Exit; {如果无选择}
  node := TreeView1.Selected;
  MessageBeep(16);
  case Application.MessageBox('Delete this group?', appname, MB_OKCANCEL +
    MB_ICONQUESTION) of
    IDOK:
      begin
      if node.Text<>'Root' then
      begin
        if (node<>nil) and (node.Parent<>nil) and (node.Parent.Text=TreeView1.Items[0].Text) and (node.AbsoluteIndex<>0)  then
          node.Delete;
          savetree ;
      end
      else
        Application.MessageBox('Root doesn''t allow be delete!', Appname, MB_OK + MB_ICONSTOP);

      end;
    IDCANCEL:
      begin

      end;
  end;


end;

procedure TForm1.N601Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*60);
Timer5.Enabled:=true;
ToolButton6.Down:=True ;
ToolButton6.Hint:='System will be shutdown after '+FormatDateTime('hh:mm:ss',now+(1/24/60)*60)+',click again for cancel.';
end;

procedure TForm1.N60Click(Sender: TObject);
begin
PopupMenu4.Items[2].items[7].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;


procedure TForm1.N61Click(Sender: TObject);
begin
form2.ComboBox12.ItemIndex:=form2.ComboBox12.Items.IndexOf(rkind);
form2.ComboBox12.OnChange(Self);
form2.saveini;
form2.loadini;
end;

procedure TForm1.N62Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[5].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[5].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N63Click(Sender: TObject);
begin
emptysc ;



end;

procedure TForm1.N64Click(Sender: TObject);
begin
  showschool;
end;

procedure TForm1.N66Click(Sender: TObject);
var left1,top1:Integer;
begin
if DownloadFile('http://www.aroplay.com/update.xml',GetHomePath+'\ARO\update.xml')then
      begin
        XMLDocument1.LoadFromFile(GetHomePath+'\ARO\update.xml');
        if StrToInt(XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text) > StrToInt(GetBuildInfo) then
          begin
            Left1:=self.Left + 180;
            Top1:= self.Top+140;
            Form4:=TForm4.Create(Self);
              with form4 do
                begin
                  left:=Left1;
                  Top:=Top1;
                  FormStyle:=fsStayOnTop;
                  ShowModal ;
                end;
          end
          else begin
              with TrayIcon1 do
                begin
                  BalloonTitle :=appname;
                  BalloonHint:='It''s the latest version!';
                  BalloonFlags:=bfInfo ;
                  ShowBalloonHint ;
                end;
//               DeleteFile(GetShellFolders('Personal')+'\ARO'+'\' + 'update.xml');
          end;
     DeleteFile((GetHomePath+'\ARO\update.xml'));
//  checkupdate ;
end;
end;

procedure TForm1.N67Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[6].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N69Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[5].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin

//if ClientDataSet1.fieldbyname('电台类型').asstring='m3u8' then
//Application.MessageBox('定时功能暂时还不支持 m3u8 格式的电台。', appname, MB_OK +
//            MB_ICONINFORMATION + MB_TOPMOST)
//else

  ShowSchool ;

//  ToolButton5.Click ;
//  popupmenu4.items[0].click;
end;


procedure TForm1.N70Click(Sender: TObject);
var j:byte;
begin
          for j := 0 to treeview1.items.count do

            begin

            if treeview1.items[j].text = popupmenu6.items[8].caption then
            begin
              treeview1.items[j].selected := true;
              treeView1.items[j].Expanded := true;
              break;
            end;
            end;
end;

procedure TForm1.N72Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[6].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[6].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;

procedure TForm1.N73Click(Sender: TObject);
begin
ShowUser ;
end;

procedure TForm1.N7Click(Sender: TObject);
var s:Integer;re:Boolean ;
begin
ToolButton4.click;
//  ClientDataSet1.Edit;
//  re:=True ;
//  if not ClientDataSet1.Eof  then
//  begin
//  s:=1;
//  if ClientDataSet1.FieldByName('收藏').AsString='' then
//      begin
//        ClientDataSet1.FieldByName('收藏').AsString:='★';
//        s:=ClientDataSet1.RecNo ;
//
//        PopupMenu4.Items[8].Caption :='Remove from the favorites';
//        toolbutton4.imageindex:=5;
//        ToolButton4.hint:='Remove from the favorites';
//      end
//    else begin
//      if ClientDataSet1.FieldByName('收藏').AsString='★' then
//      begin
//        ClientDataSet1.FieldByName('收藏').AsString:='';
//
//        ToolButton4.imageindex:=4;
//        ToolButton4.hint:='Add to my favorite';
//        PopupMenu4.Items[8].Caption :='Add to my favorite';
//        re:=False ;
//
//      end;
//    end;
//    ClientDataSet1.MergeChangeLog ;
//    ClientDataSet1.ApplyUpdates(-1);
//    ClientDataSet1.SaveToFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//    ClientDataSet1.Close  ;
//    ClientDataSet1.LoadFromFile(ExtractFilePath(Application.ExeName) + DataBaseFileName);
//    ClientDataSet1.open;
//    if re then
//
//    clientdataset1.recno:=s;
//  end;

end;


procedure TForm1.N801Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*75);
Timer5.Enabled:=true;
ToolButton6.Down:=True ;
ToolButton6.Hint:='System will shutdown after '+FormatDateTime('hh:mm:ss',now+(1/24/60)*75)+',Click again for cancel.';
end;

procedure TForm1.N82Click(Sender: TObject);
begin
  if PopupMenu1.Items[4].Items[7].Caption<>'' then
      PlayMusic(PopupMenu1.Items[4].Items[7].Caption)
  else
      Application.MessageBox('Please setting the station!', appname, MB_OK +
            MB_ICONINFORMATION + MB_TOPMOST);
end;



procedure TForm1.N84Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  form8:=TForm8.Create(self);
  with form8 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;

procedure TForm1.N88Click(Sender: TObject);
begin

end;
//Randplay1(form2.combobox11.text);


procedure TForm1.N8Click(Sender: TObject);
begin
  PopupMenu4.Items[2].items[2].Caption :=ClientDataSet1.FieldByName('电台名称').asstring;
  play:=False;
end;

procedure TForm1.N901Click(Sender: TObject);
begin
form1.close:=FormatDateTime('hhmmss',now+(1/24/60)*90);
Timer5.Enabled:=true;
ToolButton6.Down:=True ;
ToolButton6.Hint:='System will shutdown after '+FormatDateTime('hh:mm:ss',now+(1/24/60)*90)+',Click again for cancel.';
end;

procedure TForm1.N91Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  with form2 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Notebook1.pageindex:=2;
      ShowModal ;
    end;
    form2.TreeView1.Select(TreeView1.Items[0]);
end;

procedure TForm1.N92Click(Sender: TObject);
begin
case Application.MessageBox('Do you want to change the station to user genre?', appname, MB_OKCANCEL +
    MB_ICONQUESTION + MB_TOPMOST) of
    IDOK:
      begin
        if not form1.ClientDataSet1.Eof  then
    begin
      with Form1.ClientDataSet1 do
      begin
        Edit;
        fieldbyname('电台类别').asstring:='User';
        MergeChangeLog ;
        ApplyUpdates(-1);
        SaveToFile(GetHomePath + DataBaseFileName);
        close;
        Open ;
     end;
    end;
      end;
    IDCANCEL:
      begin

      end;
  end;

end;

procedure TForm1.NewForest(Sender: TObject);
begin
end;


procedure TForm1.Notebook2PageChanged(Sender: TObject);
var avkind,stationname,stationkind,stationadd,stationforcast:string;
begin
if Notebook2.pageindex=4  then
begin
  form2.loadini;
  stationadd :=Form1.videoadd ;
  stationkind :=form1.videokind;
  stationname:= form1.videonname ;
  stationforcast:=form1.videoforcast;
  avkind:=form1.radiokind ;
  Form1.title2:=stationname;

  form1.Caption :='AroPlay TV - '+FORM1.tvname;
   form1.PopupMenu1.Items[5].visible:=False ;
//   form1.PopupMenu1.Items[7].visible:=False ;
   form1.PopupMenu1.Items[4].visible:=False ;
//   form1.PopupMenu1.Items[11].visible:=False ;
//   form1.PopupMenu1.Items[12].visible:=False ;
//   form1.PopupMenu1.Items[13].visible:=False ;
   if form1.CheckOffline  then
   begin
      if stationkind='电视台' then
        begin
//          Notebook1.PageIndex :=1;
          WebBrowser4.Offline:=true;
          WebBrowser4.Navigate(stationadd);
          form1.PopupMenu1.Items[6].enabled :=False ;
        end;

      if avkind='rtmp | m3u8' then
        begin
          WebBrowser4.Offline:=true;
          if Form2.CheckBox23.Checked then
          WebBrowser4.Navigate(Trim(xunlei+stationadd))
          else
          WebBrowser4.Navigate(Trim(url+stationadd));
          form1.PopupMenu1.Items[6].enabled :=False ;
        end;
   end
   else
   Application.MessageBox('Play failed, please check the network.', PChar(appname), MB_OK + MB_ICONWARNING);
  if Form1.tv  then
   form1.Timer4.Enabled :=true
  else
    Form1.Timer4.Enabled :=False ;

end
else
form1.Caption:=appname;
end;

procedure TForm1.Notebook3PageChanged(Sender: TObject);
begin
//Label3.Left:=(Panel8.Width - Label3.Width) div 2;
//Label11.Left:=(Panel8.Width - Label11.Width) div 2;

end;

procedure TForm1.OpenVolumn;
begin
case Form2.radiogroup1.itemindex of
  0:begin
    if not IsVista then
    begin
    if GetvolumeMute(Master) then
      begin
        SetvolumeMute(master,False);
        Setvolume(Master,15830);
      end
    end
      else
        VistaMute(0.2);
  end;

1:begin
    if not IsVista then
    begin
    if GetvolumeMute(Master) then
      begin
        SetvolumeMute(master,False);
        Setvolume(Master,31668);
      end
    end
      else
        VistaMute(0.5);
  end;

2:begin
    if not IsVista then
    begin
    if GetvolumeMute(Master) then
      begin
        SetvolumeMute(master,False);
        Setvolume(Master,65535);
      end
    end
      else
        VistaMute(1);
  end;
end;

end;



procedure TForm1.OverWater;
begin

// Application.MessageBox(pchar('当前的流量已接近或者超过您所设定的'+#32+form2.labelededit3.text+'M,请按“确定”重新进行设置。'), appname,
//  MB_OK + MB_ICONQUESTION);
//      form2.PageControl1.TabIndex :=0;
//      form2.Notebook1.PageIndex :=2;
//      Form2.labelededit3.text:='';
//      form2.checkbox11.checked:=false;
//      Form2.ShowModal ;

end;

procedure TForm1.Panel27Click(Sender: TObject);
begin
Randplay1('Classical');
end;

procedure TForm1.Panel28Click(Sender: TObject);
begin
Randplay1('Country');
end;

procedure TForm1.Panel29Click(Sender: TObject);
begin
Randplay1('Electronica');
end;

procedure TForm1.Panel30Click(Sender: TObject);
begin
Randplay1('Rock');
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
//  TrackBar1.SetFocus ;
end;

procedure TForm1.PG181Click(Sender: TObject);
var data:array of string;  i:Integer; cdsnew:Tclientdataset;
MyStream:TMemoryStream; dr:string;
begin
//if Form2.checkbox17.checked then
  deletepg18 ;
  if Form1.CheckOffline then
  begin
  try
  form1.TreeView1.Select(form1.TreeView1.Items[0]);
  form1.Cursor :=crhourglass;
//  SendMessage(handle,WM_CLOSE,0,0);
  Application.Minimize;
  with form1.TrayIcon1 do
    begin
      BalloonTitle :=appname;
      BalloonHint:='正在更新PG18+电视台...';
      BalloonFlags:=bfInfo ;
      ShowBalloonHint ;
    end;
  try
      Form1.ClientDataSet1.DisableControls;
      cdsnew:=TClientDataSet.Create(nil);
//      mystream:=TMemoryStream.Create;
//      DeleteUrlCacheEntry(PWideChar(website+'download/cn/pg18.cds'));
//       if form1.DownloadFile(website+'download/cn/pg18.cds',gethomepath+'\ARO\pg18.cds') then
        idftp1.Connect;
        idftp1.ChangeDir('wwwroot/download/cn');
        dr:=GetHomePath+'\ARO\pg18.cds';
        idftp1.Get('pg18.cds', PChar(dr), True);
//                              LabeledEdit1.Text :=form1.GetShellFolders('Personal')+'\ARO\rd.cds';
//      idhttp1.Get(website+'download/cn/pg18.cds',MyStream);
//      MyStream.SaveToFile(Form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds');
      Form1.ClientDataSet1.Edit ;
      cdsnew.LoadFromFile(gethomepath+'\ARO\pg18.cds');
      cdsnew.Edit;
      ClientDataSet1.AppendData(cdsnew.Data,False);
      form1.ClientDataSet1.EnableControls ;
      form1.ClientDataSet1.MergeChangeLog ;
      form1.ClientDataSet1.ApplyUpdates(-1);
      form1.ClientDataSet1.SaveToFile(GetHomePath+ DataBaseFileName);
      form1.ClientDataSet1.close;
      form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
      form1.ClientDataSet1.open;
      with form1.TrayIcon1 do
        begin
          BalloonTitle :=appname;
          BalloonHint:='PG18+电视台更新完成!';
          BalloonFlags:=bfInfo ;
          ShowBalloonHint ;
        end;
      IdFTP1.Disconnect;

//    if DownloadFile(website+'/download/cn/pg18.txt',GetHomePath+'\ARO\pg18.txt') then
      ShellExecute(0, nil, PChar('https://www.abroadradio.net/screen.html'), nil, nil, 1);
//    ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);

  except
    Application.MessageBox('下载失败，请检查是否联网或稍后再试！', appname, MB_OK +
      MB_ICONWARNING);
  end;
  finally
    ClientDataSet1.EnableControls;
    cdsnew.Free;
//    MyStream.free;
  end;
  DeleteFile(GetHomePath +'\ARO\pg18.cds');
  Application.Restore;
  end
  else
    Application.MessageBox('下载失败，请检查是否联网!', appname, MB_OK +
      MB_ICONWARNING);
  end;

procedure TForm1.PG182Click(Sender: TObject);
begin
Form1.Updatepg18;
end;
procedure TForm1.PG183Click(Sender: TObject);
begin
//  form2.BitBtn1.click;
end;

//end;

procedure TForm1.PlayMusic(const Filename: string);
begin
  Notebook1.PageIndex :=0;
  TreeView1.Select(TreeView1.Items[0]);
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
  ClientDataSet1.Locate('电台名称',filename ,[]);
  DBGrid1CellClick(DBGrid1.Columns[1]);
  DBGrid1DblClick(self);
  Timer2.Enabled :=true;
  Timer7.Enabled :=True   ;
//  TrayIcon1.IconIndex:=7;
//  toolbutton1.tag:=0;
//  toolbutton1.Click ;

end;

//procedure TForm1.PlayRadio;
//begin
//
//end;

procedure TForm1.PopupMenu10Change(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
//if toolbutton1.Tag =1 then
//PopupMenu10.autopopup:=True
//else
//PopupMenu10.autopopup:=false;
end;

procedure TForm1.PopupMenu12Popup(Sender: TObject);
begin
PopupMenu12.Items[0].Caption:=youlikename;
PopupMenu12.Items[1].Caption:=youlikecoutry;
end;


procedure TForm1.PopupMenu13Popup(Sender: TObject);
begin
GuessYoulike(youlikename,youlikecoutry) ;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var i:Integer;
begin
  PopupMenu4.OnPopup(Self);
  PopupMenu1.Items[4].Items[0].caption:=PopupMenu4.Items[2].Items[0].Caption ;
  PopupMenu1.Items[4].Items[1].caption:=PopupMenu4.Items[2].Items[1].Caption ;
  PopupMenu1.Items[4].Items[2].caption:=PopupMenu4.Items[2].Items[2].Caption ;
  PopupMenu1.Items[4].Items[3].caption:=PopupMenu4.Items[2].Items[3].Caption ;
  PopupMenu1.Items[4].Items[4].caption:=PopupMenu4.Items[2].Items[4].Caption ;
  PopupMenu1.Items[4].Items[5].caption:=PopupMenu4.Items[2].Items[5].Caption ;
  PopupMenu1.Items[4].Items[6].caption:=PopupMenu4.Items[2].Items[6].Caption ;
  PopupMenu1.Items[4].Items[7].caption:=PopupMenu4.Items[2].Items[7].Caption ;

  PopupMenu1.Items[9].Caption:='Prior station   '+ ShortCutToText(form2.HotKey6.HotKey);
  PopupMenu1.Items[10].Caption:='Next station   '+ ShortCutToText(form2.HotKey7.HotKey);



end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
//var node:TTreeNode ;
begin
//  node:=TreeView1.Selected ;
//  if regeditaro and (node.text='PG18+')  then
//  begin
////    if form2.combobox7.itemindex=0 then
////    begin
//      popupmenu2.items[0].visible:=False ;
//      popupmenu2.items[1].visible:=False ;
//      popupmenu2.items[2].visible:=True ;
////      popupmenu2.items[3].visible:=False  ;
////    end;
//  end
//  else begin
//    popupmenu2.items[0].visible:=True;
//    popupmenu2.items[1].visible:=True ;
//    popupmenu2.items[2].visible:=False ;
////    popupmenu2.items[3].visible:=True ;
//  end;

end;

procedure TForm1.PopupMenu3Popup(Sender: TObject);
begin

//  if youlikename='' then
//    popupmenu3.items[6].enabled:=False
//  else begin
//    popupmenu3.items[6].enabled:=True;
//    popupmenu3.items[6].items[0].caption:='在 - '+youlikecoutry+' - 中查找';
//    popupmenu3.items[6].items[1].caption:='在 - '+youlikename+' - 流派中查找';
//  end;
//
//  if clientdataset1.fieldbyname('自定义2').asstring<>'' then
//    popupmenu3.items[4].enabled:=True
//  else
//    popupmenu3.items[4].enabled:=False ;
end;

procedure TForm1.PopupMenu4Popup(Sender: TObject);
begin
  if play then
  Loadradio ;


//  if clientdataset1.recordcount=0 then
//    PopupMenu4.autopopup:=False;

//    if regeditaro then
//  begin
//     if (form1.ClientDataSet1.FieldByName('视频类型').asstring='电视台') then
//      PopupMenu4.Items[3].Enabled  :=True
//     else
//      PopupMenu4.Items[3].enabled :=false;
//  end
//  else
  PopupMenu4.Items[13].caption:='Locate ['+rkind+'] genre for the next time';

  if regeditaro then
  begin
     if (form1.ClientDataSet1.FieldByName('电台类型').asstring='Common') or (form1.ClientDataSet1.FieldByName('电台网址').asstring='<>') then
      PopupMenu4.Items[14].Enabled :=True
     else
      PopupMenu4.Items[14].Enabled:=false;
  end
  else
  PopupMenu4.Items[14].Enabled :=false;


  if ClientDataSet1.FieldByName('收藏').asstring <>'' then
  begin
    PopupMenu4.Items[8].caption :='Remove from the favorites';
    PopupMenu4.Items[8].imageindex :=42;
  end
  else begin
    PopupMenu4.Items[8].caption :='Add to my favorite';
    PopupMenu4.Items[8].imageindex :=41;
  end;

  if ClientDataSet1.FieldByName('电台类别').asstring<>'User' then
  begin
    PopupMenu4.Items[13].Enabled:=true;
//    PopupMenu4.Items[18].Enabled:=true
  end
  else begin
    PopupMenu4.Items[13].Enabled:=false;
//    PopupMenu4.Items[18].Enabled:=false;
  end;

//  if ClientDataSet1.FieldByName('电台分组').asstring<>'' then
//    PopupMenu4.Items[12].Enabled:=true
//  else
//    PopupMenu4.Items[12].Enabled:=false;

  if ClientDataSet1.FieldByName('电台类型').asstring='Web' then
  begin
    PopupMenu4.Items[6].Enabled:=false;
    PopupMenu1.Items[6].Enabled:=False;
  end
  else begin
    PopupMenu4.Items[6].Enabled :=true;
    PopupMenu1.Items[6].Enabled:=true;
  end;

  if toolbutton1.tag=0 then
     PopupMenu4.Items[5].caption :='Play'
  else
     PopupMenu4.Items[5].caption :='Stop';

   if  ClientDataSet1.fieldbyname('电台类别').AsString='User' then
      begin
          PopupMenu4.Items[1].Caption :='Edit user station...';
          PopupMenu4.Items[1].Tag:=1;
          PopupMenu4.Items[1].ImageIndex :=15;
      end
      else begin
          PopupMenu4.Items[1].Caption :='Add user station...';
          PopupMenu4.Items[1].Tag:=0;
          PopupMenu4.Items[1].ImageIndex :=14;
      end;

end;


procedure TForm1.PopupMenu8Popup(Sender: TObject);
begin
//  if (ClientDataSet1.FieldByName('电台类型').asstring<>'网页电台') and
//    (ClientDataSet1.FieldByName('视频类型').asstring<>'') and (toolbutton1.tag<>1) then
//    begin
//      popupmenu8.ITems[0].enabled:=True;
//      PopupMenu8.Items[0].Caption :='收听电视台';
//    end
//  else  begin
//         popupmenu8.ITems[0].enabled:=false;
//         PopupMenu8.Items[0].Caption :='当前不是电视台,或当前电视台不支持收听 ';
//
//        end;

end;

procedure TForm1.QQ1Click(Sender: TObject);
begin
//  try
//    ShellExecute(handle,'open',PChar('https://wpa.qq.com/msgrd?V=1&Uin=909332700&Exe=QQ&Site=MSN&Menu=No'),nil,
//               nil,SW_SHOWNORMAL);
//  except
//    Application.MessageBox('请检测是否安装了QQ客户端！', appname, MB_OK +
//      MB_ICONWARNING + MB_TOPMOST);
//  end;
end;

procedure TForm1.QQ2Click(Sender: TObject);
begin
//try
//  ShellExecute(handle,'open',PChar('https://shang.qq.com/wpa/qunwpa?idkey=8237fe6153c2e40d15ee546dfe13080e5b9c24ac3b9116971a503ed55ccb92dd'),nil,
//               nil,SW_SHOWNORMAL);
//except
//    Application.MessageBox('请检测是否安装了QQ客户端！', appname, MB_OK +
//      MB_ICONWARNING + MB_TOPMOST);
//end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  ClientDataSet1.Filter := '收藏 = ' + QuotedStr('★');
  ClientDataSet1.Filtered := True;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
//  ComboBox1.SetFocus ;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
//  ComboBox1.SetFocus ;
end;

procedure TForm1.Updatepg18;
//    var data:array of string;  i:Integer; cdsnew:Tclientdataset;
//MyStream:TMemoryStream;
begin
//if Form1.checkoffline then
//begin
//form1.TreeView1.Select(form1.TreeView1.Items[0]);
//form1.Cursor :=crhourglass;
//
//try
//    cdsnew:=TClientDataSet.Create(nil);
//    mystream:=TMemoryStream.Create;
//    DeleteUrlCacheEntry(PWideChar(website+'download/cn/pg18.cds'));
////    if Form2.checkbox17.checked then
//    deletepg18;
//    idhttp1.Get(website+'download/cn/pg18.cds',MyStream);
//    MyStream.SaveToFile(gethomepath+'\ARO\pg18.cds');
//    Form1.ClientDataSet1.Edit ;
//    cdsnew.LoadFromFile(gethomepath+'\ARO\pg18.cds');
//
//  try
//  SetLength(data,10000);
//
//  try
//    Form1.ClientDataSet1.DisableControls;
//  cdsnew.First;
//  i := 0;
//  while not cdsnew.Eof do
//  begin
//    data[i]:=cdsnew.FieldByName('电台名称').AsString ;
//    cdsnew.Next;
//    i := i + 1;
//  end;
//
//  for i := 0 to cdsnew.RecordCount - 1 do
//  begin
//    if Form1.ClientDataSet1.Locate('电台名称', data[i], []) then
//    begin
////    ShowMessage('ok');
////    Form1.ClientDataSet1.Delete ;
//
//    form1.ClientDataSet1.Edit;
//    cdsnew.Locate('电台名称',data[i],[]);
//    Form1.ClientDataSet1.FieldByName('电台名称').AsString:=cdsnew.FieldByName('电台名称').AsString;
//    Form1.ClientDataSet1.FieldByName('电台国家').AsString:=cdsnew.FieldByName('电台国家').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类别').AsString:=cdsnew.FieldByName('电台类别').AsString;
//    Form1.ClientDataSet1.FieldByName('编码率').AsString:=cdsnew.FieldByName('编码率').AsString;
//    Form1.ClientDataSet1.FieldByName('语言类型').AsString:=cdsnew.FieldByName('语言类型').AsString;
//    Form1.ClientDataSet1.FieldByName('电台地址').AsString:=cdsnew.FieldByName('电台地址').AsString;
//    Form1.ClientDataSet1.FieldByName('微博').AsString:=cdsnew.FieldByName('微博').AsString;
//    Form1.ClientDataSet1.FieldByName('电台网址').AsString:=cdsnew.FieldByName('电台网址').AsString;
//    Form1.ClientDataSet1.FieldByName('电台类型').AsString:=cdsnew.FieldByName('电台类型').AsString;
//    Form1.ClientDataSet1.FieldByName('收藏').AsString:='★';
//
//    Form1.ClientDataSet1.Post;
//
//  end;
//     cdsnew.next;
//
//  end;
//  Application.MessageBox(pchar('PG18+电视台更新成功！'), Appname, MB_OK + MB_ICONQUESTION);
//  form1.Cursor :=crdefault;
////  TreeView1.Select(TreeView1.Items[101])
//  TreeView1.Select(TreeView1.Items[0])
//  finally
//  form1.ClientDataSet1.EnableControls ;
//
//  end;
//form1.ClientDataSet1.MergeChangeLog ;
// form1.ClientDataSet1.ApplyUpdates(-1);
// form1.ClientDataSet1.SaveToFile(GetHomePath + DataBaseFileName);
// form1.ClientDataSet1.close;
// form1.ClientDataSet1.loadfromfile(GetHomePath + DataBaseFileName);
// form1.ClientDataSet1.open;
////  if FileExists(form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds') then
////  Deletefile(form1.GetShellFolders('Personal')+'\ARO'+'\'+'pg18.cds') ;
//
//except
//  Application.MessageBox('下载失败，请检查是否联网或稍后再试！', appname, MB_OK +
//    MB_ICONWARNING);
//end;
//finally
//  cdsnew.Free;
//  MyStream.free;
//
//end;
//end
//else
//  Application.MessageBox('下载失败，请检查是否联网!', appname, MB_OK +
//    MB_ICONWARNING);
end;







procedure TForm1.Randplay;
var s,i:integer;
begin

//  TreeView1.Select(TreeView1.Items[0]);
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
  Randomize;
  ClientDataSet1.first;
  clientdataset1.edit;
  if not clientdataset1.eof then
  if clientdataset1.fieldbyname('视频类型').asstring<>'电视台' then
  begin
  for i:=0 to ClientDataSet1.RecordCount -1 do
  begin
  s:=Random(ClientDataSet1.RecordCount);
  end;
  ClientDataSet1.RecNo :=s;
  DBGrid1CellClick(DBGrid1.Columns[1]);
//  title2 :=ClientDataSet1.FieldByName('电台名称').AsString ;
  DBGrid1DblClick(self);
//  toolbutton1.Click ;
  end;
end;


procedure TForm1.Randplay2(kind:string);
var s,i:integer;
begin
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
//  TreeView1.Select(TreeView1.Items[7]);
 ClientDataSet1.Filtered :=False;
 clientdataset1.filteroptions:=[focaseinsensitive];
 ClientDataSet1.Filter :='(电台类别='+ QuotedStr(kind) +') and (电台国家='+QuotedStr('中国') + ')';
 ClientDataSet1.filtered:=True;
  Randomize;
  ClientDataSet1.first;
  clientdataset1.edit;
   if not clientdataset1.eof then
//   if clientdataset1.fieldbyname('视频类型').asstring<>'电视台' then
  begin
  for i:=0 to ClientDataSet1.RecordCount -1 do
  begin
  s:=Random(ClientDataSet1.RecordCount);
  end;
  ClientDataSet1.RecNo :=s;
  DBGrid1CellClick(DBGrid1.Columns[1]);
  DBGrid1DblClick(self);
  end;
  toolbar3.buttons[7].hint:='Random Genre：'+kind;
  end;

procedure TForm1.Randplay3(kind:string);
var s,i:integer;
begin
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
//  TreeView1.Select(TreeView1.Items[7]);
 ClientDataSet1.Filtered :=False;
 clientdataset1.filteroptions:=[focaseinsensitive];
 ClientDataSet1.Filter :='(电台类别='+ QuotedStr(kind) +') and (电台国家<>'+QuotedStr('China') + ')';
 ClientDataSet1.filtered:=True;
  Randomize;
  ClientDataSet1.first;
  clientdataset1.edit;
   if not clientdataset1.eof then
//   if clientdataset1.fieldbyname('视频类型').asstring<>'电视台' then
  begin
  for i:=0 to ClientDataSet1.RecordCount -1 do
  begin
  s:=Random(ClientDataSet1.RecordCount);
  end;
  ClientDataSet1.RecNo :=s;
  DBGrid1CellClick(DBGrid1.Columns[1]);
  DBGrid1DblClick(self);
  end;
  toolbar3.buttons[7].hint:='Random Genre：'+kind;
  end;

procedure TForm1.Randplay1(kind:string);
var s,i:integer;
begin
  ClientDataSet1.Filter := '';
  ClientDataSet1.Filtered := True;
//  TreeView1.Select(TreeView1.Items[7]);
 ClientDataSet1.Filtered :=False;
 clientdataset1.filteroptions:=[focaseinsensitive];
 ClientDataSet1.Filter :='电台类别 ='+#39+trim(kind)+#39;
 ClientDataSet1.filtered:=True;
  Randomize;
  ClientDataSet1.first;
  clientdataset1.edit;
  if not clientdataset1.eof then
  if clientdataset1.fieldbyname('视频类型').asstring<>'电视台' then
  begin
  for i:=0 to ClientDataSet1.RecordCount -1 do
  begin
  s:=Random(ClientDataSet1.RecordCount);
  end;
  ClientDataSet1.RecNo :=s;
  DBGrid1CellClick(DBGrid1.Columns[1]);
  DBGrid1DblClick(self);
  end;
  end;

//

procedure TForm1.RecordRadio;
var v:hwnd;
begin

      if (BASS_ChannelIsActive(chan)=BASS_ACTIVE_PLAYING) then
//      or (clientdataset1.fieldbyname('电台类型').asstring<>'网页电台') then
        if  CheckdirectoryName  then
        begin
           if toolbutton2.tag=0 then
            begin
              if rdfile  then
                  fn:=Form2.LabeledEdit1.Text+'\'+title5+' - '
              else
                  fn:=Form2.LabeledEdit1.Text+'\'+title2+' - ';

               if (chan <> 0) then
                BASS_Encode_MP3_StartFile(chan, nil,BASS_ENCODE_LIMIT or BASS_UNICODE,PWideChar(changefileext(fn,FormatDateTime('yyyymmddhhnnss',now)+'.mp3')));
                Label6.Font.Color:=clred;
                label6.ShowHint:=True;
              Form1.ToolButton2.ImageIndex :=1;
              form1.TrayIcon1.IconIndex:=19;
              Form1.ToolButton2.Hint:='Stop Record';
              Form1.ToolButton2.Tag :=1;
              PopupMenu4.Items[6].Enabled:=true;
              Form1.PopupMenu1.Items[6].Caption :='Stop Record';
              form1.PopupMenu1.Items[6].Tag:=1;
              Form1.PopupMenu4.Items[6].Caption :='Stop Record';
              form1.PopupMenu4.Items[6].Tag:=1;
              label4.Visible:=true;
            end
            else if ToolButton2.Tag=1 then
            begin
              BASS_Encode_Stop(chan);
              Label6.Font.Color:=clblue;
              label6.ShowHint:=False;
//              form1.AudioRecord1.Close ;
//              Form1.Timer5.Enabled :=false;
              Form1.ToolButton2.ImageIndex :=0;
              Form1.ToolButton2.Hint:='Start Record';
              Form1.ToolButton2.Tag :=0;
              form1.TrayIcon1.IconIndex:=7;
//              panel8.Visible :=false;
              label4.Visible:=False;
              Form1.PopupMenu1.Items[6].Caption :='Record station';
              Form1.PopupMenu1.Items[6].Tag:=0;
              Form1.PopupMenu4.Items[6].Caption :='Record station';
              Form1.PopupMenu4.Items[6].Tag:=0;
              label4.Visible:=False;
              if form2.checkbox7.checked  then
              Form2.SpeedButton6.Click ;
              if Form2.CheckBox3.Checked then
            ShellExecute(handle,'open',PChar(Form2.netpan),nil,nil,SW_SHOWNORMAL );
             if ToolButton23.Tag =1 then
                  ToolButton23.Click ;

            end
        end
        else  begin
          MessageBeep(16);
          Application.MessageBox('Record directory is null or inexistence, please resetting.',appname,MB_OK +
              MB_ICONINFORMATION +MB_TOPMOST);
         Form2.ShowModal ;
//         form2.PageControl1.TabIndex :=2;
         form2.Notebook1.PageIndex :=5;
         Form1.ToolButton2.Tag :=0;
         Form1.ToolButton2.ImageIndex :=0;
         Form1.ToolButton2.Hint:='Start record';
         form1.PopupMenu1.Items[5].Items[0].Caption :='Play';
        end
      else
        Application.MessageBox('It can only work under the playing status.',appname,MB_OK +
         MB_ICONINFORMATION +MB_TOPMOST);
         PopupMenu4.Items[6].Enabled:=false;
    form1.Timer3.Enabled :=false;
//  end
//  else begin
//   Application.MessageBox('请先开启录音功能！',appname,MB_OK +
//         MB_ICONINFORMATION +MB_TOPMOST);
//   form2.Notebook1.PageIndex :=4;
//    Form2.ShowModal ;
//end;
end;







function TForm1.Regaro: Boolean;
var dr:string;
begin
  idftp1.Connect;
        idftp1.ChangeDir('wwwroot/reg/cn');
        dr:=GetHomePath+'\'+ansistring(Form2.Edit1.Text+'.xml');
        idftp1.Get(ansistring(Form2.Edit1.Text+'.xml'), PChar(dr), True);
        result:=true;
//    idftp1.Connect;
//  idftp1.ChangeDir('wwwroot/uSeR/cn/'+labelededit1.Text);
////  FileSize:= idftp1.Size('shoucang.cds');
//  dr:=GetHomePath+'\shoucang.cds';
//  idftp1.Get('shoucang.cds', PChar(dr), True);

//              if DownloadFile(website+'reg/cn/'+ansistring(Form2.Edit1.Text)+'.xml',GetHomePath+'\'+ansistring(Form2.Edit1.Text+'.xml'))
//          or FileExists(GetHomePath+'\'+ansistring(Form2.Edit1.Text+'.xml'))then

end;

procedure TForm1.savell;
var i:tinifile;
begin
  try
     i:=TIniFile.Create(GetHomePath+'\ARO\ll.dat');
     i.WriteString('ll','backup',Edit1.Text);
     i.WriteString('ll','local',ip);
     i.WriteString('ll','time',FormatDateTime('mmdd',now));
     i.WriteString('ll','lastnumber',ClientDataSet1.FieldByName('电台名称').AsString);
     i.WriteInteger('ll','loud1',TrackBar1.position);
//      i.WriteString('ll','kindle',Label16.Caption);
  finally
    i.free;
  end;
end;

//end;

procedure TForm1.Saveradio;
var i:tinifile;
begin
  try
    i:=TIniFile.Create(GetHomePath+'\ARO\channel.dat');
    i.writestring('music','0',popupmenu4.Items[2].Items[0].Caption);
    i.writestring('music','1',popupmenu4.Items[2].Items[1].Caption);
    i.writestring('music','2',popupmenu4.Items[2].Items[2].Caption);
    i.writestring('music','3',popupmenu4.Items[2].Items[3].Caption);
    i.writestring('music','4',popupmenu4.Items[2].Items[4].Caption);
    i.writestring('music','5',popupmenu4.Items[2].Items[5].Caption);
    i.writestring('music','6',popupmenu4.Items[2].Items[6].Caption);
    i.writestring('music','7',popupmenu4.Items[2].Items[7].Caption);
//    i.WriteString('music','weibo',lweibo);

//    i.writeinteger('music','select',buttonededit1.leftbutton.imageindex);
  finally
    i.Free ;
end;

end;
procedure TForm1.AudioRecord1Data(Data: Pointer; Count: Integer);
begin
//label4.visible:=true;
//label4.caption:=FormatDateTime('hh:mm:ss',t)+' - '+FormatFloat('0.00',count/1048576)+'M';
end;



procedure TForm1.savetree;
var
  F: TFileStream;
begin
//  if sim then
//    F := TFileStream.Create(ExtractFilePath(Application.ExeName)+'rda.dat', fmCreate or fmShareCompat)
//  else
    F := TFileStream.Create(GetHomePath+'\rde.dat', fmCreate or fmShareCompat);
  try
    F.WriteComponent(TreeView1);
  finally
    F.Free;
  end;
end;

procedure TForm1.Sendmail(name1, name2, name3, name4,name5: string);
begin
  idMessage1.From.Address := '909332700@qq.com';  //发件人
  idMessage1.Recipients.EMailAddresses := 'support@abroadradio.net'; //收件人
  idMessage1.Subject := name1+name2+name3+name4+name5;    //邮件主题
  try
    idsmtp1.Connect ;
    idSMTP1.Send(idMessage1);
  except
    Application.MessageBox('Push failed! please retry.', appname, MB_OK +
      MB_ICONSTOP);
    idSMTP1.Disconnect;
    Exit;
  end;

end;

procedure TForm1.SetAutoRun(ok: boolean);
var
   Reg:TRegistry;       //首先定义一个TRegistry类型的变量Reg
begin
   Reg:=TRegistry.Create;
   try                           //创建一个新键
     Reg.RootKey:=HKEY_LOCAL_MACHINE;     //将根键设置为HKEY_LOCAL_MACHINE
     Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',true);//打开一个键
     if ok then begin
        Reg.WriteString('AroPlay',ExpandFileName(ParamStr(0)));         //在Reg这个键中写入数据名称和数据数值
          form2.checkbox1.Checked:=true;
//        ShowMessage('注册成功！');
     end
     else begin
        reg.DeleteValue('AroPlay');
         form2.checkbox1.Checked:=false;
//        ShowMessage('删除成功！')
     end;
     Reg.CloseKey;       //关闭键
   finally
     Reg.Free;
   end;
end;

procedure TForm1.deletepg18;
var cdsnew:Tclientdataset;
begin
      try
        form1.ClientDataSet1.DisableControls;
        cdsnew:=Tclientdataset.Create(nil);
        cdsnew.Data :=form1.ClientDataSet1.Data ;
        cdsnew.First;
      while not cdsnew.Eof do
        begin
          if cdsnew.fieldbyname('电台类别').AsString='PG18+' then
            cdsnew.Delete
          else
            cdsnew.Next;
        end;
      form1.ClientDataSet1.Data:=cdsnew.Data;
      with form1.ClientDataSet1 do
        begin
          MergeChangeLog ;
          ApplyUpdates(-1);
          SaveToFile(GetHomePath + DataBaseFileName);
          LoadFromFile(GetHomePath + DataBaseFileName);
          Open;
//          form1.TreeView1.Select(form1.TreeView1.Items[169]);
        end;
        finally
          cdsnew.Free ;
          Form1.ClientDataSet1.EnableControls ;
        end;
    end;

procedure TForm1.ShowNet;
var

  dr:String;
  XMLDocument1:tXMLDocument;
  nodes :array[0..9] of IXMLNode;

//  imagestream :TMemoryStream;
//  jpg:TPngImage;
begin

begin
  Image4.Picture := nil;

//  if DownloadFile(website+'book/img/eco1.png',GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png')then
//        Image4.Picture.LoadFromFile(GetShellFolders('Personal')+'\ARO'+'\'+'eco1.png');
  idftp1.Connect;
      IdFTP1.ChangeDir('wwwroot');
      dr:=GetHomePath+'\ARO\cn.xml';
      idftp1.Get('cn.xml', PChar(dr), True);
  try
    begin
      try
        XMLDocument1:=Txmldocument.create(self);
        XMLDocument1.LoadFromFile(dr);
//        weibo:=XMLDocument1.DocumentElement.ChildNodes[0].ChildNodes[0].Text;

//		    lweibo:=weibo;
//        if (lweibo<>'')  then
//        begin
//         Image1.visible:=True;
//         Image1.hint:=lweibo;
//        end
//        else
//         Image1.visible:=False;
        nodes[0]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('people');
        nodes[1]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('local');
        nodes[2]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('version');
        nodes[3]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('number');
        nodes[4]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('web');
        nodes[5]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('name');
        nodes[6]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('title');
        nodes[7]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('qq');
        nodes[8]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('genre');
        nodes[9]:=XMLDocument1.DocumentElement.ChildNodes.FindNode('memo');
		    Form2.Label13.Caption:=nodes[0].Text;
        ip:= nodes[1].Text;
        netmobi:=nodes[2].Text;
        update:=nodes[3].Text;
        webad:=nodes[4].Text;
        name:=nodes[5].Text;
        rname:=nodes[6].Text;
        qq:=nodes[7].Text;
        genre:=nodes[8].Text;
        Label10.Caption:=nodes[9].Text;
        if nodes[2].Text<>'' then
          ToolButton22.ImageIndex:=46
        else
          ToolButton22.ImageIndex:=38;
//        ip:=XMLDocument1.DocumentElement.ChildNodes[1].ChildNodes[0].Text;
//        netmobi:=XMLDocument1.DocumentElement.ChildNodes[2].ChildNodes[0].Text;
//		    update:=XMLDocument1.DocumentElement.ChildNodes[3].ChildNodes[0].Text;
//		    webad:=XMLDocument1.DocumentElement.ChildNodes[4].ChildNodes[0].Text;
//		    name:=XMLDocument1.DocumentElement.ChildNodes[5].ChildNodes[0].Text;
//		    rname:=XMLDocument1.DocumentElement.ChildNodes[6].ChildNodes[0].Text;
//		    qq:=XMLDocument1.DocumentElement.ChildNodes[7].ChildNodes[0].Text;
//		    genre:=XMLDocument1.DocumentElement.ChildNodes[8].ChildNodes[0].Text;
//		    label10.caption:=XMLDocument1.DocumentElement.ChildNodes[9].ChildNodes[0].Text;
        label19.caption:=rname;
        label18.caption:=name+#32+' ';
        Label19.Left :=Label18.left+label18.Width +10;

          idftp1.disconnect;
//           node2:=XMLDocument1.DocumentElement.ChildNodes.FindNode('title');
//           ShowMessage(node2.Text);
//
        if nodes[6].Text<>'' then
          panel32.top:=-4
        else
          panel32.top:=10;
       finally
         XMLDocument1.Free ;
      end;
    end
  except
  end;
  WebBrowser2.Offline:=true;
//  WebBrowser2.Navigate(website+'/book/index.html');
  Webbrowser1.Navigate(website+'1.html');
  deletefile(dr);
end;
//if form2.checkbox5.checked then
//if form2.combobox8.itemindex=0 then
//fixdb(true)
//else
//fixdb(false);
end;


procedure TForm1.ShowSchool;
var left1,top1:Integer;
begin
  Left1:=self.Left + 300;
  Top1:= self.Top;
  form5:=TForm5.Create(self);
  with form5 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      Showmodal ;
    end;
end;

procedure TForm1.Showtv;
var left1,top1:Integer;
begin
BASS_ChannelStop(chan);
  Left1:=self.Left + 300;
  Top1:= self.Top;
  form7:=TForm7.Create(nil);
//  v:=FindWindow('TForm7',nil);
//  if v<>0 then
  begin
  with form7 do
    begin
      left:=Left1;
      Top:=Top1;
//      FormStyle:=fsStayOnTop;
      show;
    end;
end;
end;

procedure TForm1.ShowUser;
var cleft,ctop:Integer;
begin
  CLeft:=self.Left + 300;
  CTop:= self.Top;
  form3:=TForm3.Create(self);
  with form3 do
    begin
      left:=CLeft;
      Top:=CTop;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;

//procedure TForm1.SortCity(city: string);
//begin
//end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
Stayon;
end;



procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
//WebBrowser3.Refresh ;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
//if SpeedButton12.down then
//  begin
//    datetimepicker1.visible:=True;
//    SpeedButton12.tag:=1;
//    SpeedButton12.hint:='已开启定时下载';
//    Timer6.enabled:=true;
//  end
//  else begin
//    datetimepicker1.visible:=False;
//    SpeedButton12.tag:=0;
//    SpeedButton12.hint:='未开启定时下载';
//    Timer6.enabled:=False;
//  end;
end;

procedure TForm1.SpeedButton13MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbLeft then
begin
  PopupMenu13.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
notebook2.activepage:='2';
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
WebBrowser4.Navigate('http://www.aroplay.com/1.html');
notebook2.activepage:='Default';
N20.Click;
form1.PopupMenu1.Items[5].visible:=True  ;
//form1.PopupMenu1.Items[7].visible:=True ;
form1.PopupMenu1.Items[4].visible:=True ;
//form1.PopupMenu1.Items[11].visible:=True ;
//form1.PopupMenu1.Items[12].visible:=true;
//form1.PopupMenu1.Items[13].visible:=True ;
TrayIcon1.IconIndex:=8;
//form1.TreeView1.Select(form1.TreeView1.Items[0]);
end;




procedure TForm1.SpeedButton1Click(Sender: TObject);

begin
//if Form1.DownloadFile(website+'mobi/'+'Economist.mobi','e:\') then
//begin
//  ShowMessage('ok');
//end;
end;
//  Left1:=self.Left + 180;
//  Top1:= self.Top+60;
//  Form10 := TForm10.Create(nil);
//   with form10 do
//    begin
//      left:=Left1;
//      Top:=Top1;
////      FormStyle:=fsStayOnTop;
//    end;
//  try
//    if form10.ShowModal = mrOk then begin
//      ClientDataSet1.Filter := form10.Filter;
//      ClientDataSet1.Filtered := True;
//    end;
//  finally
//    form10.Free;
//  end;
//end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin

//showkindle('TWP');
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
var left1,top1:Integer;
begin
  Left1:=self.Left + 80;
  Top1:= self.Top+40;
  form13:=TForm13.create(self);
  with form13 do
    begin
      left:=Left1;
      Top:=Top1;
      FormStyle:=fsStayOnTop;
      ShowModal ;
    end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
notebook2.activepage:='Default';
N20.Click;
//form1.TreeView1.Select(form1.TreeView1.Items[0]);
form1.PopupMenu1.Items[5].visible:=True  ;
//form1.PopupMenu1.Items[7].visible:=True ;
form1.PopupMenu1.Items[4].visible:=True ;
//form1.PopupMenu1.Items[11].visible:=True ;
//form1.PopupMenu1.Items[12].visible:=true;
//form1.PopupMenu1.Items[13].visible:=True ;
TrayIcon1.IconIndex:=8;
//Panel12.visible:=not Panel12.visible;
end;

procedure TForm1.SpeedButton3click(Sender: TObject);
begin
  WebBrowser2.Refresh ;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin

end;

//

procedure TForm1.SpeedButton5Click(Sender: TObject);
//var
begin

//if SpeedButton5.Tag=0 then
//begin
//  SpeedButton5.Down:=True;
//try
//  client:=TClientDataSet.Create(nil);
//  client.Data :=ClientDataSet1.Data;


//  if ComboBox2.text<>'' then
//  begin
//  ClientDataSet1.Filtered :=False;
//  clientDataSet1.filteroptions:=[focaseinsensitive];
//  ClientDataSet1.Filter := '视频类型=''电视台''and 电台名称='+#39+trim(ComboBox2.text)+'*'+#39;
//  ClientDataSet1.Filtered := True;
//  end
//  else begin
//  ClientDataSet1.Filtered :=False;
//  clientDataSet1.filteroptions:=[focaseinsensitive];
//  ClientDataSet1.Filter := '视频类型=''电视台''and 电台名称='+#39+trim(QuotedStr(TreeView1.selected.Text))+'*'+#39;
//  ClientDataSet1.Filtered := True;
//  end;
//  ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);



////  StatusBar1.Panels.Items[0].Text :=#32+'当前电台任务有'+#32+inttostr(client.RecordCount)+#32+'条';
//finally
//  client.Free;
//end;

//
//  if ButtonedEdit1.rightbutton.imageindex =26 then
//    begin
//      clientdataset1.filteroptions:=[focaseinsensitive];
//      case ButtonedEdit1.leftbutton.imageindex  of
//        25:ClientDataSet1.Filter :='视频类型=''电视台''and 电台名称='+#39+trim(buttonededit1.text)+'*'+#39;
//        10:ClientDataSet1.Filter :='视频类型=''电视台''and 电台国家=' +#39+trim(buttonededit1.text)+'*'+#39;
////        11:ClientDataSet1.Filter :='视频类型=''电视台''and 语言类型='+#39+trim(buttonededit1.text)+'*'+#39;
//        21:ClientDataSet1.Filter :='视频类型=''电视台''and 收藏 =''★'' and 电台名称 ='+#39+trim(buttonededit1.text)+'*'+#39;
//      end;
//      ClientDataSet1.Filtered:=true;

//
//    end;
//    speedbutton5.TAG:=1;
//end
//else  begin
//  SpeedButton5.Tag:=1;
//  ClientDataSet1.Filtered:=false;
//  if ButtonedEdit1.rightbutton.imageindex =26 then
//    begin
//      clientdataset1.filteroptions:=[focaseinsensitive];
//       case ButtonedEdit1.leftbutton.imageindex  of
//        25:ClientDataSet1.Filter :='电台名称 ='+#39+trim(buttonededit1.text)+'*'+#39;
//        10:ClientDataSet1.Filter :='电台国家=' +#39+trim(buttonededit1.text)+'*'+#39;
////        11:ClientDataSet1.Filter :='语言类型='+#39+trim(buttonededit1.text)+'*'+#39;
//        21:ClientDataSet1.Filter :='收藏 =''★'' and 电台名称 ='+#39+trim(buttonededit1.text)+'*'+#39;
//       end;
//      ShowScrollbar(DBGrid1.Handle,SB_VERT,TRUE);
//      ClientDataSet1.Filtered:=True;
//      end;
//  speedbutton5.TAG:=0;
//  end;

end;

procedure TForm1.SpeedButton5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
//speedbutton5.hint:='仅显示电视台内容';

//speedbutton5.hint:='从查找结果中实现电台-电视台快速切换: '+ShortCuttotext(form2.hotkey2.hotkey);
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
ComboBox4.OnChange(self);
WebBrowser4.Navigate('http://www.aroplay.com/1.html');
notebook2.activepage:='3';
Label16.Caption:=Form2.ComboBox7.Items[Form2.ComboBox7.ItemIndex];

//if form2.ComboBox4.Enabled  then
//label16.caption:=form2.ComboBox4.text+form2.edit4.text
//else
//label16.caption:=form2.Edit4.text;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
notebook2.activepage:='Default';
N20.Click;
//TreeView1.Select(form1.TreeView1.Items[0]);
PopupMenu1.Items[5].visible:=True ;
//form1.PopupMenu1.Items[7].visible:=True ;
PopupMenu1.Items[4].visible:=True ;
ComboBox4.Enabled:=true;
//form1.PopupMenu1.Items[11].visible:=True ;
//form1.PopupMenu1.Items[12].visible:=true;
//form1.PopupMenu1.Items[13].visible:=True ;
TrayIcon1.IconIndex:=8;
end;


procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
WebBrowser4.Navigate('http://www.aroplay.com/1.html');
notebook2.activepage:='2';
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
var dr:string;
begin
//TThread.CreateAnonymousThread(kindlelogo).Start;
if form2.ComboBox4.Enabled  then
dr:=form2.combobox7.text
else
dr:=form2.Edit4.text;
Label16.Caption :=Form2.ComboBox7.Items[Form2.ComboBox7.ItemIndex];;
//vkindle:=dr;
end;

procedure TForm1.SpeedButton9MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button=mbLeft then
begin
  PopupMenu12.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
end;

function TForm1.StartApp(apchOperation, apchFileName, apchParameters, apchDirectory: PChar;
  awrdShowCmd: Word): Cardinal;
var
  lseiInfo: TShellExecuteInfo;
begin
  Result := 0;
  FillChar(lseiInfo, SizeOf(lseiInfo), Chr(0));
  lseiInfo.cbSize := SizeOf(lseiInfo);
  lseiInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
  lseiInfo.lpVerb := apchOperation;
  lseiInfo.lpFile := apchFileName;
  lseiInfo.lpParameters := apchParameters;
  lseiInfo.lpDirectory := apchDirectory;
  lseiInfo.nShow := awrdShowCmd;

  if Boolean(ShellExecuteEx(@lseiInfo)) then
    Result := lseiInfo.hProcess;
end;

procedure TForm1.Startcheck;
var reg: TRegistry;
begin
    reg := TRegistry.Create;
    reg.RootKey:=HKEY_LOCAL_MACHINE;
    try
     if reg.OpenKey('SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN',False) then
        if reg.ValueExists('AroPlay') then
          form2.checkbox1.Checked:=true
        else
          form2.checkbox1.Checked:=false
    finally
      reg.CloseKey;
      reg.Free;
    end;
end;


//procedure TForm1.SystemVolunm;
//begin
//if isvista then
//    winexec('c:\windows\system32\SNDVOL.EXE',sw_normal)
//  else
//    winexec('c:\windows\system32\SNDVOL32.EXE',sw_normal)
//end;

//{ TDBGrid }
//
constructor TDBGrid.Create(AOwner: TComponent);
begin
  inherited;
  Options := Options + [dgindicator];
  Self.FOldGridWnd := Self.WindowProc;
  Self.WindowProc := NewGridWnd;
  SelectedRow := -1;
end;



procedure TDBGrid.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if SelectedRow=-1 then  SelectedRow:=DataSource.DataSet.RecNo;
  Color := clWhite;
  Options := Options + [dgRowSelect];
  if ((State = [gdSelected]) or (State = [gdSelected, gdFocused])) then
  begin
    Canvas.Brush.color := Color;
    Canvas.Font.Color := font.Color  ;
  end;
  if DataSource.DataSet.RecNo = selectedRow then
    Canvas.Brush.color :=rgb(19,210,244); //当前行以红色显示，其它行使用背景的浅绿色
  Canvas.pen.mode := pmWhite ;
  DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//
procedure TDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  Cell: TGridCoord;
begin
  inherited;
  if Button = mbLeft then
  begin
    selectedRow := DataSource.DataSet.RecNo;
    repaint;
  end;
end;
//
procedure TDBGrid.NewGridWnd(var Message: TMessage);
var
  IsNeg: Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then
      SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 0)
    else
      SendMessage(Handle, WM_VSCROLL, SB_LINEUP, 0)
  end
  else
    Self.FOldGridWnd(Message);
end;







procedure TDBGrid.WMNCCalcSize(var msg: TMessage);
var
  style: Integer;
begin
  style := getWindowLong( handle, GWL_STYLE );
  If (style and WS_VSCROLL) = 0 Then
    SetWindowLong( handle, GWL_STYLE, style or WS_VSCROLL );
  inherited;
end;

procedure TDBGrid.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
inherited;
  Windows.ShowScrollBar(Handle, SB_VERT, True);
end;

//
end.
