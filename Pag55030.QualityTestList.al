page 55030 "Quality Test List"
{
    Editable = false;
    Caption = 'Quality Test List';
    PageType = List;
    SourceTable = "Quality Test Header";
    CardPageId = "Quality Test";
    RefreshOnActivate = true;
    PromotedActionCategories = 'New,Process,Report';
    UsageCategory = Lists;    
    
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field("Lot_Serial No."; Rec."Lot_Serial No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }                
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Test Start Date"; Rec."Test Start Date")
                {
                    ApplicationArea = All;
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
