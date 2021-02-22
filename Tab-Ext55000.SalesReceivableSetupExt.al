/// <summary>
/// 매출 및 채권설정에 샘플요청에 대한 번호시리즈를 정의하고 입력하도록 합니다.
/// </summary>
tableextension 55000 "Sales & Receivable Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(55000; "Sample Request Nos"; Code[20])
        {
            Caption = 'Sample Request Nos';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }
}
