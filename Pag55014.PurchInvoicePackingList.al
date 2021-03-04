page 55014 "Purchase Invoice Packing List"
{
    
    CaptionML = ENU='Purchase Packing List',KOR='매출용기목록'; 
    PageType = List;
    SourceTable = "Purch. Inv. Line";
    SourceTableView = SORTING("Document No.","Line No.") ORDER(Ascending) WHERE(Type=FILTER(Item));
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = false;
    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
/*                
                field("Whse. Outstanding Qty. (Base)"; Rec."Whse. Outstanding Qty. (Base)")
                {
                    CaptionML = ENU='Required Qty.',KOR='요청된 수량';
                    ApplicationArea = All;
                }
*/                
                field("Line No."; Rec."Line No.")
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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(LineTotalNetWeight;LineTotalNetWeight)
                {
                    CaptionML = ENU='Line Total Net Weight',KOR='라인 순 중량';
                    ApplicationArea = All;
                }
                field(LineTotalGrossWeight;LineTotalGrossWeight)
                {
                    CaptionML = ENU='Line Total Gross Weight',KOR='라인 총 중량';
                    ApplicationArea = All;
                }
            }

            part(SalesPacking; "Packing Sub")
            {
                ApplicationArea = All;
                SubPageLink = "Document Type"=const(Purchase),"Document No."=FIELD("Order No."),"Document Line No."=FIELD("Order Line No.");
                UpdatePropagation = Both;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        PackingInfo: Record "Packing Information";
    begin
        LineTotalGrossWeight := 0;
        LineTotalNetWeight := 0;
        //순중량,총중량 계산해서 넣기.
        PackingInfo.Reset();
        PackingInfo.SetRange("Document Type",PackingInfo."Document Type"::Purchase);
        PackingInfo.SetRange("Document No.",Rec."Order No.");
        PackingInfo.SetRange("Document Line No.",Rec."Order Line No.");
        if PackingInfo.FindSet() then
        begin
            repeat
                LineTotalGrossWeight += PackingInfo."Gross Weight";
                LineTotalNetWeight += PackingInfo."Net Weight";
            until PackingInfo.Next() = 0;
        end;
    end;
    var
        LineTotalNetWeight: Decimal;
        LineTotalGrossWeight: Decimal;
}
