pageextension 55011 "Inventory Setup Ext" extends "Inventory Setup"
{
    layout
    {
        addlast(content)
        {
            group(FF)
            {
                CaptionML = ENU='F&F Config',KOR='F&F 설정';
                field("Default Lot Nos";Rec."Default Lot Nos")
                {
                    ApplicationArea = All;
                }
                field("Default Item Tracking Code";Rec."Default Item Tracking Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
