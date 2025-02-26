using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace OLA_1_DB.Entities;


public class TournamentRegistration
{
    [Key]
    public int TournamentRegistration_Id { get; set; }
    [NotNull]
    public Tournament Tournament_ { get; set; }
    [NotNull]
    public Player Player_ { get; set; }
    [NotNull]
    public DateTime Registered_At { get; set; }
    
    public TournamentRegistration()
    {
    }
}