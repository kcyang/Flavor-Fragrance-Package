tableextension 55011 "Purch. Rcpt. Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(55000; "BL No."; Code[20])
        {
            Caption = 'BL No.';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(BL;"BL No.")
        {

        }
    }
}
