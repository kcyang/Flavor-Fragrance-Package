page 55032 "Sales Order Status"
{
    
    ApplicationArea = All;
    CaptionML = ENU='Sales Order Status',KOR='매출주문현황';
    PageType = List;
    SourceTable = "Sales Line";
    UsageCategory = Lists;
    PromotedActionCategories = 'New,Process,Report';
    SourceTableView = SORTING("Document Type","Document No.","Line No.") ORDER(Ascending) WHERE(Type=CONST(Item),"Completely Shipped"=CONST(false),"Document Type"=CONST(Order));

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Date";SalesHeader."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Order Date";SalesHeader."Order Date")
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Name";SalesHeader."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Name";SalesHeader."Bill-to Name")
                {
                    ApplicationArea = All;
                }
                field(ShipToCode;SalesHeader."Ship-to Code")
                {
                    ApplicationArea = All;
                }
                field(ShiptoName;SalesHeader."Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
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
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(OpenDocument)
            {
                ApplicationArea = All;
                CaptionML = ENU='Open Document',KOR='문서열기';
                Promoted = true;
                PromotedIsBig = true;
                Image = ViewOrder;
                RunObject = page "Sales Order";
                RunPageLink = "No." = field("Document No.");
            }
            action(LineSimulation)
            {
                ApplicationArea = All;
                CaptionML = ENU='Simulation',KOR='Simulation';
                Promoted = true;
                PromotedIsBig = true;
                Image = BOMLedger;
                RunObject = page "Sales Line Simulation ";
                RunPageLink = "Document Type"=FIELD("Document Type"),"Document No."=FIELD("Document No."),"Line No."=FIELD("Line No.");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Document No." <> SalesHeader."No." then 
        begin
            SalesHeader.Reset();
            SalesHeader.SetRange("No.",Rec."Document No.");
            SalesHeader.Find('-');
        end;


    end;

    var
/*        DocumentDate : Date;
        OrderDate: Date;
        SelltoName: Text[250];
        BilltoName: Text[250];
        ShiptoCode: Code[10];
        ShiptoName: Text[250];
*/        SalesHeader: Record "Sales Header";
    
}
