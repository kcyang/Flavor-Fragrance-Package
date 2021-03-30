page 55035 "FF Setup"
{
    Caption = 'FF Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,General,Posting,Journal Templates';
    SourceTable = "FF Setup";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Raw Material Inv Posting Grp"; Rec."Raw Material Inv Posting Grp")
                {
                    ApplicationArea = All;
                }
                field("Production Inv Posting Grp";"Production Inv Posting Grp")
                {
                    ApplicationArea = All;
                }
                field("Gen.Bus.Posting Group Etc";"Gen.Bus.Posting Group Etc")
                {
                    ApplicationArea = All;
                }
                field(SimulationRates;SimulationRates)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;
    end;    
}
