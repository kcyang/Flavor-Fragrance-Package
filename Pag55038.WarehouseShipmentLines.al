page 55038 "Warehouse Shipment Lines"
{
    
    ApplicationArea = All;
    CaptionML = ENU='Warehouse Shipment Lines',KOR='📦 창고출고라인목록';
    PageType = List;
    SourceTable = "Warehouse Shipment Line";
    UsageCategory = Lists;
    SourceTableView = SORTING("No.","Line No.") ORDER(Ascending);
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
    
}
