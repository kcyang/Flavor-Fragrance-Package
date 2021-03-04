pageextension 55005 "Posted Sales Invoice Ext." extends "Posted Sales Invoice"
{
    actions
    {
        addfirst(processing)
        {
            action(PackingInformation)
            {
                ApplicationArea = All;
                CaptionML = ENU='Packing Information',KOR='패킹 정보';
                RunObject = page "Sales Invoice Packing List";
                RunPageLink = "Document No." = field("No.");
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = WarehouseRegisters;
            }
        }
    }
}
