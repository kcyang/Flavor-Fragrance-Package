table 55008 "Quality Control Option"
{
    CaptionML = ENU='Quality Control Option',KOR='QC 옵션유형';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            CaptionML = ENU='Entry No.',KOR='Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Measure Code"; Code[20])
        {
            CaptionML = ENU='Measure Code',KOR='측정코드';
            DataClassification = CustomerContent;
        }
        field(3; "Option Code"; Code[20])
        {
            CaptionML = ENU='Option Code',KOR='옵션코드';
            DataClassification = CustomerContent;
        }
        field(4; Description; Text[250])
        {
            CaptionML = ENU='Description',KOR='설명';
            DataClassification = CustomerContent;
        }
        field(5; Pass; Boolean)
        {
            CaptionML = ENU='Pass',KOR='통과';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Measure Code","Entry No.","Option Code")
        {
            Clustered = true;
        }
    }
    
}
