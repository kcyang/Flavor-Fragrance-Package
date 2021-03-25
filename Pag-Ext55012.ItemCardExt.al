pageextension 55012 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addlast(InventoryGrp)
        {
            field(Usage;Rec.Usage)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Usage Qty.";Rec."Usage Qty.")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
    }
}
