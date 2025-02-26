using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace OLA_1_DB.Entities
{
    [Index(nameof(Username), IsUnique = true)]
    [Index(nameof(Email), IsUnique = true)]
    public class Player
    {
        public int Id { get; set; }
        
        [NotNull]
        public string Username { get; set; }
        
        [NotNull]
        public string Email { get; set; }
        
        public int Ranking { get; set; }
        
        [NotNull]
        public DateTime CreatedAt { get; set; }
        
        public List<Match> MatchesAsPlayer1 { get; set; }
        
        public List<Match> MatchesAsPlayer2 { get; set; }
        
        public List<Match> MatchesWon { get; set; }
        
        public Player()
        {
        }
    }
}