page 55017 "Restriction Guide Account List"
{
    
    Caption = 'Restriction Guide Account List';
    PageType = ListPart;
    SourceTable = "Restriction Guide";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Account No."; Rec."Account No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(AccountName;AccountName)
                {
                    CaptionML = ENU='Account Name',KOR='거래처명';
                    ApplicationArea = All;
                }
                field(Prohibit; Rec.Prohibit)
                {
                    ApplicationArea = All;
                }
                field(Restrict; Rec.Restrict)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
    begin
        clear(AccountName);
        if Rec."Account Type" = Rec."Account Type"::Customer then
        begin
            Customer.Reset();
            if Customer.get(rec."Account No.") then
                AccountName := Customer.Name;
        end else if Rec."Account Type" = Rec."Account Type"::Vendor then
        begin
            Vendor.Reset();
            if Vendor.get(rec."Account No.") then
                AccountName := Vendor.Name;
        end;
    end;
    procedure setFilter(ItemNo: Code[20])
    begin
        SetRange("Item No.",ItemNo);
        CurrPage.Update();
    end;
    
    var
        AccountName: Text;
}
