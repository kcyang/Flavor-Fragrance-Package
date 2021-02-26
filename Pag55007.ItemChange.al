page 55007 "Item Change"
{
    
    Caption = 'Item Change';
    PageType = StandardDialog;
    SourceTable = "Sales Line";
    SourceTableView = SORTING("Document Type","Document No.","Line No.") ORDER(Ascending);
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Editable = false;                    
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Editable = false;                    
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                    Editable = false;                    
                }
                field(NewItemNo;NewItemNo)
                {
                    CaptionML = ENU='New Item No.',KOR='변경할 품목번호';
                    TableRelation = Item."No.";
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        // Sample에서 제품으로 변경
        IF CloseAction = ACTION::OK THEN BEGIN
        //MESSAGE('Call funciton on sales line table');
        IF NewItemNo <> '' THEN
            ChangeItemFromSampleToProduct(Rec, NewItemNo)
        ELSE
            ERROR('변경할 품번을 입력하세요!');
        END;
    end;
    local procedure ChangeItemFromSampleToProduct(var SalesLine:Record "Sales Line";NewItemNo:Code[20])
    var
        SalesLineWork: Record "Sales Line";
        Item: Record Item;
    begin
        // 샘플 송장에서 품목 변경시 SAMPLE을 제품으로 변경해주는 코드
        //old 정보 삭제
        SalesLineWork.RESET;
        SalesLineWork.SETRANGE("Document Type", SalesLine."Document Type");
        SalesLineWork.SETRANGE("Document No.", SalesLine."Document No.");
        SalesLineWork.SETRANGE("Line No.", SalesLine."Line No.");
        IF SalesLineWork.FINDSET THEN
            DELETEALL;

        //새로운 품목 번호로 한줄 생성 후 old 정보 복사(위치, 가격, )
        Item.GET(NewItemNo);

        SalesLineWork.INIT;
        SalesLineWork.TRANSFERFIELDS(SalesLine);
        SalesLineWork.VALIDATE("No.", NewItemNo);
        SalesLineWork.VALIDATE("Unit of Measure Code", SalesLine."Unit of Measure Code");
        SalesLineWork.VALIDATE("Location Code", SalesLine."Location Code");
        SalesLineWork.VALIDATE(Quantity, SalesLine.Quantity);
        SalesLineWork.VALIDATE("Qty. to Ship", SalesLine.Quantity);
        SalesLineWork.VALIDATE("Unit Price", SalesLine."Unit Price");
        SalesLineWork.VALIDATE("Unit Cost (LCY)", SalesLine."Unit Cost (LCY)");
        SalesLineWork.VALIDATE(Application, SalesLine.Application);
        SalesLineWork.VALIDATE(Direction, SalesLine.Direction);
        SalesLineWork."Blanket Order No." := SalesLine."Blanket Order No.";
        SalesLineWork."Blanket Order Line No." := SalesLine."Blanket Order Line No.";

/*
        //TODO 나중에, Sales Line에 Note,Type 추가 후 추가할 것.
        IF LPRE_SalesLine.B_Note <> '' THEN
            SalesLineWork.VALIDATE(B_Note, SalesLine.B_Note)
        ELSE
            SalesLineWork.VALIDATE(B_Note, Item.D_Note);
        IF SalesLine.B_Type <> '' THEN
            SalesLineWork.VALIDATE(B_Type, SalesLine.B_Type)
        ELSE
            SalesLineWork.VALIDATE(B_Type, Item.D_Type);
*/
        SalesLineWork.INSERT;
        COMMIT;
    end;
    var
        NewItemNo: Code [20];
    
}
