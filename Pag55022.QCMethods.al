page 55022 "QC Methods"
{
    
    Caption = 'QC Methods';
    PageType = List;
    SourceTable = "Quality Control Code";
    SourceTableView = where(Type = const(Method));
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
