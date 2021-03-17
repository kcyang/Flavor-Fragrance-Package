tableextension 55016 "Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        field(55100; "QC Required"; Boolean)
        {
            Caption = 'QC Required';
            DataClassification = ToBeClassified;
        }
        field(55101; "QC Compliance"; Enum "Quality Control Compliance")
        {
            Caption = 'QC Compliance';
            DataClassification = ToBeClassified;
        }
        field(55102; "QC Non Compliance"; Boolean)
        {
            Caption = 'QC Non Compliance';
            DataClassification = ToBeClassified;
        }
    }
}
