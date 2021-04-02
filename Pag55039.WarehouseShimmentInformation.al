page 55039 "Warehouse Shimment Information"
{
    
    Caption = 'Warehouse Shimment Information';
    PageType = Document;
    SourceTable = "Warehouse Shipment Header";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                }
                field("Drum Qty"; Rec."Drum Qty")
                {
                    ApplicationArea = All;
                }
                field("Box Qty"; Rec."Box Qty")
                {
                    ApplicationArea = All;
                }
                field("Container Qty"; Rec."Container Qty")
                {
                    ApplicationArea = All;
                }
                field("Drum Amount"; Rec."Drum Amount")
                {
                    ApplicationArea = All;
                }
                field("Box Amount"; Rec."Box Amount")
                {
                    ApplicationArea = All;
                }
                field("Container Amount"; Rec."Container Amount")
                {
                    ApplicationArea = All;
                }
            }
            part(InfoLine; "Warehouse Shpt Info Subform")
            {
                Editable = false;
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
                UpdatePropagation = Both;
            }                 
        }
    }
    
}
