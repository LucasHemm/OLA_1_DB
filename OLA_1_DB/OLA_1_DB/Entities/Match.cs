using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace OLA_1_DB.Entities;

public class Match
{
    [Key]
    public int Match_Id { get; set; }
    [NotNull]
    public Tournament Tournament_ { get; set; }
    [NotNull]
    public Player Player1_ { get; set; }
    [NotNull]
    public Player Player2_ { get; set; }
    public Player Winner_ { get; set; }
    [NotNull]
    public DateTime Match_Date { get; set; }
    public Match()
    {
        
        
      
    }
}