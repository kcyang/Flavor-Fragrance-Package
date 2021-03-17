page 55026 "Quality Specification"
{
    
    Caption = 'Quality Specification';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report';
    RefreshOnActivate = true;
    SourceTable = "Quality Specification Header";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Spec No."; Rec."Spec No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            part(SpecLines; "Quality Specification Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("Spec No.");
                UpdatePropagation = Both;
            }            
        }
    }
}
