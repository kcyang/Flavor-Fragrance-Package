page 55015 "Restriction Guide"
{

    Caption = 'Restriction Guide';
    PageType = ListPlus;
    Editable = false;
    SourceTable = "Production BOM Line";

    layout
    {
        area(content)
        {
            group(BOMInformation)
            {
                field(BOMNumber; Rec."Production BOM No.")
                {
                    CaptionML = ENU = 'BOM No.', KOR = 'BOM 번호';
                    ApplicationArea = All;
                }
                field(ProhibitAccount;ProhibitAccount)
                {
                    CaptionML = ENU = 'PROHIBIT Account', KOR = 'PROHIBIT 업체';
                    ApplicationArea = All;
                }
            }
            group(BOMLists)
            {
                repeater(General)
                {
                    ShowCaption = true;
                    CaptionML = ENU = 'BOM Lists', KOR = 'BOM 목록';
                    field("No."; Rec."No.")
                    {
                        ApplicationArea = All;
                    }
                    field(Quantity; Rec.Quantity)
                    {
                        ApplicationArea = All;
                    }
                    field(Description; Rec.Description)
                    {
                        ApplicationArea = All;
                    }
                    field("Production BOM No."; Rec."Production BOM No.")
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field(ProhibitYN;ProhibitYN)
                    {
                        ApplicationArea = All;
                        Style = Attention;
                        StyleExpr = true;
                    }
                    field(RestrictionYN;RestrictionYN)
                    {
                        ApplicationArea = All;
                    }
                }
                part(AccountList; "Restriction Guide Account List")
                {
                    ApplicationArea = All;
                    Editable = false;
                    SubPageLink = "Item No." = field("No.");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        restriction: Record "Restriction Guide";
    begin
        ProhibitYN := false;
        RestrictionYN := false;

        restriction.Reset();
        restriction.SetRange("Item No.",Rec."No.");
        if restriction.FindSet() then
        begin
            repeat
                if restriction.Prohibit = true then
                begin
                    ProhibitAccount += restriction."Account No.";
                    ProhibitAccount += ' ';
                    ProhibitYN := true;
                end;
                if restriction.Restrict = true then
                    RestrictionYN := true;
            until restriction.Next() = 0;
        end;
    end;
    var
        ProhibitAccount: Text;
        ProhibitYN: Boolean;
        RestrictionYN: Boolean;
}
