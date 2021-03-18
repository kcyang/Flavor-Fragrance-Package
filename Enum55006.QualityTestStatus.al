enum 55006 "Quality Test Status"
{
    Extensible = true;
    
    value(0; New)
    {
        Caption = 'New';
    }
    value(1; "Ready for Testing")
    {
        Caption = 'Ready for Testing';
    }
    value(2; "In-Process")
    {
        Caption = 'In-Process';
    }
    value(3; "Ready for Review")
    {
        Caption = 'Ready for Review';
    }
    value(4; Certified)
    {
        Caption = 'Certified';
    }
    value(5; Rejected)
    {
        Caption = 'Rejected';
    }
    value(6; Closed)
    {
        Caption = 'Closed';
    }
    
}
