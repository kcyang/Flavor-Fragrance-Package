page 55042 "Posted Whse Shipment Lines"
{
    
    ApplicationArea = All;
    Caption = 'Posted Whse Shipment Lines';
    PageType = List;
    SourceTable = "Posted Whse. Shipment Line";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;
    PromotedActionCategories = 'Navigation,Process,Report';

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Source No."; Rec."Source No.")
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
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = All;
                }
                field("Source Document"; Rec."Source Document")
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
                field(Quantity; Rec.Quantity)
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
            action(openDocument)
            {
                ApplicationArea = All;
                CaptionML = ENU='Open Shipment Doc.',KOR='문서열기';
                Image = PostedShipment;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    ShipmentHdr : Record "Posted Whse. Shipment Header";
                    ShipmentDocument : Page "Posted Whse. Shipment";
                begin
                    ShipmentHdr.Reset();
                    ShipmentHdr.SetRange("No.",Rec."No.");
                    if ShipmentHdr.Find('-') then
                    begin
                        ShipmentDocument.SetTableView(ShipmentHdr);
                        ShipmentDocument.Run();
                    end;
                end;
            }
        }
    }
}
