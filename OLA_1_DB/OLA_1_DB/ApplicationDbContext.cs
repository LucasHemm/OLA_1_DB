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
            .HasOne(m => m.Tournament_)
            .WithMany(t => t.Matches) // Ensure Tournament has a Matches collection
            .OnDelete(DeleteBehavior.Restrict);

        // Disable cascade delete on the Player1 relationship
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player1_)
            .WithMany(p => p.MatchesAsPlayer1) // Ensure Player has a MatchesAsPlayer1 collection
            .OnDelete(DeleteBehavior.Restrict);

        // Disable cascade delete on the Player2 relationship
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Player2_)
            .WithMany(p => p.MatchesAsPlayer2) // Ensure Player has a MatchesAsPlayer2 collection
            .OnDelete(DeleteBehavior.Restrict);

        // Optionally, disable cascade delete on the Winner relationship if desired
        modelBuilder.Entity<Match>()
            .HasOne(m => m.Winner_)
            .WithMany(p => p.MatchesWon) // Ensure Player has a MatchesWon collection
            .OnDelete(DeleteBehavior.Restrict);
    }
    public static class DbInitializer
    {
        public static void Initialize(ApplicationDbContext context)
        {
            // Ensure the database is created.
            context.Database.EnsureCreated();

            // Seed Players if none exist
            if (!context.Players.Any())
            {
                var players = new List<Player>
                {
                    new Player 
                    { 
                        Username = "PlayerOne", 
                        Email = "playerone@example.com", 
                        Ranking = 1000, 
                        Created_At = DateTime.Now.AddDays(-30) 
                    },
                    new Player 
                    { 
                        Username = "PlayerTwo", 
                        Email = "playertwo@example.com", 
                        Ranking = 1200, 
                        Created_At = DateTime.Now.AddDays(-25) 
                    },
                    new Player 
                    { 
                        Username = "PlayerThree", 
                        Email = "playerthree@example.com", 
                        Ranking = 900, 
                        Created_At = DateTime.Now.AddDays(-20) 
                    },
                    new Player 
                    { 
                        Username = "PlayerFour", 
                        Email = "playerfour@example.com", 
                        Ranking = 1100, 
                        Created_At = DateTime.Now.AddDays(-15) 
                    }
                };

                context.Players.AddRange(players);
                context.SaveChanges();
            }

            // Seed Tournaments if none exist
            if (!context.Tournaments.Any())
            {
                var tournaments = new List<Tournament>
                {
                    new Tournament 
                    { 
                        Name = "Spring Championship", 
                        Game = "League of Legends", 
                        Max_Players = 16, 
                        Start_Date = DateTime.Now.AddDays(10), 
                        Created_At = DateTime.Now.AddDays(-5) 
                    },
                    new Tournament 
                    { 
                        Name = "Summer Showdown", 
                        Game = "CS:GO", 
                        Max_Players = 8, 
                        Start_Date = DateTime.Now.AddDays(20), 
                        Created_At = DateTime.Now.AddDays(-3) 
                    },
                    new Tournament 
                    { 
                        Name = "Autumn Brawl", 
                        Game = "Dota 2", 
                        Max_Players = 12, 
                        Start_Date = DateTime.Now.AddDays(40), 
                        Created_At = DateTime.Now.AddDays(-2) 
                    }
                };

                context.Tournaments.AddRange(tournaments);
                context.SaveChanges();
            }

            // Seed Tournament Registrations if none exist
            if (!context.TournamentRegistrations.Any())
            {
                // Retrieve players and tournaments using LINQ
                var playerOne = context.Players.First(p => p.Username == "PlayerOne");
                var playerTwo = context.Players.First(p => p.Username == "PlayerTwo");
                var playerThree = context.Players.First(p => p.Username == "PlayerThree");
                var playerFour = context.Players.First(p => p.Username == "PlayerFour");

                var tournamentSpring = context.Tournaments.First(t => t.Name == "Spring Championship");
                var tournamentSummer = context.Tournaments.First(t => t.Name == "Summer Showdown");

                var registrations = new List<TournamentRegistration>
                {
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSpring, 
                        Player_ = playerOne, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    },
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSpring, 
                        Player_ = playerTwo, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    },
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSpring, 
                        Player_ = playerThree, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    },
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSummer, 
                        Player_ = playerOne, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    },
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSummer, 
                        Player_ = playerTwo, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    },
                    new TournamentRegistration 
                    { 
                        Tournament_ = tournamentSummer, 
                        Player_ = playerFour, 
                        Registered_At = DateTime.Now.AddDays(-1) 
                    }
                };

                context.TournamentRegistrations.AddRange(registrations);
                context.SaveChanges();
            }

            // Seed Matches if none exist
            if (!context.Matches.Any())
            {
                // Retrieve required entities using LINQ
                var tournamentSpring = context.Tournaments.First(t => t.Name == "Spring Championship");
                var tournamentSummer = context.Tournaments.First(t => t.Name == "Summer Showdown");

                var playerOne = context.Players.First(p => p.Username == "PlayerOne");
                var playerTwo = context.Players.First(p => p.Username == "PlayerTwo");
                var playerThree = context.Players.First(p => p.Username == "PlayerThree");
                var playerFour = context.Players.First(p => p.Username == "PlayerFour");

                var matches = new List<Match>
                {
                    new Match 
                    { 
                        Tournament_ = tournamentSpring, 
                        Player1_ = playerOne, 
                        Player2_ = playerTwo, 
                        Winner_ = playerOne, 
                        Match_Date = DateTime.Now.AddDays(-2) 
                    },
                    new Match 
                    { 
                        Tournament_ = tournamentSpring, 
                        Player1_ = playerThree, 
                        Player2_ = playerOne, 
                        Winner_ = playerOne, 
                        Match_Date = DateTime.Now.AddDays(-1) 
                    },
                    new Match 
                    { 
                        Tournament_ = tournamentSummer, 
                        Player1_ = playerTwo, 
                        Player2_ = playerFour, 
                        Winner_ = playerFour, 
                        Match_Date = DateTime.Now.AddDays(-1) 
                    }
                };

                context.Matches.AddRange(matches);
                context.SaveChanges();
            }
        }
    }
}