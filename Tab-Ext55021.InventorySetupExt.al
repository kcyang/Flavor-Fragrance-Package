tableextension 55021 "Inventory Setup Ext" extends "Inventory Setup"
{
    fields
    {
        field(55000; "Default Lot Nos"; Code[20])
        {
            Caption = 'Default Lot Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(55001; "Default Item Tracking Code"; Code[10])
        {
            Caption = 'Default Item Tracking Code';
            DataClassification = CustomerContent;
            TableRelation = "Item Tracking Code";
        }
    }
}
