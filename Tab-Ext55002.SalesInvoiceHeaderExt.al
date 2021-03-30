tableextension 55002 "Sales Invoice Header Ext." extends "Sales Invoice Header"
{
    fields
    {
        field(55000; isRelatedSample; Boolean)
        {
            Caption = 'isRelatedSample';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(samplekey; isRelatedSample){}
    }
}
