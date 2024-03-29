tableextension 55007 "Sales Invoice Line Ext" extends "Sales Invoice Line"
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
        field(55100; isSample; Boolean)
        {
            Caption = 'from Sample';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header".isRelatedSample where("No."=field("Document No."))); 
        }
    }
}
