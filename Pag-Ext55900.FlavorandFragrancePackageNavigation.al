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
                group(Sample)
                {
                    CaptionML = ENU = 'Sample', KOR = '샘플관리';
                    action("Sample Request")
                    {
                        CaptionML = ENU = 'Sales Sample Request', KOR = '샘플 요청';
                        RunObject = page "Sales Sample Requsts List";
                        ApplicationArea = All;
                        ToolTip = '고객의 향료샘플 요청을 처리합니다.';
                    }
                    action("Sample Order")
                    {
                        CaptionML = ENU = 'Sample Order', KOR = '샘플 주문';
                        RunObject = page "Sales Sample Order List";
                        ApplicationArea = All;
                        ToolTip = '샘플요청에서 생성된 샘플주문목록입니다.';
                    }
                    action("Posted Sample Invoice")
                    {
                        CaptionML = ENU = 'Posted Sample Invoice', KOR = '전기된 샘플송장';
                        RunObject = page "Posted Sample Invoice List";
                        ApplicationArea = All;
                        ToolTip = '샘플주문에서 전기처리된 송장을 확인할 수 있습니다.';
                    }
                    action("Posted Sample Shipments")
                    {
                        CaptionML = ENU = 'Posted Sample Shipments', KOR = '전기된 샘플출고';
                        RunObject = page "Posted Sample Shipment List";
                        ApplicationArea = All;
                        ToolTip = '샘플주문에서 전기처리된 출고서를 확인할 수 있습니다.';
                    }
                }
                group(MasterManage)
                {
                    CaptionML = ENU = 'Master Management', KOR = '마스터 관리';
                    action("FF Code")
                    {
                        CaptionML = ENU = 'Package Code Management', KOR = '코드 관리';
                        RunObject = page "FF Package Code";
                        ApplicationArea = All;
                        ToolTip = '패키지에서 사용하는 코드를 관리합니다.';
                    }

                    action(FormulaManage)
                    {
                        CaptionML = ENU = 'Formula Manage', KOR = '처방 관리';
                        RunObject = page "Formula Manage";
                        ApplicationArea = All;
                        ToolTipML = KOR = '처방을 관리합니다. 자료업데이트/워험물,시뮬레이션등을 진행할 수 있습니다.';
                    }
                    action(PackingUnit)
                    {
                        CaptionML = ENU = 'Packing Unit', KOR = '포장단위 관리';
                        RunObject = page "Packing Unit";
                        ApplicationArea = All;
                        ToolTipML = KOR = '포장단위를 관리합니다.';
                    }
                }
                group(Session)
                {
                    Caption = 'Session Manage';
                    action("ActiveSession")
                    {
                        CaptionML = ENU = 'Active Session', KOR = '살아있는 세션';
                        RunObject = page "Active Session List";
                        ApplicationArea = All;
                        ToolTip = '세션을 관리합니다.';
                    }

                }
            }
        }
    }
}
