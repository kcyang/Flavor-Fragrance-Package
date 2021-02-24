page 55006 "FF Package Code"
{
    DelayedInsert = true;
    Caption = 'FF Package Code';
    PageType = List;
    SourceTable = "FF Code";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
