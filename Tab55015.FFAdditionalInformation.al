table 55015 "FF Additional Information"
{
    Caption = 'Frangrance Additional Information';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(2;StockCategory;Text[3])
        {
            DataClassification = CustomerContent;
        }
        field(3;StockCode;Text[5])
        {
            DataClassification = CustomerContent;
        }
        field(4; USCASNumber; Text[12])
        {
            DataClassification = CustomerContent;
        }
        field(5; EUCASNumber; Text[14])
        {
            DataClassification = CustomerContent;
        }
        field(6; EINECSNumber; Text[12])
        {
            DataClassification = CustomerContent;
        }
        field(7; StandardDescription; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(8; INCIName; Text[60])
        {
            DataClassification = CustomerContent;
        }
        field(9; GHSClassificationCodes; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(10; GHSHazardStatements; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(11; GHSHSforLabel; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(12; CLPClassificationCodes; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(13; CLPHazardStatements; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(14; CLPHSforLabel; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(15; PrecautionaryStatements; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(16; PSforLabel; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(17; GHSSignalWord; Code[7])
        {
            DataClassification = CustomerContent;
        }
        field(18; CLPSignalWord; Code[7])
        {
            DataClassification = CustomerContent;
        }
        field(19; UNNumber; Text[10])
        {
            DataClassification = CustomerContent;
        }
        field(20; TransportHazardClass; Code[9])
        {
            DataClassification = CustomerContent;
        }
        field(21; TariffCode; Code[1])
        {
            DataClassification = CustomerContent;
        }
        field(22; RiskClassificationCodes; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(23; HazardCodes; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(24; SafetyPhrases; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(25; FlashPoint; Text[8])
        {
            DataClassification = CustomerContent;
        }
        field(26; BoilingPoint; Text[8])
        {
            DataClassification = CustomerContent;
        }
        field(27; FragranceFlavour; Code[9])
        {
            DataClassification = CustomerContent;
        }
        field(28; PhysicalState; Text[12])
        {
            DataClassification = CustomerContent;
        }
        field(29; COMPOS_DESCR; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(30; GHS_PICS; Text[40])
        {
            DataClassification = CustomerContent;
        }
        field(31; GHS_PICSCOMBO; Text[5])
        {
            DataClassification = CustomerContent;
        }
        field(32; CLP_PICS; Text[40])
        {
            DataClassification = CustomerContent;
        }
        field(33; CLP_PICSCOMBO; Text[5])
        {
            DataClassification = CustomerContent;
        }
        field(34; GHS_MFACTOR; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(35; PS_FIXED; Code[1])
        {
            DataClassification = CustomerContent;
        }
        field(36; GHS_LOWSS; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(37; GHS_LOWHAZ; Blob)
        {
            DataClassification = CustomerContent;
        }
        field(38; METHYLEUGENOL_PC; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(39; ESTRAGOLE_PC; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(40; FURFURAL_PC; Decimal)
        {
            DataClassification = CustomerContent;
        }        
        field(100; Description; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where ("No." = field("Item No.")));
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
    
}
