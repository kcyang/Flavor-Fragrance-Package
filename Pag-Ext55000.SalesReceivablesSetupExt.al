/// <summary>
/// 영업 채권설정에, 샘플요청에 대한 내용을 추가합니다.
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
        addlast(content)
        {
            group(Sample)
            {
                CaptionML = ENU='SAMPLE',KOR='샘플';
                field("Sample Item No.";Rec."Sample Item No.")
                {
                    CaptionML = ENU = 'Sample Item No.', KOR = '샘플품목 번호';
                    ApplicationArea = All;
                    Importance = Promoted;                    
                }
            }
        }
    }
}
