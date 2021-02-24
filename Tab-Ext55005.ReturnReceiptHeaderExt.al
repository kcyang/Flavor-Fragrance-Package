tableextension 55005 "Return Receipt Header Ext." extends "Return Receipt Header"
{
    fields
    {
        field(55000; isRelatedSample; Boolean)
        {
            Caption = 'isRelatedSample';
            DataClassification = CustomerContent;
        }
    }
}
