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
    actions
    {
        addfirst(Navigation_Item)
        {
            action(additionalInformation)
            {
                ApplicationArea = All;
                CaptionML = ENU='Additional FF Infor.',KOR='향료 추가정보';
                Image = InsertFromCheckJournal;
                Promoted = true;
                PromotedIsBig = true;
//                RunObject = Page "FF Item Additional Information";
//                RunPageLink = "Item No." = field("No.");
                ToolTip = '향료 관련 추가 정보를 입력합니다.';
                trigger OnAction()
                var
                    FFAddTable: Record "FF Additional Information";
                    FFAddInfor: Page "FF Item Additional Information";
                begin
                    FFAddTable.Reset();
                    FFAddTable.SetRange("Item No.",Rec."No.");
                    if FFAddTable.FindSet() then
                    begin
                    end else 
                    begin
                        FFAddTable.Init();
                        FFAddTable."Item No." := Rec."No.";
                        FFAddTable.Insert();
                        Commit();
                    end;
                    FFAddInfor.SetRecord(FFAddTable);
                    FFAddInfor.RunModal();                       
                end;
            }
        }
    }
}
