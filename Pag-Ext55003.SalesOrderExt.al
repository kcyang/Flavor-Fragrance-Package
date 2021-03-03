pageextension 55003 "Sales Order Ext." extends "Sales Order"
{
    actions 
    {
        addfirst(processing)
        {
            action(packinginfo)
            {
                ApplicationArea = All;
                CaptionML = ENU='Packing Information',KOR='패킹 정보';
                RunObject = page "Sales Packing List";
                RunPageLink = "Document No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = WarehouseRegisters;
            }
        }
    }
}
