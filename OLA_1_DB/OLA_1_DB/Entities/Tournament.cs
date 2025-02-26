using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace OLA_1_DB.Entities;
[Index(nameof(Name), IsUnique = true)]
public class Tournament
{
    public int Id { get; set; }
    [NotNull]
    public string Name { get; set; }
    [NotNull]
    public string Game { get; set; }
    [NotNull]
    public int MaxPlayers { get; set; }
    [NotNull]
    public DateTime StartDate { get; set; }
    [NotNull]
    public DateTime CreatedAt { get; set; }
    public List<Match> Matches { get; set; }
    
    public Tournament()
    {
    }
}