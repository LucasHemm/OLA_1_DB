using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace OLA_1_DB.Entities;
[Index(nameof(Name), IsUnique = true)]
public class Tournament
{
    [Key]
    public int Tournament_Id { get; set; }
    [NotNull]
    public string Name { get; set; }
    [NotNull]
    public string Game { get; set; }
    [NotNull]
    public int Max_Players { get; set; }
    [NotNull]
    public DateTime Start_Date { get; set; }
    [NotNull]
    public DateTime Created_At { get; set; }
    public List<Match> Matches { get; set; }
    
    public Tournament()
    {
    }
}