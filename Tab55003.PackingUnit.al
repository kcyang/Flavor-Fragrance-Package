table 55003 "Packing Unit"
{
    CaptionML = ENU='Packing Unit',KOR='Packing Unit';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Code; Code[20])
        {
            CaptionML = ENU='Code',KOR='코드';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            CaptionML = ENU='Description',KOR='설명';
            DataClassification = CustomerContent;
        }
        field(3; Capacity; Decimal)
        {
            CaptionML = ENU='Capacity',KOR='용량(KG)';
            DataClassification = CustomerContent;
        }
        field(4; Block; Boolean)
        {
            CaptionML = ENU='Block',KOR='잠금';
            DataClassification = CustomerContent;
        }
        field(5; Weight; Decimal)
        {
            CaptionML = ENU='Weight',KOR='중량';
            DataClassification = CustomerContent;
        }
        field(6; "Cost Amount"; Decimal)
        {
            CaptionML = ENU='Cost Amount',KOR='단가';
            DataClassification = CustomerContent;
        }
        field(7; Type; Text[30])
        {
            CaptionML = ENU='Type',KOR='종류';
            DataClassification = CustomerContent;
        }
        field(8; "Revision Quantity"; Decimal)
        {
            CaptionML = ENU='Revision Quantity',KOR='포장 용기별 보정량';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    
}
