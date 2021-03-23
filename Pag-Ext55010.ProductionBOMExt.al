pageextension 55010 "Production BOM Ext" extends "Production BOM"
{
    layout
    {
        addlast(General)
        {
            field("Item Category Code";Rec."Item Category Code")
            {
                ApplicationArea = All;
                Importance = Promoted;
            }
        }
        addafter(ProdBOMLine)
        {
            group(maxingratio)
            {
                CaptionML = ENU='Maxing Ratio',KOR='배합비율';
                field("Total Maxing Ratio";Rec."Total Maxing Ratio")
                {
                    ApplicationArea = All;
                }
                field("Line Total Maxing Ratio";Rec."Line Total Maxing Ratio")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Line Total Qty";Rec."Line Total Qty")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Maxing Ratio YN";Rec."Maxing Ratio YN")
                {
                    ApplicationArea = All;
                }
                field(CopyBomYN;Rec.CopyBomYN)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(division)
            {
                ApplicationArea = All;
                CaptionML = ENU='Maxing Ratio Division',KOR='배합비율분배';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ReturnCustomerBill;
                trigger OnAction()
                var
                    Item : Record Item;
                    BOMLine : Record "Production BOM Line";
                begin
                    Rec.CalcFields("Line Total Maxing Ratio");
                    BOMLine.Reset();
                    BOMLine.SetRange("Production BOM No.",Rec."No.");
                    BOMLine.SetRange("Version Code",'');
                    if BOMLine.FindSet() then
                    begin
                        repeat
                            if (BOMLine.Type = BOMLine.Type::Item) AND (BOMLine."Maxing Ratio" <> 0) then
                            begin
                                Item.Reset();
                                Item.SetRange("No.",BOMLine."No.");
                                if Item.Find('-') then
                                begin
                                    if Item."Rounding Precision" = 0 then 
                                    begin
                                        BOMLine.Validate("Quantity per",Round(BOMLine."Maxing Ratio"/"Line Total Maxing Ratio",0.00001));
                                    end else 
                                    begin
                                        BOMLine.Validate("Quantity per",Round(BOMLine."Maxing Ratio"/"Line Total Maxing Ratio",Item."Rounding Precision"));
                                    end;
                                    BOMLine.Modify();
                                end;
                            end;
                        until BOMLine.Next() = 0;
                    end;
                end;
            }
            action(createItem)
            {
                ApplicationArea = All;
                CaptionML = ENU='Create Item',KOR='품목 생성';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = NewItem;
                trigger OnAction()
                var
                    Item : Record Item;
                    ItemCard: Page "Item Card";
                    InvSetup: Record "Inventory Setup";
                begin
                    Rec.TestField("No.");
                    Rec.TestField(Description);
                    Item.Reset();
                    Item.SetRange("No.",Rec."No.");
                    if Item.FindSet() then
                    begin
                        if Dialog.Confirm(StrSubstNo('%1 품번은 이미 생성되어 있습니다. 품목카드를 여시겠습니까?',Item."No."),true) then
                        begin
                            ItemCard.SetRecord(Item);
                            ItemCard.Run();
                        end;
                    end else 
                    begin
                        Item.Init();
                        Item.Validate("No.",Rec."No.");
                        Item.Insert(true);

                        Item.Validate(Description,Rec.Description);
                        Item.Validate("Item Category Code",Rec."Item Category Code");
                        if InvSetup.Get() then
                        begin
                            if InvSetup."Default Item Tracking Code" <> '' then
                                Item.Validate("Item Tracking Code",InvSetup."Default Item Tracking Code");
                            if InvSetup."Default Lot Nos" <> '' then
                                Item.Validate("Lot Nos.",InvSetup."Default Lot Nos");
                        end;
                        Item.Modify(true);
                        Message('품목 [%1]이 생성되었습니다.',Item."No.");
                    end;
                end;
            }
            action(openitem)
            {
                ApplicationArea = All;
                CaptionML = ENU='Open Item Card',KOR='품목 카드열기';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Item;
                RunObject = page "Item Card";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}
