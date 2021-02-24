tableextension 55006 "Sales Line Ext." extends "Sales Line"
{
    fields
    {
        field(55000; Application; Code[20])
        {
            Caption = 'Application';
            DataClassification = CustomerContent;
            TableRelation = "FF Code".Code where(Type = const(Application));
        }
        field(55001; Direction; Code[20])
        {
            Caption = 'Direction';
            DataClassification = CustomerContent;
            TableRelation = "FF Code".Code where(Type = const(Direction));
        }
    }
}
