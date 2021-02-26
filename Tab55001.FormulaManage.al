table 55001 "Formula Manage"
{
    CaptionML = ENU='Formula Manage',KOR='처방 관리';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU='No.',KOR='품목번호';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            CaptionML = ENU='Description',KOR='품목적요';
            DataClassification = CustomerContent;
        }
        field(3; "Search Description"; Code[50])
        {
            CaptionML = ENU='Search Description',KOR='검색어';
            DataClassification = CustomerContent;
        }
        field(4; "Inventory Posting Group"; Code[10])
        {
            CaptionML = ENU='Inventory Posting Group',KOR='재고전기그룹';
            DataClassification = CustomerContent;
        }
        field(5; "Item Category Code"; Code[10])
        {
            CaptionML = ENU='Item Category Code',KOR='품목카테고리코드';
            DataClassification = CustomerContent;
        }
        field(6; D_LAT_COST; Decimal)
        {
            CaptionML = ENU='D_LAT_COST',KOR='최근 원가(Direct)';
            DataClassification = CustomerContent;
        }
        field(7; D_FWD_COST; Decimal)
        {
            CaptionML = ENU='D_FWD_COST',KOR='Forward Cost';
            DataClassification = CustomerContent;
        }
        field(8; D_AVE_COST; Decimal)
        {
            CaptionML = ENU='D_AVE_COST',KOR='단위 원가';
            DataClassification = CustomerContent;
        }
        field(9; APP_DESCR; Text[100])
        {
            CaptionML = ENU='APP_DESCR',KOR='Application';
            DataClassification = CustomerContent;
        }
        field(10; D_Type; Text[250])
        {
            CaptionML = ENU='D_Type',KOR='Type DE';
            DataClassification = CustomerContent;
        }
        field(11; B_Type2; Text[80])
        {
            CaptionML = ENU='B_Type2',KOR='Type Pos';
            DataClassification = CustomerContent;
        }
        field(12; ApplyName; Text[250])
        {
            CaptionML = ENU='ApplyName',KOR='향취설명서';
            DataClassification = CustomerContent;
        }
        field(13; OdorDesc; Text[250])
        {
            CaptionML = ENU='OdorDesc',KOR='적용제품 이름';
            DataClassification = CustomerContent;
        }
        field(14; TECHNOLOGIST; Text[10])
        {
            CaptionML = ENU='TECHNOLOGIST',KOR='Technologist';
            DataClassification = CustomerContent;
        }
        field(15; DATE_OF_APP; Date)
        {
            CaptionML = ENU='DATE_OF_APP',KOR='App Date';
            DataClassification = CustomerContent;
        }
        field(16; EVAL_NOTES; Text[250])
        {
            CaptionML = ENU='EVAL_NOTES',KOR='Memo DE';
            DataClassification = CustomerContent;
        }
        field(17; Note1; Text[250])
        {
            CaptionML = ENU='Note1',KOR='Note';
            DataClassification = CustomerContent;
        }
        field(18; EVAL_NOTES_POS; Text[250])
        {
            CaptionML = ENU='EVAL_NOTES_POS',KOR='Memo Pos';
            DataClassification = CustomerContent;
        }
        field(19; Concept_POS; Text[50])
        {
            CaptionML = ENU='Concept_POS',KOR='Concept_POS';
            DataClassification = CustomerContent;
        }
        field(20; Top_POS; Text[250])
        {
            CaptionML = ENU='Top_POS',KOR='Top_POS';
            DataClassification = CustomerContent;
        }
        field(21; Middle_POS; Text[250])
        {
            CaptionML = ENU='Middle_POS',KOR='Middle_POS';
            DataClassification = CustomerContent;
        }
        field(22; Base_POS; Text[250])
        {
            CaptionML = ENU='Base_POS',KOR='Base_POS';
            DataClassification = CustomerContent;
        }
        field(23; ETC_POS; Text[50])
        {
            CaptionML = ENU='ETC_POS',KOR='ETC_POS';
            DataClassification = CustomerContent;
        }
        field(24; Color_POS; Text[50])
        {
            CaptionML = ENU='Color_POS',KOR='Color_POS';
            DataClassification = CustomerContent;
        }
        field(25; DLIMONENE; Decimal)
        {
            CaptionML = ENU='DLIMONENE',KOR='위험물 함량';
            DataClassification = CustomerContent;
        }
        field(26; EU_ALLERGEN; Boolean)
        {
            CaptionML = ENU='EU_ALLERGEN',KOR='EU_ALLERGEN';
            DataClassification = CustomerContent;
        }
        field(27; HOT_ISSUE; Decimal)
        {
            CaptionML = ENU='HOT_ISSUE',KOR='HOT_ISSUE';
            DataClassification = CustomerContent;
        }
        field(28; K_REACH; Boolean)
        {
            CaptionML = ENU='K_REACH',KOR='K_REACH';
            DataClassification = CustomerContent;
        }
        field(29; Natural; Boolean)
        {
            CaptionML = ENU='Natural',KOR='Natural';
            DataClassification = CustomerContent;
        }
        field(30; N_Prohibit; Boolean)
        {
            CaptionML = ENU='N_Prohibit',KOR='N_Prohibit';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    
}
