table 55007 "Quality Control Code"
{
    CaptionML = ENU='Quality Control Code',KOR='QC 관련코드';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Type; Enum "Quality Control Code Type")
        {
            CaptionML = ENU='Type',KOR='유형';
            DataClassification = CustomerContent;
        }
        field(2; Code; Code[20])
        {
            CaptionML = ENU='Code',KOR='코드';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[250])
        {
            CaptionML = ENU='Description',KOR='설명';
            DataClassification = CustomerContent;
        }
        field(4; "Result Type"; Enum "Quality Control Result Type")
        {
            CaptionML = ENU='Result Type',KOR='결과 유형';
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
