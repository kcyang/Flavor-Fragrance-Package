page 55031 "Item Ledger LotSerial List"
{
    
    ApplicationArea = All;
    Caption = 'Item Ledger LotSerial List';
    PageType = List;
    SourceTable = "Item Ledger Entry";
    UsageCategory = Lists;
    Editable = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ApplicationArea = All;
                }
                field("QC Required"; Rec."QC Required")
                {
                    ApplicationArea = All;
                }
                field("QC Compliance"; Rec."QC Compliance")
                {
                    ApplicationArea = All;
                }
                field("QC Non Compliance"; Rec."QC Non Compliance")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
