page 55024 "QC Requirements"
{
    
    CaptionML = ENU='QC Requirements',KOR='QC 필수항목정의';
    PageType = List;
    SourceTable = "Quality Control Requirements";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Quality Testing Required"; Rec."Quality Testing Required")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
