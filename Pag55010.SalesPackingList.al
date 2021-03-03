page 55010 "Sales Packing List"
{
    
    CaptionML = ENU='Sales Packing List',KOR='매출용기목록'; 
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = SORTING("Document Type","Document No.","Line No.") ORDER(Ascending) WHERE(Type=FILTER(Item));
    InsertAllowed = false;
    DeleteAllowed = false;
    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Whse. Outstanding Qty. (Base)"; Rec."Whse. Outstanding Qty. (Base)")
                {
                    CaptionML = ENU='Required Qty.',KOR='요청된 수량';
                    ApplicationArea = All;
                }
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

            part(SalesPacking; "Sales Packing Sub")
            {
                ApplicationArea = All;
                SubPageLink = "Document Type"=const(Sale),"Document No."=FIELD("Document No."),"Document Line No."=FIELD("Line No.");
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
        PackingInfo.SetRange("Document Type",PackingInfo."Document Type"::Sale);
        PackingInfo.SetRange("Document No.",Rec."Document No.");
        PackingInfo.SetRange("Document Line No.",Rec."Line No.");
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
