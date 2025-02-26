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
        // Tournament foreign key configuration
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Tournament_)
            .WithMany(t => t.Matches)
            .HasForeignKey("tournament_id")
            .OnDelete(DeleteBehavior.Restrict);

        // Player1 foreign key configuration
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player1_)
            .WithMany(p => p.MatchesAsPlayer1)
            .HasForeignKey("player1_id")
            .OnDelete(DeleteBehavior.Restrict);

        // Player2 foreign key configuration
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player2_)
            .WithMany(p => p.MatchesAsPlayer2)
            .HasForeignKey("player2_id")
            .OnDelete(DeleteBehavior.Restrict);

        // Winner foreign key configuration
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Winner_)
            .WithMany(p => p.MatchesWon)
            .HasForeignKey("winner_id")
            .OnDelete(DeleteBehavior.Restrict);
    }

}