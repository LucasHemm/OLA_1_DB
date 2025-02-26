using System.Diagnostics.CodeAnalysis;

namespace OLA_1_DB.Entities;

public class Match
{
    public int Id { get; set; }
    [NotNull]
    public Tournament Tournament { get; set; }
    [NotNull]
    public Player Player1 { get; set; }
    [NotNull]
    public Player Player2 { get; set; }
    public Player Winner { get; set; }
    [NotNull]
    public DateTime MatchDate { get; set; }
    public Match()
    {
        
        
      
    }
}