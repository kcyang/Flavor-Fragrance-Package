page 55023 "QC Measure Option"
{

    CaptionML = ENU='QC Mesure Option',KOR='QC 측정결과옵션';
    PageType = ListPart;
    SourceTable = "Quality Control Option";
    DelayedInsert = true;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(MeasureCode; Rec."Measure Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Code; Rec."Option Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Pass; Rec.Pass)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
