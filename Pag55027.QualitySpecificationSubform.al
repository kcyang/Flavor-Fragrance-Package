page 55027 "Quality Specification Subform"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    Caption = 'Quality Specification Subform';
    PageType = ListPart;
    SourceTable = "Quality Specification Line";
    
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
                field("Line No.";"Line No.")
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
                field("Quality Method"; Rec."Quality Method")
                {
                    ApplicationArea = All;
                }
                field("Method Description"; Rec."Method Description")
                {
                    ApplicationArea = All;
                }
                field(Conditions; Rec.Conditions)
                {
                    ApplicationArea = All;
                }
                field("Result Type"; Rec."Result Type")
                {
                    ApplicationArea = All;
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
            }
        }
    }
    
}
