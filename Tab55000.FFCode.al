table 55000 "FF Code"
{
    CaptionML = ENU='FF Code',KOR='FF 코드';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Type; Enum "FF Code Type")
        {
            CaptionML = ENU='Type',KOR='유형';
            DataClassification = CustomerContent;
        }
        field(2; Code; Code[20])
        {
            CaptionML = ENU='Code',KOR='코드';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[200])
        {
            CaptionML = ENU='Description',KOR='설명';
            DataClassification = CustomerContent;
        }
        field(4; Image; Media)
        {
            Caption = 'Image';
            DataClassification = CustomerContent;            
        }
    }
    keys
    {
        key(PK; Type,Code)
        {
            Clustered = true;
        }
    }
    
}
