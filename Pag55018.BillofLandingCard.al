page 55018 "Bill of Landing Card"
{
    
    CaptionML = ENU='B/L Card',KOR='B/L 카드';
    PageType = Card;
    SourceTable = "Bill of Landing";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("BL No."; Rec."BL No.")
                {
                    ApplicationArea = All;
                }
                field("BL Date"; Rec."BL Date")
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
                field("Ship Date"; Rec."Ship Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            group(Import)
            {
                field("Import Reference No.";"Import Reference No.")
                {
                    ApplicationArea = All;
                }
                field("Import Reference Date";"Import Reference Date")
                {
                    ApplicationArea = All;
                }
                field("Import Refefence Remark";"Import Refefence Remark")
                {
                    ApplicationArea = All;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Currency Exch. Rates";"Currency Exch. Rates")
                {
                    ApplicationArea = All;
                }
                field("Amount (FCY)";"Amount (FCY)")
                {
                    ApplicationArea = All;
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                    ApplicationArea = All;
                }
            }
            group(history)
            {
                Editable = false;
                field("Purch. Receipt No Count";"Purch. Receipt No Count")
                {
                    ApplicationArea = All;
                }
                field("Purch. Cr. Memo Count";"Purch. Cr. Memo Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
