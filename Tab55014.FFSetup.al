table 55014 "FF Setup"
{
    Caption = 'FF Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Raw Material Inv Posting Grp"; Code[20])
        {
            CaptionML = ENU='Raw Material Inv Posting Filter',KOR='원재료 기본필터';
            DataClassification = CustomerContent;
        }
        field(3; "Gen.Bus.Posting Group Etc"; Code[20])
        {
            CaptionML = ENU='Raw Meterial Bus.Posting Grp Transf. Filter',KOR='원재료 타계정대체 Bus.Posting 그룹필터';
            DataClassification = CustomerContent;            
        }
        field(4; SimulationRates; Decimal)
        {
            CaptionML = ENU='Simulation Rates',KOR='시뮬레이션 용도 비율.';
            DataClassification = CustomerContent;            
        }
        field(5; "Production Inv Posting Grp"; Code[20])
        {
            CaptionML = ENU='Production Inv Posting Grp Filter',KOR='완제품 기본필터';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    
}
