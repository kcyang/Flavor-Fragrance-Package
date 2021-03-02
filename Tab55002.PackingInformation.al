/// <summary>
/// 용기 정보테이블
/// </summary>
table 55002 "Packing Information"
{
    CaptionML = ENU='Packing Information',KOR='Packing Information';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Document Type"; Enum "General Posting Type")
        {
            CaptionML = ENU='Document Type',KOR='문서유형';
            DataClassification = CustomerContent;
        }
        field(2; "Document No."; Code[20])
        {
            CaptionML = ENU='Document No.',KOR='문서번호';
            DataClassification = CustomerContent;
        }
        field(3; "Document Line No."; Integer)
        {
            CaptionML = ENU='Document Line No.',KOR='문서라인번호';
            DataClassification = CustomerContent;
        }
        field(4; "Line No."; Integer)
        {
            CaptionML = ENU='Line No.',KOR='라인번호';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(5; "Packing Unit"; Code[10])
        {
            CaptionML = ENU='Packing Unit',KOR='용기종류';
            DataClassification = CustomerContent;
            TableRelation = "Packing Unit".Code WHERE (Block=CONST(false));
        }
        field(6; "Packing Unit Weight"; Decimal)
        {
            CaptionML = ENU='Packing Unit Weight',KOR='용기무게';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(7; "Unit Qty."; Integer)
        {
            CaptionML = ENU='Unit Qty.',KOR='용기개수';
            DataClassification = CustomerContent;
        }
        field(8; "Net Weight"; Decimal)
        {
            CaptionML = ENU='Net Weight',KOR='순 중량';
            DataClassification = CustomerContent;
        }
        field(9; "Gross Weight"; Decimal)
        {
            CaptionML = ENU='Gross Weight',KOR='총 중량';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(10; "Packing Capacity"; Decimal)
        {
            CaptionML = ENU='Packing Capacity',KOR='용기용량';
            DataClassification = CustomerContent;
        }
        field(11; "Posted Document No."; Code[20])
        {
            CaptionML = ENU='Posted Document No.',KOR='전기된 문서번호';
            DataClassification = CustomerContent;
        }
        field(12; "Posted Document Line No."; Integer)
        {
            CaptionML = ENU='Posted Document Line No.',KOR='전기된 문서라인번호';
            DataClassification = CustomerContent;
        }
        field(13; Type; Text[30])
        {
            CaptionML = ENU='Type',KOR='종류';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document Type","Document No.","Document Line No.","Line No.")
        {
            Clustered = true;
        }
    }
    
}
