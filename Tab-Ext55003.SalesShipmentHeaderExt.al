tableextension 55003 "Sales Shipment Header Ext" extends "Sales Shipment Header"
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
