unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Objects, FMX.Edit,
  FMX.Layouts, FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    CATAT: TLabel;
    edtdata: TEdit;
    ListView1: TListView;
    btnsave: TButton;
    btnDelete: TButton;
    procedure btnsaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure TlistView(const Sender: TObject; const AItem: TListViewItem);

  private
  SomeCalculatedHeight: Single; // atau jenis data yang sesuai
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.btnDeleteClick(Sender: TObject);
var
  SelectedItem: TListViewItem;
begin
// Periksa apakah ada item terpilih
  if ListView1.Selected <> nil then
  begin
    // Hapus item yang dipilih
    ListView1.Items.Delete(ListView1.Selected.Index);
  end
  else
  begin
    ShowMessage('Pilih item yang akan dihapus.');
  end;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var
  ListItem: TListViewItem;
begin
  // Validasi bahwa TEdit tidak kosong
  if edtData.Text <> '' then
  begin
    // Tambahkan data ke dalam TListView
    ListItem := ListView1.Items.Add;
    ListItem.Text := edtData.Text;

    // Bersihkan TEdit setelah data ditambahkan
    edtData.Text := '';
  end
  else
  begin
    ShowMessage('Masukkan data sebelum menyimpan.');
  end;
end;
procedure TForm1.TlistView(const Sender: TObject; const AItem: TListViewItem);
begin
// Sesuaikan tinggi baris atau properti lainnya di sini
  AItem.Height := Round(SomeCalculatedHeight);
end;

end.
