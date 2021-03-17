pageextension 55009 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("QC Required";"QC Required")
            {
                ApplicationArea = All;
            }
        }
    }
}
