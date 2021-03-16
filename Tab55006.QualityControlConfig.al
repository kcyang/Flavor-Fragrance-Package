table 55006 "Quality Control Config"
{
    CaptionML = ENU='Quality Control Config',KOR='QC 설정';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            CaptionML = ENU='Entry No.',KOR='Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "QC Test No. Series"; Code[20])
        {
            CaptionML = ENU='QC Test No. Series',KOR='QC 테스트 기본번호 시리즈';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "QC Requirements"; Boolean)
        {
            CaptionML = ENU='QC Requirements',KOR='QC 기본요구';
            DataClassification = CustomerContent;
        }
        field(4; "Default QC Location"; Code[10])
        {
            CaptionML = ENU='Default QC Location',KOR='기본 QC Location';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
}
