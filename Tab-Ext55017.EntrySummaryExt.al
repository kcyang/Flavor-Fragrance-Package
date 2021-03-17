tableextension 55017 "Entry Summary Ext" extends "Entry Summary"
{
    fields
    {
        field(55100; "QC Non Compliance"; Boolean)
        {
            Caption = 'QC Non Compliance';
            DataClassification = ToBeClassified;
        }
        field(55101; "QC Test Exists"; Boolean)
        {
            Caption = 'QC Test Exists';
            DataClassification = ToBeClassified;
        }
        field(55102; "QC Compliance"; Code[10])
        {
            Caption = 'QC Compliance';
            DataClassification = ToBeClassified;
        }
    }
}
