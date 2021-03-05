tableextension 55009 "Production BOM Line Ext." extends "Production BOM Line"
{
    fields
    {
        field(55000; "Maxing Ratio"; Decimal)
        {
            CaptionML = ENU='Maxing Ratio',KOR='배합 비율';
            DataClassification = CustomerContent;
        }
        field(55001; "Manufacturer Code"; Code[20])
        {
            CaptionML = ENU='Manufacturer Code',KOR='제조처 코드';
            DataClassification = CustomerContent;
        }
        field(55002; "Report Name"; Text[250])
        {
            CaptionML = ENU='Report Name',KOR='보고서 적요';
            DataClassification = CustomerContent;
        }
        field(55003; "Necessary Qty"; Decimal)
        {
            CaptionML = ENU='Necessary Qty',KOR='필요량';
            DataClassification = CustomerContent;
        }
        field(55004; "Inventory Qty"; Decimal)
        {
            CaptionML = ENU='Inventory Qty',KOR='재고량';
            DataClassification = CustomerContent;
        }
        field(55005; "Shortage Qty"; Decimal)
        {
            CaptionML = ENU='Shortage Qty',KOR='부족량';
            DataClassification = CustomerContent;
        }
        field(55006; FCY; Decimal)
        {
            CaptionML = ENU='FCY',KOR='외화가';
            DataClassification = CustomerContent;
        }
        field(55007; CurrencyCode; Code[10])
        {
            CaptionML = ENU='CurrencyCode',KOR='통화코드';
            DataClassification = CustomerContent;
        }
        field(55008; ExchangeRate; Decimal)
        {
            CaptionML = ENU='ExchangeRate',KOR='환율';
            DataClassification = CustomerContent;
        }
        field(55009; Tariff; Decimal)
        {
            CaptionML = ENU='Tariff',KOR='관세(원)';
            DataClassification = CustomerContent;
        }
        field(55010; TariffRate; Decimal)
        {
            CaptionML = ENU='TariffRate',KOR='관세율';
            DataClassification = CustomerContent;
        }
    }
}
