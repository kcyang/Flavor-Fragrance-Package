table 55012 "Quality Test Header"
{
    CaptionML = ENU='Quality Test Header',KOR='품질테스트';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU='No.',KOR='테스트 번호';
            DataClassification = CustomerContent;
        }
        field(2; "Item No."; Code[20])
        {
            CaptionML = ENU='Item No.',KOR='품목 번호';
            DataClassification = CustomerContent;
            TableRelation = Item;
            trigger OnValidate()
            var 
                Item: Record Item;
            begin
                if (xRec."Item No." <> Rec."Item No.") AND
                (Rec."Item No." <> '') then
                begin
                    Item.Reset();
                    if Item.Get("Item No.") then
                        Rec."Item Description" := Item.Description;
                end;
            end;              
        }
        field(3; "Item Description"; Text[250])
        {
            CaptionML = ENU='Item Description',KOR='품목 적요';
            DataClassification = CustomerContent;
        }
        field(4; "Customer No."; Code[20])
        {
            CaptionML = ENU='Customer No.',KOR='매출처 번호';
            DataClassification = CustomerContent;
            TableRelation = Customer;
            trigger OnValidate()
            var 
                Customer: Record Customer;
            begin
                if (xRec."Customer No." <> Rec."Customer No.") AND
                (Rec."Customer No." <> '') then
                begin
                    Customer.Reset();
                    if Customer.Get("Customer No.") then
                        Rec."Customer Name" := Customer.Name;
                end;
            end;            
        }
        field(5; "Customer Name"; Text[250])
        {
            CaptionML = ENU='Customer Name',KOR='매출처명';
            DataClassification = CustomerContent;
        }
        field(6; "Vendor No."; Code[20])
        {
            CaptionML = ENU='Vendor No.',KOR='매입처 번호';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
            trigger OnValidate()
            var 
                Vendor: Record Vendor;
            begin
                if (xRec."Vendor No." <> Rec."Vendor No.") AND
                (Rec."Vendor No." <> '') then
                begin
                    Vendor.Reset();
                    if Vendor.Get("Vendor No.") then
                        Rec."Vendor Name" := Vendor.Name;
                end;
            end;               
        }
        field(7; "Vendor Name"; Text[250])
        {
            CaptionML = ENU='Vendor Name',KOR='매입처명';
            DataClassification = CustomerContent;
        }
        field(8; Status; Enum "Quality Test Status")
        {
            CaptionML = ENU='Status',KOR='상태';
            DataClassification = CustomerContent;
        }
        field(9; "Lot_Serial No."; Code[100])
        {
            CaptionML = ENU='Lot./Serial No.',KOR='Lot./Serial No.';
            DataClassification = CustomerContent;
            //TableRelation = "Item Ledger Entry"."Lot No." where("QC Required" = const(true));
            trigger OnLookup()
            var
                ItemLedger: Record "Item Ledger Entry";
                ItemLedgerLot: Page "Item Ledger LotSerial List";
            begin
                ItemLedger.Reset();
                ItemLedger.SetCurrentKey("QC Required","QC Compliance","QC Non Compliance");
                ItemLedger.SetRange("QC Required",true);
                ItemLedger.SetRange("QC Compliance",0);
                ItemLedger.SetFilter("Item No.","Item No.");
                ItemLedgerLot.SetRecord(ItemLedger);
                ItemLedgerLot.SetTableView(ItemLedger);
                ItemLedgerLot.LookupMode(true);
                if ItemLedgerLot.RunModal() = Action::LookupOK then 
                begin
                    ItemLedgerLot.GetRecord(ItemLedger);
                    "Lot_Serial No." := ItemLedger."Lot No.";
                    "Test Item Ledger Entry No." := ItemLedger."Entry No.";
                    Modify();
                end else begin

                end;
            end;
        }
        field(10; "Creation Date"; Date)
        {
            CaptionML = ENU='Creation Date',KOR='생성 일자';
            DataClassification = CustomerContent;
        }
        field(11; "Last Modified Date"; Date)
        {
            CaptionML = ENU='Last Date Modified',KOR='마지막 수정일자';
            DataClassification = CustomerContent;
        }
        field(12; "Test Start Date"; Date)
        {
            CaptionML = ENU='Test Start Date',KOR='테스트 시작일자';
            DataClassification = CustomerContent;
        }
        field(13; "Test Start Time"; Time)
        {
            CaptionML = ENU='Test Start Time',KOR='테스트 시작시간';
            DataClassification = CustomerContent;
        }
        field(14; "Test Item Ledger Entry No.";Integer)
        {
            CaptionML = ENU='Test Item Ledger Entry No.',KOR='테스트 품목원장번호';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        "Last Modified Date" := Today;
    end;
    trigger OnInsert()
    var 
        myNos: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        QCConfig: Record "Quality Control Config";
    begin
        QCConfig.Reset();
        if QCConfig.Find('-') then
        begin
            if QCConfig."QC Test No. Series" <> '' then
                NoSeriesMgt.InitSeries(QCConfig."QC Test No. Series",myNos,0D,"No.",myNos)
            else
                Error('QC 설정이 누락되었습니다. 기본 사양번호 시리즈를 확인하세요.');
        end;
        "Creation Date" := Today;
    end;
    trigger OnDelete()
    var
        QCTestLines: Record "Quality Test Line";
    begin
        QCTestLines.Reset();
        QCTestLines.SetRange("Document No.","No.");
        QCTestLines.DeleteAll(true);
    end;    
}
