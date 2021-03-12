tableextension 55012 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(55000; "BL No."; Code[20])
        {
            Caption = 'BL No.';
            DataClassification = CustomerContent;
            TableRelation = "Bill of Landing";
        }
        field(55001;ETD; Date)
        {
            Caption = 'ETD';
            DataClassification = CustomerContent;
        }
        field(55002;ETA; Date)
        {
            Caption = 'ETA';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(BL;"BL No.")
        {
            
        }
    }
}
