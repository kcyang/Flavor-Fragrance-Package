page 55011 "Packing Sub"
{
    
    CaptionML = ENU='Packing Sub',KOR='용기 정보';
    PageType = ListPart;
    AutoSplitKey = true;
    SourceTable = "Packing Information";
    SourceTableView = SORTING("Document No.","Document Line No.","Line No.") ORDER(Ascending);
    DelayedInsert = true;

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type";Rec."Document Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Packing Unit"; Rec."Packing Unit")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;                      
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Packing Capacity"; Rec."Packing Capacity")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;                      
                }
                field("Packing Unit Weight"; Rec."Packing Unit Weight")
                {
                    ApplicationArea = All;
                }
                field("Unit Qty."; Rec."Unit Qty.")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;                      
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    Editable = false;
                    ApplicationArea = All;                    
                }
                field("Gross Weight"; Rec."Gross Weight")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
}
