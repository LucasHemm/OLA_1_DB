using Microsoft.EntityFrameworkCore;
using OLA_1_DB.Entities;

public class ApplicationDbContext : DbContext
{
    public DbSet<Match> Matches { get; set; }
    public DbSet<Tournament> Tournaments { get; set; }
    public DbSet<Player> Players { get; set; }
    public DbSet<TournamentRegistration> TournamentRegistrations { get; set; }
    
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {
    }
    
    public ApplicationDbContext()
    {
    }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        // Only configure SQL Server if no options are provided (to avoid overriding options in tests)
        if (!optionsBuilder.IsConfigured)
        {
            optionsBuilder.UseSqlServer("Server=localhost,1433;Database=OLA_1_DB;User Id=sa;Password=yourStrong(!)Password;TrustServerCertificate=True;");
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Disable cascade delete on the Tournament relationship
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Tournament)
            .WithMany(t => t.Matches) // Ensure Tournament has a Matches collection
            .OnDelete(DeleteBehavior.Restrict);

        // Disable cascade delete on the Player1 relationship
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player1)
            .WithMany(p => p.MatchesAsPlayer1) // Ensure Player has a MatchesAsPlayer1 collection
            .OnDelete(DeleteBehavior.Restrict);

        // Disable cascade delete on the Player2 relationship
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player2)
            .WithMany(p => p.MatchesAsPlayer2) // Ensure Player has a MatchesAsPlayer2 collection
            .OnDelete(DeleteBehavior.Restrict);

        // Optionally, disable cascade delete on the Winner relationship if desired
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Winner)
            .WithMany(p => p.MatchesWon) // Ensure Player has a MatchesWon collection
            .OnDelete(DeleteBehavior.Restrict);
    }
}