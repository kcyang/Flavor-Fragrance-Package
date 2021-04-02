page 55038 "Warehouse Shipment Lines"
{

    ApplicationArea = All;
    CaptionML = ENU = 'Warehouse Shipment Lines', KOR = '📦 창고출고라인목록';
    PageType = List;
    SourceTable = "Warehouse Shipment Line";
    UsageCategory = Lists;
    SourceTableView = SORTING("No.", "Line No.") ORDER(Ascending);
    PromotedActionCategories = 'Navigation,Process,Report';
    InsertAllowed = false;
    //DeleteAllowed = false;    

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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; Rec."Shipment Date")
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
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = All;
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = All;
                }
                field("Source Document"; Rec."Source Document")
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
                CaptionML = ENU = 'Show Document', KOR = '출고문서보기';
                ApplicationArea = All;
                RunObject = page "Warehouse Shipment";
                RunPageLink = "No." = field("No.");
                Image = ViewOrder;
                Promoted = true;
                PromotedIsBig = true;
            }
            action(showShipInfor)
            {
                CaptionML = ENU = 'Show Shipment Information', KOR = '출고정보보기';
                ApplicationArea = All;
                RunObject = page "Warehouse Shimment Information";
                RunPageLink = "No." = field("No.");
                Image = Shipment;
                Promoted = true;
                PromotedIsBig = true;
            }            
            action(showSourceLine)
            {
                CaptionML = ENU = 'Show Source Lines', KOR = '주문라인보기';
                ApplicationArea = All;
                Image = ShowList;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    WMSMgt: Codeunit "WMS Management";
                begin
                    WMSMgt.ShowSourceDocLine("Source Type", "Source Subtype", "Source No.", "Source Line No.", 0);
                end;
            }
            action(Packing)
            {
                CaptionML = ENU = 'Packing Information', KOR = '패키징 정보';
                ApplicationArea = All;
                RunObject = page "Sales Packing List";
                RunPageLink = "Document Type" = field("Source Type"), "Document No." = field("Source No."), "Line No." = field("Source Line No.");
                Image = CalculateWarehouseAdjustment;
                Promoted = true;
                PromotedIsBig = true;
            }
        }
        area(Processing)
        {
            action(PostReceipt)
            {
                CaptionML = ENU='Post Shipment',KOR='출고 전기';
                Image = PostedShipment;
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    WhseShptLine : Record "Warehouse Shipment Line";
                    WhsePostShptYesNo : Codeunit "Whse.-Post Shipment (Yes/No)";
                begin
                    WhseShptLine.COPY(Rec);
                    WhsePostShptYesNo.RUN(WhseShptLine);
                    Rec.RESET;
                    Rec.SETCURRENTKEY("No.","Sorting Sequence No.");
                    CurrPage.UPDATE(FALSE);
                end;
            }
        }
    }

}
