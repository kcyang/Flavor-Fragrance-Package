/// <summary>
/// 영업 채권설정에, 샘플요청에 대한 번호시리즈를 추가합니다.
/// </summary>
pageextension 55000 "Sales & Receivables Setup Ext." extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Sample Request Nos";Rec."Sample Request Nos")
            {
                CaptionML = ENU = 'Sample Request Nos.', KOR = '샘플요청 번호시리즈.';
                ApplicationArea = All;
                Importance = Promoted;
            }
        }
    }
}
