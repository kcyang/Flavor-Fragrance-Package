tableextension 55019 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(55100; "QC Required"; Boolean)
        {
            Caption = 'QC Required';
            DataClassification = ToBeClassified;
        }
    }
}
