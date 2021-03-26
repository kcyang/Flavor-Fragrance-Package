page 55034 "Sales Line Simulation Subform"
{
        
    Caption = 'Sales Line Simulation Subform';
    PageType = ListPart;
    SourceTable = "Production BOM Line";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Version Code"; Rec."Version Code")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Maxing Ratio"; Rec."Maxing Ratio")
                {
                    ApplicationArea = All;
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ApplicationArea = All;
                }
                field("Necessary Qty"; Rec."Necessary Qty")
                {
                    ApplicationArea = All;
                }
                field("Inventory Qty"; Rec."Inventory Qty")
                {
                    ApplicationArea = All;
                }
                field("Shortage Qty"; Rec."Shortage Qty")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
