using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OLA_1_DB.Migrations
{
    /// <inheritdoc />
    public partial class JoinTournament : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql(@"CREATE PROCEDURE joinTournament
    @tournament_id INT,
    @player_id INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO TournamentRegistrations (tournament_id, player_id, registered_at)
    VALUES (@tournament_id, @player_id, GETDATE());
END;");

        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.Sql(@"DROP PROCEDURE joinTournament");
        }
    }
}