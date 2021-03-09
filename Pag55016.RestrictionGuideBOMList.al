page 55016 "Restriction Guide - BOM List"
{
    
    Caption = 'Restriction Guide - BOM List';
    PageType = ListPart;
    SourceTable = "Production BOM Line";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
