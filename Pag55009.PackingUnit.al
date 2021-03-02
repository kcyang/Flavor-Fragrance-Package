page 55009 "Packing Unit"
{
    
    CaptionML = ENU='Packing Unit',KOR='포장 단위';
    PageType = List;
    SourceTable = "Packing Unit";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("Revision Quantity"; Rec."Revision Quantity")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
