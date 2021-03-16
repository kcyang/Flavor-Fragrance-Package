page 55020 "Quality Control Config"
{
    
    CaptionML = ENU='Quality Control Config',KOR='QC 설정';
    PageType = Card;
    SourceTable = "Quality Control Config";
    AutoSplitKey = true;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("QC Test No. Series"; Rec."QC Test No. Series")
                {
                    ApplicationArea = All;
                }
                field("QC Requirements"; Rec."QC Requirements")
                {
                    ApplicationArea = All;
                }
                field("Default QC Location"; Rec."Default QC Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(QCMeasure)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'QC Measurements', KOR = 'QC 측정항목';
                Image = UnitOfMeasure;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'QC 측정항목을 입력합니다.';
                RunObject = page "QC Measures";
            }
            action(QCMethod)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'QC Method', KOR = 'QC 측정방법';
                Image = GetActionMessages;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'QC 측정방법을 입력합니다.';
                RunObject = page "QC Methods";
            }
        }
    }
    
}
