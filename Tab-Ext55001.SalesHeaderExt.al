tableextension 55001 "Sales Header Ext." extends "Sales Header"
{
    fields
    {
        field(55000; isRelatedSample; Boolean)
        {
            CaptionML = ENU='isRelatedSample',KOR='샘플관련';
            DataClassification = CustomerContent;
        }
    }
}
