using System.Diagnostics.CodeAnalysis;

namespace OLA_1_DB.Entities;

public class TournamentRegistration
{
    public int Id { get; set; }
    [NotNull]
    public Tournament Tournament { get; set; }
    [NotNull]
    public Player Player { get; set; }
    [NotNull]
    public DateTime RegisteredAt { get; set; }
    
    public TournamentRegistration()
    {
    }
}