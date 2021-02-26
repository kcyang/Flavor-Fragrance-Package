page 55999 "Active Session List"
{
    
    Caption = 'Active Session List';
    PageType = List;
    SourceTable = "Active Session";
    UsageCategory = Lists;
    Permissions = TableData "Active Session" = rimd;
    ApplicationArea = All;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Client Computer Name"; Rec."Client Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = All;
                }
                field("Login Datetime"; Rec."Login Datetime")
                {
                    ApplicationArea = All;
                }
                field("Server Computer Name"; Rec."Server Computer Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
