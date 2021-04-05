page 55043 "FF Item Additional Information"
{

    Caption = 'FF Item Additional Information';
    PageType = Card;
    SourceTable = "FF Additional Information";
    DataCaptionFields = "Item No.";
    PopulateAllFields = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Item Information';
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Information)
            {
                CaptionML = ENU = 'Additional Information', KOR = '추가 정보';
                field(StockCategory; Rec.StockCategory)
                {
                    ApplicationArea = All;
                }
                field(StockCode; Rec.StockCode)
                {
                    ApplicationArea = All;
                }
                field(USCASNumber; Rec.USCASNumber)
                {
                    ApplicationArea = All;
                }
                field(EUCASNumber; Rec.EUCASNumber)
                {
                    ApplicationArea = All;
                }
                field(EINECSNumber; Rec.EINECSNumber)
                {
                    ApplicationArea = All;
                }
                field(INCIName; Rec.INCIName)
                {
                    ApplicationArea = All;
                }
                field(GHSClassificationCodes; Rec.GHSClassificationCodes)
                {
                    ApplicationArea = All;
                }
                field(GHSHazardStatements; Rec.GHSHazardStatements)
                {
                    ApplicationArea = All;
                }
                field(GHSHSforLabel; Rec.GHSHSforLabel)
                {
                    ApplicationArea = All;
                }
                field(PrecautionaryStatements; Rec.PrecautionaryStatements)
                {
                    ApplicationArea = All;
                }
                field(PSforLabel; Rec.PSforLabel)
                {
                    ApplicationArea = All;
                }
                field(GHSSignalWord; Rec.GHSSignalWord)
                {
                    ApplicationArea = All;
                }
                field(CLPSignalWord; Rec.CLPSignalWord)
                {
                    ApplicationArea = All;
                }
                field(UNNumber; Rec.UNNumber)
                {
                    ApplicationArea = All;
                }
                field(TransportHazardClass; Rec.TransportHazardClass)
                {
                    ApplicationArea = All;
                }
                field(TariffCode; Rec.TariffCode)
                {
                    ApplicationArea = All;
                }
                field(RiskClassificationCodes; Rec.RiskClassificationCodes)
                {
                    ApplicationArea = All;
                }
                field(HazardCodes; Rec.HazardCodes)
                {
                    ApplicationArea = All;
                }
                field(SafetyPhrases; Rec.SafetyPhrases)
                {
                    ApplicationArea = All;
                }
                field(FlashPoint; Rec.FlashPoint)
                {
                    ApplicationArea = All;
                }
                field(BoilingPoint; Rec.BoilingPoint)
                {
                    ApplicationArea = All;
                }
                field(FragranceFlavour; Rec.FragranceFlavour)
                {
                    ApplicationArea = All;
                }
                field(PhysicalState; Rec.PhysicalState)
                {
                    ApplicationArea = All;
                }
                field(COMPOS_DESCR; Rec.COMPOS_DESCR)
                {
                    ApplicationArea = All;
                }
                field(GHS_PICS; Rec.GHS_PICS)
                {
                    ApplicationArea = All;
                }
                field(GHS_PICSCOMBO; Rec.GHS_PICSCOMBO)
                {
                    ApplicationArea = All;
                }
                field(CLP_PICS; Rec.CLP_PICS)
                {
                    ApplicationArea = All;
                }
                field(CLP_PICSCOMBO; Rec.CLP_PICSCOMBO)
                {
                    ApplicationArea = All;
                }
                field(GHS_MFACTOR; Rec.GHS_MFACTOR)
                {
                    ApplicationArea = All;
                }
                field(PS_FIXED; Rec.PS_FIXED)
                {
                    ApplicationArea = All;
                }
                field(GHS_LOWSS; Rec.GHS_LOWSS)
                {
                    ApplicationArea = All;
                }
                field(GHS_LOWHAZ; Rec.GHS_LOWHAZ)
                {
                    ApplicationArea = All;
                }
                field(METHYLEUGENOL_PC; Rec.METHYLEUGENOL_PC)
                {
                    ApplicationArea = All;
                }
                field(ESTRAGOLE_PC; Rec.ESTRAGOLE_PC)
                {
                    ApplicationArea = All;
                }
                field(FURFURAL_PC; Rec.FURFURAL_PC)
                {
                    ApplicationArea = All;
                }
                field(CLPClassificationCodes; Rec.CLPClassificationCodes)
                {
                    ApplicationArea = All;
                }
                field(CLPHazardStatements; Rec.CLPHazardStatements)
                {
                    ApplicationArea = All;
                }
                field(CLPHSforLabel; Rec.CLPHSforLabel)
                {
                    ApplicationArea = All;
                }
                field(StandardDescription; Rec.StandardDescription)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Description);
    end;
}
