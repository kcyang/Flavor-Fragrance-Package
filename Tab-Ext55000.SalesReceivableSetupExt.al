/// <summary>
/// 매출 및 채권설정에 샘플요청에 대한 번호시리즈를 정의하고 입력하도록 합니다.
/// </summary>
tableextension 55000 "Sales & Receivable Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(55000; "Sample Request Nos"; Code[20])
        {
            CaptionML = ENU='Sample Request Nos',KOR='샘플요청 번호시리즈';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(55001; "Sample Item No."; Code[20])
        {
            CaptionML = ENU='Sample Item No.',KOR='샘플품목번호';
            TableRelation = "Item";
            DataClassification = CustomerContent;
        }        
    }
}
