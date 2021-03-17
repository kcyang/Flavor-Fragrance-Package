table 55009 "Quality Control Requirements"
{
    CaptionML = ENU='Quality Control Requirements',KOR='QC 필수항목';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = ENU='Item No.',KOR='품목번호';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(2; "Customer No."; Code[20])
        {
            CaptionML = ENU='Customer No.',KOR='매출처번호';
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(3; "Vendor No."; Code[20])
        {
            CaptionML = ENU='Vendor No.',KOR='매입처번호';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(4; "Quality Testing Required"; Boolean)
        {
            CaptionML = ENU='Quality Testing Required',KOR='QC 테스트 필수';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Item No.","Customer No.","Vendor No.")
        {
            Clustered = true;
        }
    }
    
}
