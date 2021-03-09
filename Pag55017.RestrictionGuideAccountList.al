page 55017 "Restriction Guide Account List"
{
    
    Caption = 'Restriction Guide Account List';
    PageType = ListPart;
    SourceTable = "Restriction Guide";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field(Prohibit; Rec.Prohibit)
                {
                    ApplicationArea = All;
                }
                field(Restrict; Rec.Restrict)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
