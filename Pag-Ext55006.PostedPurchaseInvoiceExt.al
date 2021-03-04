pageextension 55006 "Posted Purchase Invoice Ext." extends "Posted Purchase Invoice"
{
    actions 
    {
        addfirst(processing)
        {
            action(packinginfo)
            {
                ApplicationArea = All;
                CaptionML = ENU='Packing Information',KOR='패킹 정보';
                RunObject = page "Purchase Invoice Packing List";
                RunPageLink = "Document No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = WarehouseRegisters;
            }
        }
    }    
}
