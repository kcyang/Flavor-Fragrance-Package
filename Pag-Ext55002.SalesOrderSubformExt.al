pageextension 55002 "Sales Order Subform Ext." extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field(ItemDescription;ItemDescription)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        addafter("Description")
        {
            field("Description 2";"Description 2")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action(ChangeItem)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Change Sample Item', KOR = '샘플품목변경';
                Image = ChangeTo;
                ToolTipML = ENU = 'Change the sample item to new made item.', KOR = '샘플품목을 실제 생산된 품번으로 교체합니다.';
                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    Item: Page "Item Change";
                    SalesSetup: Record "Sales & Receivables Setup";
                begin
                    if Rec.Type = Rec.Type::Item then
                    begin
                        if SalesSetup.Get() then
                            if SalesSetup."Sample Item No." <> '' then
                            begin
                                if Rec."No." = SalesSetup."Sample Item No." then
                                begin
                                    CLEAR(Item);

                                    SalesLine.RESET;
                                    SalesLine.SETRANGE("Document Type", Rec."Document Type");
                                    SalesLine.SETRANGE("Document No.", Rec."Document No.");
                                    SalesLine.SETRANGE("Line No.", Rec."Line No.");
                                    Item.SETTABLEVIEW(SalesLine);
                                    Item.RUNMODAL;
                                end else 
                                    Error('샘플품목에 대해서만 진행하실 수 있습니다.!');
                            end else
                                Error('샘플품목이 정의되어 있지 않습니다.\샘플품목에 대해서만 진행하실 수 있습니다.');
                    end else 
                        Error('이 기능은 샘플품목에 대해서만 진행하실 수 있습니다.');
                end;
            }
        }
        addlast("O&rder")
        {
            //판매주문의 라인에서, 해당라인에 연관된 샘플요청서를 오픈할 수 있도록 한다.
            action(SampleRequest)
            {
                ApplicationArea = Suite;
                CaptionML = ENU = 'Sample Request', KOR = '샘플요청서';
                Image = NewOrder;
                ToolTipML = ENU = 'View the Sample request.', KOR = '연관된 샘플요청서 보기';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SampleRequestPage: Page "Sales Sample Request";
                begin
                    TestField("Blanket Order No.");
                    SalesHeader.SetRange("No.", "Blanket Order No.");
                    if not SalesHeader.IsEmpty then begin
                        SampleRequestPage.SetTableView(SalesHeader);
                        SampleRequestPage.Editable := false;
                        SampleRequestPage.Run();
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        setItemDescription();
    end;
        
    trigger OnAfterGetRecord()
    begin
        setItemDescription();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."No." <> xRec."No." then
            setItemDescription();
    end;

    //FIXME Item Reference 를 넣은 후에는, 바로 안바뀜..?
    local procedure setItemDescription()
    var
        Item: Record Item;
    begin
        //ItemDescription := '';        
        if (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') then
        begin
            Item.Reset();
            if Item.Get(Rec."No.") then
                ItemDescription := Item.Description;
        end else 
            ItemDescription := '';
    end;

 
/*    
    trigger OnModifyRecord(): Boolean
    var 
        Item: Record Item;
    begin
        ItemDescription := '';        
        if (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') then
        begin
            if Item.Get(Rec."No.") then
                ItemDescription := Item.Description;
        end else 
            ItemDescription := '';
    end;
*/
    var 
        ItemDescription: Text[100];
}
