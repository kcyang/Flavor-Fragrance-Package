tableextension 55022 "Warehouse Shipment Header Ext" extends "Warehouse Shipment Header"
{
    fields
    {
        field(55000; "Drum Qty"; Integer)
        {
            CaptionML = ENU='Drum Qty',KOR='드럼 수량';
            DataClassification = CustomerContent;
        }
        field(55001; "Box Qty"; Integer)
        {
            CaptionML = ENU='Box Qty',KOR='박스 수량';
            DataClassification = CustomerContent;
        }
        field(55002; "Container Qty"; Integer)
        {
            CaptionML = ENU='Container Qty',KOR='통 수량';
            DataClassification = CustomerContent;
        }
        field(55003; "Drum Amount"; Decimal)
        {
            CaptionML = ENU='Drum Amount',KOR='드럼 금액';
            DataClassification = CustomerContent;
        }
        field(55004; "Box Amount"; Decimal)
        {
            CaptionML = ENU='Box Amount',KOR='박스 금액';
            DataClassification = CustomerContent;
        }
        field(55005; "Container Amount"; Decimal)
        {
            CaptionML = ENU='Container Amount',KOR='통 금액';
            DataClassification = CustomerContent;
        }
    }
}
