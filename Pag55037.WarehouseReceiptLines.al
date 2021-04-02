page 55037 "Warehouse Receipt Lines"
{
    
    ApplicationArea = All;
    CaptionML = ENU='Warehouse Receript Lines',KOR='📦 창고입고라인목록';
    PageType = List;
    SourceTable = "Warehouse Receipt Line";
    SourceTableView = SORTING("No.","Line No.") ORDER(Ascending);
    UsageCategory = Lists;
    PromotedActionCategories = 'Navigation,Process,Report';
    InsertAllowed = false;
    DeleteAllowed = false;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = All;
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ApplicationArea = All;
                }
                field("Source Document"; Rec."Source Document")
                {
                    ApplicationArea = All;
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Qty. to Receive"; Rec."Qty. to Receive")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(showDocument)
            {
                CaptionML = ENU='Show Document',KOR='입고문서보기';
                ApplicationArea = All;
                RunObject = page "Warehouse Receipt";
                RunPageLink = "No." = field("No.");
                Image = ViewOrder;
                Promoted = true;
                PromotedIsBig = true;
            }
            action(showSourceLine)
            {
                CaptionML = ENU='Show Source Lines',KOR='주문라인보기';
                ApplicationArea = All;
                Image = ShowList;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    WMSMgt : Codeunit "WMS Management";
                begin
                    WMSMgt.ShowSourceDocLine("Source Type","Source Subtype","Source No.","Source Line No.",0);
                end;                
            }
            action(Packing)
            {
                CaptionML = ENU='Packing Information',KOR='패키징 정보';
                ApplicationArea = All;
                RunObject = page "Purchase Packing List";
                RunPageLink = "Document Type" = field("Source Type"),"Document No." = field("Source No."),"Line No." = field("Source Line No.");
                Image = CalculateWarehouseAdjustment;
                Promoted = true;
                PromotedIsBig = true;
            }
        }
        area(Processing)
        {
            action(PostReceipt)
            {
                CaptionML = ENU='Post Receipt',KOR='입고 전기';
                Image = PostedReceipt;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    WhseRcptLine : Record "Warehouse Receipt Line";
                    WhsePostReceiptYesNo : Codeunit "Whse.-Post Receipt (Yes/No)";
                begin
                    WhseRcptLine.COPY(Rec);
                    WhsePostReceiptYesNo.RUN(WhseRcptLine);
                    Rec.RESET;
                    Rec.SETCURRENTKEY("No.","Sorting Sequence No.");
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
    }
    
}
