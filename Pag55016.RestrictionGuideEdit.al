page 55016 "Restriction Guide Edit"
{
    
    CaptionML = ENU='Restriction Guide Edit',KOR='Restriction Guide 편집';
    PageType = List;
    SourceTable = "Restriction Guide";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(CAS; Rec.CAS)
                {
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
    
}
