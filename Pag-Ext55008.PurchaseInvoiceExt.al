pageextension 55008 "Purchase Invoice Ext." extends "Purchase Invoice"
{
    layout
    {
        addlast("Foreign Trade")
        {
            group(BL)
            {
                Caption = 'B/L';
                field(ETD;ETD)
                {
                    ApplicationArea = All;
                }
                field(ETA;ETA)
                {
                    ApplicationArea = All;
                }
                field("BL No.";"BL No.")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
        }    
    }
}
