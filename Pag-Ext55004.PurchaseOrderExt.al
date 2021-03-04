pageextension 55004 "Purchase Order Ext." extends "Purchase Order"
{
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
