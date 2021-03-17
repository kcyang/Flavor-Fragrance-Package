table 55010 "Quality Specification Header"
{
    CaptionML = ENU='Quality Specification Header',KOR='QC 사양 헤더';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Spec No."; Code[20])
        {
            CaptionML = ENU='Spec No.',KOR='사양 번호';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
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
        field(3; "Customer Name"; Text[250])
        {
            CaptionML = ENU='Customer Name',KOR='매출처 이름';
            DataClassification = CustomerContent;
        }
        field(4; "Vendor No."; Code[20])
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
        field(5; "Vendor Name"; Text[250])
        {
            CaptionML = ENU='Vendor Name',KOR='매입처 이름';
            DataClassification = CustomerContent;
        }
        field(6; "Item No."; Code[20])
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
        field(7; "Item Description"; Text[250])
        {
            CaptionML = ENU='Item Description',KOR='품목 적요';
            DataClassification = CustomerContent;
        }
        field(8; Status; Enum "Quality Control Specification Status")
        {
            CaptionML = ENU='Status',KOR='상태';
            DataClassification = CustomerContent;
        }
        field(9; "Last Modified Date"; Date)
        {
            CaptionML = ENU='Last Modified Date',KOR='마지막 수정일자';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Spec No.","Item No.")
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
            if QCConfig."Default QC Spec. No. Series" <> '' then
                NoSeriesMgt.InitSeries(QCConfig."Default QC Spec. No. Series",myNos,0D,"Spec No.",myNos)
            else
                Error('QC 설정이 누락되었습니다. 기본 사양번호 시리즈를 확인하세요.');
        end;
    end;
    trigger OnDelete()
    var
        QCSpecLines: Record "Quality Specification Line";
    begin
        QCSpecLines.Reset();
        QCSpecLines.SetRange("Document No.","Spec No.");
        QCSpecLines.DeleteAll(true);
    end;
}
