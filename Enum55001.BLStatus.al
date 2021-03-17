/// <summary>
/// B/L 상태 값
/// </summary>
enum 55001 "BL Status"
{
    Extensible = true;
    
    value(0; Open)
    {
        CaptionML = ENU='Open',KOR='오픈';
    }
    value(1; Released)
    {
        CaptionML = ENU='Released',KOR='확정';
    }
    value(2; "Charge Complete")
    {
        CaptionML = ENU='Charge Complete',KOR='비용배분완료';
    }
    
}
