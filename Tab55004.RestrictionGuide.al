table 55004 "Restriction Guide"
{
    CaptionML = ENU='Restriction Guide',KOR='업체별 제한규정';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = ENU='Item No.',KOR='품목 번호';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[250])
        {
            CaptionML = ENU='Description',KOR='적요';
            DataClassification = CustomerContent;
        }
        field(3; CAS; Text[100])
        {
            CaptionML = ENU='CAS',KOR='CAS';
            DataClassification = CustomerContent;
        }
        field(4; "Account Type";Enum "Gen. Journal Source Type")
        {
            CaptionML = ENU='Account Type',KOR='업체유형';
            DataClassification = CustomerContent;
        }        
        field(5; "Account No."; Code[20])
        {
            CaptionML = ENU='Account No.',KOR='업체번호';
            DataClassification = CustomerContent;
            TableRelation = 
                if("Account Type" = const(Customer)) Customer
                else if("Account Type" = const(Vendor)) Vendor;
        }
        field(6; Restrict; Boolean)
        {
            CaptionML = ENU='Restrict',KOR='';
            DataClassification = CustomerContent;
        }
        field(7; Prohibit; Boolean)
        {
            CaptionML = ENU='Prohibit',KOR='';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Item No.","Account Type","Account No.")
        {
            Clustered = true;
        }
    }
    
}
