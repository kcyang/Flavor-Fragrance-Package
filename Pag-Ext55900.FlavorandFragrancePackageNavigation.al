/// <summary>
/// 향료 패키지를 위한, 메뉴구성입니다.
/// </summary>
pageextension 55900 "Flavor_Fragrance Navigation" extends "Order Processor Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group("FF")
            {
                CaptionML = ENU = 'F&F', KOR = '향료패키지';
                action("Sample Request")
                {
                    CaptionML = ENU = 'Sales Sample Request', KOR = '샘플 요청';
                    RunObject = page "Sales Sample Requsts List";
                    ApplicationArea = All;
                    ToolTip = '고객의 향료샘플 요청을 처리합니다.';
                }
            }
        }
    }
}
