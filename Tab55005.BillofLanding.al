table 55005 "Bill of Landing"
{
    CaptionML = ENU='Bill of Landing',KOR='BL 관리';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "BL No."; Code[20])
        {
            CaptionML = ENU='B/L No.',KOR='B/L 번호';
            DataClassification = CustomerContent;
        }
        field(2; "Vendor No."; Code[20])
        {
            CaptionML = ENU='Vendor No.',KOR='매입처 번호';
            DataClassification = CustomerContent;
        }
        field(3; "Vendor Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor.Name WHERE ("No."=FIELD("Vendor No.")));
            CaptionML = ENU='Vendor Name',KOR='매입처명';
        }
        field(4; "BL Date"; Date)
        {
            CaptionML = ENU='B/L Date',KOR='B/L 일자';
            DataClassification = CustomerContent;
        }
        field(5; "Ship Date"; Date)
        {
            CaptionML = ENU='Ship Date',KOR='선적 일자';
            DataClassification = CustomerContent;
        }
        field(6; "Import Reference No."; Code[20])
        {
            CaptionML = ENU='Import Reference No.',KOR='수입신고번호';
            DataClassification = CustomerContent;
        }
        field(7; "Currency Code"; Code[20])
        {
            CaptionML = ENU='Currency Code',KOR='통화코드';
            DataClassification = CustomerContent;
        }
        field(8; "Currency Exch. Rates"; Decimal)
        {
            CaptionML = ENU='Currency Exch. Rates',KOR='면장 환율';
            DataClassification = CustomerContent;
        }
        field(9; "Amount (FCY)"; Decimal)
        {
            CaptionML = ENU='Amount (FCY)',KOR='금액(외화)';
            DataClassification = CustomerContent;
        }
        field(10; "Amount (LCY)"; Decimal)
        {
            CaptionML = ENU='Amount (LCY)',KOR='금액(원화)';
            DataClassification = CustomerContent;
        }
        field(11; "Import Reference Date"; Date)
        {
            CaptionML = ENU='Import Reference Date',KOR='수입신고일자';
            DataClassification = CustomerContent;
        }
        field(12; "Import Refefence Remark"; Text[250])
        {
            CaptionML = ENU='Import Refefence Remark',KOR='수입신고비고';
            DataClassification = CustomerContent;
        }
        field(13; "Purch. Receipt No Count"; Integer)
        {
            CaptionML = ENU='Purch. Receipt No Count',KOR='매입입고건수';
            FieldClass = FlowField;
            CalcFormula = Count("Purch. Rcpt. Header" WHERE ("BL No."=FIELD("BL No.")));
        }
        field(14; "Purch. Cr. Memo Count"; Integer)
        {
            CaptionML = ENU='Purch. Cr. Memo Count',KOR='매입반품건수';
            FieldClass = FlowField;
            CalcFormula = Count("Purch. Cr. Memo Hdr." WHERE ("BL No."=FIELD("BL No.")));
        }
        field(15; Status; Enum "BL Status")
        {
            CaptionML = ENU='Status',KOR='상태';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "BL No.")
        {
            Clustered = true;
        }
    }
    
}
