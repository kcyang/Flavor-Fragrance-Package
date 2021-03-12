pageextension 55004 "Purchase Order Ext." extends "Purchase Order"
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
    actions 
    {
        addfirst(processing)
        {
            action(packinginfo)
            {
                ApplicationArea = All;
                CaptionML = ENU='Packing Information',KOR='패킹 정보';
                RunObject = page "Purchase Packing List";
                RunPageLink = "Document No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = WarehouseRegisters;
            }
        }
    }
}
