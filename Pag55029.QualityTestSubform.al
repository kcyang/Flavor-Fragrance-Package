page 55029 "Quality Test Subform"
{
    
    Caption = 'Quality Test Subform';
    PageType = ListPart;
    SourceTable = "Quality Test Line";
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
        
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Quality Measure"; Rec."Quality Measure")
                {
                    ApplicationArea = All;
                }
                field("Measure Description"; Rec."Measure Description")
                {
                    ApplicationArea = All;
                }
                field(Conditions; Rec.Conditions)
                {
                    ApplicationArea = All;
                }
                field("Quality Method"; Rec."Quality Method")
                {
                    ApplicationArea = All;
                }
                field("Method Description"; Rec."Method Description")
                {
                    ApplicationArea = All;
                }
                field("Test Completion"; Rec."Test Completion")
                {
                    ApplicationArea = All;
                }
                field("Result Type"; Rec."Result Type")
                {
                    ApplicationArea = All;
                }
                field("Actual Measure"; Rec."Actual Measure")
                {
                    ApplicationArea = All;
                    StyleExpr = true;
                    Style = StrongAccent;
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = All;
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = All;
                }
                field("Nominal Value"; Rec."Nominal Value")
                {
                    ApplicationArea = All;
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = All;
                    StyleExpr = true;
                    Style = StrongAccent;                    
                }
                field("Non Compliance"; Rec."Non Compliance")
                {
                    ApplicationArea = All;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
