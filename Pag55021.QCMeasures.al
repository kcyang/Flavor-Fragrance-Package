page 55021 "QC Measures"
{
    
    CaptionML = ENU='QC Measures',KOR='QC 측정항목';
    PageType = List;
    SourceTable = "Quality Control Code";
    SourceTableView = where(Type = const(Measure));
    
    layout
    {
        area(content)
        {
            group(MeasureGroup)
            {
                CaptionML = ENU='Measures',KOR='측정항목';
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
                    field("Result Type"; Rec."Result Type")
                    {
                        ApplicationArea = All;
                    }
                }

                part(OptionList; "QC Measure Option")
                {
                    CaptionML = ENU='Measure Option',KOR='측정결과옵션';
                    ApplicationArea = All;
                    Editable = false;
                    SubPageLink = "Measure Code" = field(Code);
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(MeasureOption)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'QC Measur Option', KOR = 'QC 측정결과옵션';
                Image = SelectField;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'QC 측정 결과 옵션을 입력합니다.';
                RunObject = page "QC Measure Option";
                RunPageLink = "Measure Code" = field(Code);
            }
        }
    }
    
}
