tableextension 55008 "Production BOM Header Ext." extends "Production BOM Header"
{
    fields
    {
        field(55000; "Item Category Code"; Code[10])
        {
            CaptionML = ENU='Item Category Code',KOR='품목 카테고리 코드';
            DataClassification = CustomerContent;
        }
        field(55001; "Total Maxing Ratio"; Decimal)
        {
            CaptionML = ENU='Total Maxing Ratio',KOR='총 배합 비율';
            DataClassification = CustomerContent;
        }
        field(55002; "Technical Type"; Code[50])
        {
            CaptionML = ENU='Technical Type',KOR='기술분류';
            DataClassification = CustomerContent;
        }
        field(55003; "Report Print ID"; Code[50])
        {
            CaptionML = ENU='Report Print ID',KOR='보고서 인쇄 아이디';
            DataClassification = CustomerContent;
        }
        field(55004; "Report Print Date"; Date)
        {
            CaptionML = ENU='Report Print Date',KOR='보고서 인쇄 일자';
            DataClassification = CustomerContent;
        }
        field(55005; "Report Kor Prod. Name"; Text[50])
        {
            CaptionML = ENU='Report Kor Prod. Name',KOR='보고서 국문 제품명';
            DataClassification = CustomerContent;
        }
        field(55006; "Report Eng Prod. Name"; Text[50])
        {
            CaptionML = ENU='Report Eng Prod. Name',KOR='보고서 영문 제품명';
            DataClassification = CustomerContent;
        }
        field(55007; "Report Print Qty. To Produce"; Decimal)
        {
            CaptionML = ENU='Report Print Qty. To Produce',KOR='보고서 인쇄 생산예정 수량';
            DataClassification = CustomerContent;
        }
        field(55008; "SalesName Code"; Code[20])
        {
            CaptionML = ENU='SalesName Code',KOR='Sales Name';
            DataClassification = CustomerContent;
        }
        field(55009; Expenses; Decimal)
        {
            CaptionML = ENU='Expenses',KOR='제비용';
            DataClassification = CustomerContent;
        }
        field(55010; Application; Text[100])
        {
            CaptionML = ENU='Application',KOR='Application';
            DataClassification = CustomerContent;
        }
        field(55011; Note; Text[250])
        {
            CaptionML = ENU='Note',KOR='Note';
            DataClassification = CustomerContent;
        }
        field(55012; CompoundType; Text[250])
        {
            CaptionML = ENU='CompoundType',KOR='Compound Type';
            DataClassification = CustomerContent;
        }
        field(55013; "Request Prod. Order Qty"; Decimal)
        {
            CaptionML = ENU='Request Prod. Order Qty',KOR='생산 요청 수량';
            DataClassification = CustomerContent;
        }
        field(55014; "Maxing Ratio YN"; Boolean)
        {
            CaptionML = ENU='Maxing Ratio YN',KOR='Maxing Ratio YN';
            DataClassification = CustomerContent;
        }
        field(55015; CopyBomYN; Boolean)
        {
            CaptionML = ENU='CopyBomYN',KOR='CopyBomYN';
            DataClassification = CustomerContent;
        }
        field(55016; USD; Decimal)
        {
            CaptionML = ENU='USD',KOR='USD';
            DataClassification = CustomerContent;
        }
        field(55017; EUR; Decimal)
        {
            CaptionML = ENU='EUR',KOR='EUR';
            DataClassification = CustomerContent;
        }
        field(55018; CHF; Decimal)
        {
            CaptionML = ENU='CHF',KOR='CHF';
            DataClassification = CustomerContent;
        }
        field(55019; CNY; Decimal)
        {
            CaptionML = ENU='CNY',KOR='CNY';
            DataClassification = CustomerContent;
        }
        field(55020; JPY; Decimal)
        {
            CaptionML = ENU='JPY',KOR='JPY';
            DataClassification = CustomerContent;
        }
        field(55021; Concept_POS; Text[50])
        {
            CaptionML = ENU='Concept_POS',KOR='Concept_POS';
            DataClassification = CustomerContent;
        }
        field(55022; Top_POS; Text[250])
        {
            CaptionML = ENU='Top_POS',KOR='Top_POS';
            DataClassification = CustomerContent;
        }
        field(55023; Middle_POS; Text[250])
        {
            CaptionML = ENU='Middle_POS',KOR='Middle_POS';
            DataClassification = CustomerContent;
        }
        field(55024; Base_POS; Text[250])
        {
            CaptionML = ENU='Base_POS',KOR='Base_POS';
            DataClassification = CustomerContent;
        }
        field(55025; ETC_POS; Text[50])
        {
            CaptionML = ENU='ETC_POS',KOR='ETC_POS';
            DataClassification = CustomerContent;
        }
        field(55026; Color_POS; Text[50])
        {
            CaptionML = ENU='Color_POS',KOR='Color_POS';
            DataClassification = CustomerContent;
        }
    }
}
